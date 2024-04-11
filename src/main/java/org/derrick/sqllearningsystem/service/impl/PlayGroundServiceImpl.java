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
import org.derrick.sqllearningsystem.entity.PlayGroundSession;
import org.derrick.sqllearningsystem.entity.Quiz;
import org.derrick.sqllearningsystem.entity.QuizView;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.derrick.sqllearningsystem.mapper.PlayGroundMapper;
import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
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


    @Override
    public QuizView newPlayGround(String username, Integer playgroundId) {
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
        Quiz quiz = playGroundMapper.getFirstQuizByPlaygroundId(playgroundId);

        // write the username, containerId to the playground_session
        PlaygroundConnector mainConnector = new PlaygroundConnector("jdbc:mysql://localhost:" + port + "/main_db?user=root&password=123456");
        PlaygroundConnector mirrorConnector = new PlaygroundConnector("jdbc:mysql://localhost:" + port + "/mirror_db?user=root&password=123456");
        PlayGroundSession playGroundSession = new PlayGroundSession(username, containerId, LocalDateTime.now().plusHours(1), port, playgroundId, quiz.id(), mainConnector, mirrorConnector);
        playGroundSessionMap.put(username, playGroundSession);

        String script = quiz.prerequisite_sql();
        mainConnector.executeUpdate(script);
        mirrorConnector.executeUpdate(script);
        // update progress of the user
        credentialMapper.updateProgressByUsername(username, playgroundId);


        return new QuizView(quiz);
    }

    /**
     * delete the playground of the user
     * @param username the username of the user
     */
    @Deprecated
    @Override
    public void deletePlayGround(String username) {
        // get the port number of the playground
        PlayGroundSession playGroundSession = playGroundMapper.getPlayGroundSessionByUsername(username);
        // send a DELETE request to the port number
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.delete("http://localhost:5000/docker/" + playGroundSession.containerId());
        // delete the record from the database
        playGroundMapper.deletePlayGround(username);
    }

    @Override
    public QuizView newPlayGround(String username) {
        // get the last playground of the user
        int progress = credentialMapper.getProgressByUsername(username);
        // create a new playground with the progress
        return newPlayGround(username, progress);
    }

    @Override
    public QuizView forwardPlayGround(String username) {
        //TODO
        // get the current playground of the user
        PlayGroundSession playGroundSession = playGroundSessionMap.get(username);
        // check if the current quiz is the last quiz
        Integer quizCount = playGroundMapper.countQuizByPlaygroundId(playGroundSession.playgroundId());
        if (Objects.equals(playGroundSession.quizId(), quizCount)) {
            // update the progress of the user
            credentialMapper.updateProgressByUsername(username, playGroundSession.playgroundId() + 1);
            return new QuizView("You have finished the playground");
        }
        // get the next quiz
        Quiz quiz = playGroundMapper.getQuizById(playGroundSession.quizId() + 1);
        // execute the prerequisite sql
        playGroundSession.mainConnector().executeUpdate(quiz.prerequisite_sql());
        playGroundSession.mirrorConnector().executeUpdate(quiz.prerequisite_sql());
        // update the quiz id of the user
        playGroundSession.setQuizId(playGroundSession.quizId() + 1);
        return new QuizView(quiz);
        // TODO: check this method

    }

}
