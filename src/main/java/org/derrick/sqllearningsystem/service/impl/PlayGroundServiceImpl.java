package org.derrick.sqllearningsystem.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.dockerjava.transport.DockerHttpClient;
import com.github.dockerjava.transport.DockerHttpClient.Request;
import com.github.dockerjava.transport.DockerHttpClient.Response;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.derrick.sqllearningsystem.connecter.PlaygroundConnector;
import org.derrick.sqllearningsystem.entity.ContainerInfo;
import org.derrick.sqllearningsystem.entity.PlayGroundSession;
import org.derrick.sqllearningsystem.entity.Quiz;
import org.derrick.sqllearningsystem.entity.QuizView;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.derrick.sqllearningsystem.mapper.PlayGroundMapper;
import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class PlayGroundServiceImpl implements PlayGroundService {
    private final PlayGroundMapper playGroundMapper;
    private final CredentialMapper credentialMapper;
    private final DockerHttpClient dockerHttpClient;
    private final Map<String, PlayGroundSession> playGroundSessionMap;
    private final List<ContainerInfo> containerInfoList;

    @Override
    @Deprecated
    public QuizView newPlayGround(String username, Integer lessonId) {
        // find a unused port number
        int port;
        try {
                ServerSocket serverSocket = new ServerSocket(0);
                port = serverSocket.getLocalPort();
                serverSocket.close();
            } catch (IOException e) {
                throw new IllegalStateException("No available port");
            }


        // create a new mysql container
        Request createContainerRequest = Request.builder()
                .method(Request.Method.POST)
                .path("/v1.44/containers/create")
                .putHeader("Content-Type", "application/json")
                .body(new ByteArrayInputStream(("{\"Image\":\"mysql:8.0.36-debian\",\"Env\":[\"MYSQL_ROOT_PASSWORD=123456\"],\"ExposedPorts\":{\"3306/tcp\":{}},\"HostConfig\":{\"PortBindings\":{\"3306/tcp\":[{\"HostPort\":\"" + port + "\"}]}}}").getBytes()))
                .build();

        String containerId;
        try (Response response = dockerHttpClient.execute(createContainerRequest)) {
            // get the container id
            if (response.getStatusCode() != 201) {
                throw new IllegalStateException("Failed to create container");
            }
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(IOUtils.toString(response.getBody(), StandardCharsets.UTF_8));
            containerId = jsonNode.get("Id").asText();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        // start the container
        Request startContainerRequest = Request.builder()
                .method(Request.Method.POST)
                .path("/v1.44/containers/" + containerId + "/start")
                .build();

        Response response = dockerHttpClient.execute(startContainerRequest);
        if (response.getStatusCode() != 204) {
            throw new IllegalStateException("Failed to start container");
        }

        log.info("container {} started for user {} at port {}", containerId, username, port);

        // get quiz
        Quiz quiz = playGroundMapper.getQuizByLessonIdAndLessonQuizId(lessonId, 1);

//        try {
//            Thread.sleep(5 * 1000);
//        } catch (InterruptedException e) {
//            throw new RuntimeException(e);
//        }
        // connect to the database
        PlaygroundConnector mainConnector = new PlaygroundConnector("jdbc:mysql://localhost:" + port + "/?user=root&password=123456");
        mainConnector.executeUpdate("CREATE DATABASE main_db");
        mainConnector.executeUpdate("CREATE DATABASE mirror_db");
        mainConnector.executeUpdate("USE main_db");
        PlaygroundConnector mirrorConnector = new PlaygroundConnector("jdbc:mysql://localhost:" + port + "/mirror_db?user=root&password=123456");
        PlayGroundSession playGroundSession = new PlayGroundSession(username, containerId, LocalDateTime.now().plusHours(1), port, lessonId, quiz.id(), mainConnector, mirrorConnector);
        playGroundSessionMap.put(username, playGroundSession);

        // execute the prerequisite sql
        String script = quiz.prerequisite_sql();
        if (script != null) {
            mainConnector.executeUpdate(script);
            mirrorConnector.executeUpdate(script);
        }

        // update progress of the user
        credentialMapper.updateProgressByUsername(username, lessonId);


        return new QuizView(quiz);
    }

    /**
     * delete the playground of the user
     * @param username the username of the user
     */
    @Override
    @Deprecated
    public void deletePlayGround(String username) {
        // get the container
        PlayGroundSession playGroundSession = playGroundSessionMap.get(username);

        //disconnect the connector
        playGroundSession.mainConnector().close();
        playGroundSession.mirrorConnector().close();
        // stop the container
        Request stopContainerRequest = Request.builder()
                .method(Request.Method.POST)
                .path("/v1.44/containers/" + playGroundSession.containerId() + "/stop")
                .build();
        try (Response response = dockerHttpClient.execute(stopContainerRequest)) {
            if (response.getStatusCode() != 204) {
                throw new IllegalStateException("Failed to stop container");
            }
        }

        // delete the container
        Request deleteContainerRequest = Request.builder()
                .method(Request.Method.DELETE)
                .path("/v1.44/containers/" + playGroundSession.containerId())
                .build();

        try (Response response = dockerHttpClient.execute(deleteContainerRequest)) {
            if (response.getStatusCode() != 204) {
                throw new IllegalStateException("Failed to delete container");
            }
        }

        // delete the record
        playGroundSessionMap.remove(username);

    }

    @Override
    public QuizView newPlayGround(String username) {
        // get the last playground of the user
        int progress = credentialMapper.getProgressByUsername(username);
        // create a new playground with the progress
        return newPreloadedPlayground(username, progress);
    }

    @Override
    public QuizView forwardPlayGround(String username) {
        // get the current playground of the user
        PlayGroundSession playGroundSession = playGroundSessionMap.get(username);
        // check if the current quiz is the last quiz
        Integer quizCount = playGroundMapper.countQuizByLessonId(playGroundSession.playgroundId());
        if (Objects.equals(playGroundSession.quizId(), quizCount)) {
            // update the progress of the user
            credentialMapper.updateProgressByUsername(username, playGroundSession.playgroundId() + 1);
            return new QuizView("You have finished the playground");
        }
        // get the next quiz
        Quiz quiz = playGroundMapper.getQuizById(playGroundSession.quizId() + 1);
        // execute the prerequisite sql
        String script = quiz.prerequisite_sql();
        if (script != null) {
            playGroundSession.mainConnector().executeUpdate(script);
            playGroundSession.mirrorConnector().executeUpdate(script);
        }
        // update the quiz id of the user
        playGroundSession.setQuizId(playGroundSession.quizId() + 1);
        return new QuizView(quiz);

    }

    public QuizView newPreloadedPlayground(String username, Integer lessonId) {
        // find a non-using mysql container
        ContainerInfo availableContainer = containerInfoList.stream()
                .filter(ContainerInfo::getIs_available)
                .findFirst()
                .orElseThrow(() -> new IllegalStateException("No available container"));


        String containerName = availableContainer.getContainerName();
        Integer port = availableContainer.getPort();
        availableContainer.setIs_available(false);
        availableContainer.setUsername(username);

        // get quiz
        Quiz quiz = playGroundMapper.getQuizByLessonIdAndLessonQuizId(lessonId, 1);

        // connect to the database
        PlaygroundConnector mainConnector = new PlaygroundConnector("jdbc:mysql://localhost:" + port + "/?user=root&password=123456");
        mainConnector.executeUpdate("DROP DATABASE if exists main_db");
        mainConnector.executeUpdate("DROP DATABASE if exists mirror_db");
        mainConnector.executeUpdate("CREATE DATABASE if not exists main_db");
        mainConnector.executeUpdate("CREATE DATABASE if not exists mirror_db");
        mainConnector.executeUpdate("USE main_db");
        PlaygroundConnector mirrorConnector = new PlaygroundConnector("jdbc:mysql://localhost:" + port + "/mirror_db?user=root&password=123456");
        PlayGroundSession playGroundSession = new PlayGroundSession(username, containerName, LocalDateTime.now().plusHours(1), port, lessonId, quiz.id(), mainConnector, mirrorConnector);
        playGroundSessionMap.put(username, playGroundSession);

        // execute the prerequisite sql
        String script = quiz.prerequisite_sql();
        if (script != null) {
            //split the script by ;
            for (String s : script.split(";")) {
                mainConnector.executeUpdate(s);
                mirrorConnector.executeUpdate(s);
            }
        }

        // update progress of the user
        credentialMapper.updateProgressByUsername(username, lessonId);


        return new QuizView(quiz);
    }

    @Override
    public void deletePreloadedPlayground(String username) {
        // get the container with the username
        PlayGroundSession playGroundSession = playGroundSessionMap.get(username);

        // Clean the database
        playGroundSession.mainConnector().executeUpdate("DROP DATABASE main_db");
        playGroundSession.mirrorConnector().executeUpdate("DROP DATABASE mirror_db");

        // disconnect the connector
        playGroundSession.mainConnector().close();
        playGroundSession.mirrorConnector().close();

        // set the container to be available
        containerInfoList.stream()
                .filter(containerInfo -> containerInfo.getContainerName().equals(playGroundSession.containerId()))
                .findFirst()
                .ifPresent(containerInfo -> {
                    containerInfo.setIs_available(true);
                    containerInfo.setUsername(null);
                });

        // delete the record
        playGroundSessionMap.remove(username);
    }

    @Override
    public Boolean checkAnswer(String username, String answer) throws SQLException {
        // get the current playground of the user
        PlayGroundSession playGroundSession = playGroundSessionMap.get(username);
        Quiz currentQuiz = playGroundMapper.getQuizById(playGroundSession.quizId());
        if (answer == null) {
            return false;
        }

        //TODO: better way to compare the result
        if (Objects.equals(currentQuiz.type(), "SELECT")) {
            if (answer.startsWith("SELECT") || answer.startsWith("select")) {
                ResultSet mainResultSet = playGroundSession.mainConnector().executeQuery(answer);
                ResultSet mirrorResultSet = playGroundSession.mirrorConnector().executeQuery(answer);
                return compareResultSets(mainResultSet, mirrorResultSet);
            } else {
                return false;
            }
        } else {
            // execute the correct answer in the mirror database
            String mirrorOperation = currentQuiz.answer();
            for (String s : mirrorOperation.split(";")) {
                playGroundSession.mirrorConnector().executeUpdate(s);
            }

            // check if the result is the same
            ResultSet mainResultSet = playGroundSession.mainConnector().executeQuery(currentQuiz.check_sql());
            ResultSet mirrorResultSet = playGroundSession.mirrorConnector().executeQuery(currentQuiz.check_sql());
            return compareResultSets(mainResultSet, mirrorResultSet);
        }
    }

    @Override
    public List<List<String>> executeSql(String username, String sql) throws SQLException {
        if (sql == null) {
            return null;
        }
        // get the current playground of the user
        PlayGroundSession playGroundSession = playGroundSessionMap.get(username);

        if (sql.startsWith("SELECT") || sql.startsWith("select")) {
            ResultSet mainResultSet = playGroundSession.mainConnector().executeQuery(sql);
            return playGroundSession.mainConnector().convertResultSetToList(mainResultSet);
        } else {
            playGroundSession.mainConnector().executeUpdate(sql);
            return null;
        }
    }

    public boolean compareResultSets(ResultSet rs1, ResultSet rs2) throws SQLException {
        while (rs1.next() && rs2.next()) {
            // Assuming both result sets have the same number of columns
            int numColumns = rs1.getMetaData().getColumnCount();

            for (int i = 1; i <= numColumns; i++) {
                Object value1 = rs1.getObject(i);
                Object value2 = rs2.getObject(i);

                if (value1 == null && value2 == null) {
                    continue;
                }

                if (value1 == null || !value1.equals(value2)) {
                    return false;
                }
            }
        }

        // Check if both result sets have the same number of rows
        return !rs1.next() && !rs2.next();
    }
}
