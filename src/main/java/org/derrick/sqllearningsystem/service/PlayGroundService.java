package org.derrick.sqllearningsystem.service;

import org.derrick.sqllearningsystem.entity.QuizView;

import java.sql.SQLException;
import java.util.List;

public interface PlayGroundService {
    QuizView newPlayGround(String username, Integer playgroundId) throws Exception;

    void deletePlayGround(String username);

    QuizView newPlayGround(String username);

    QuizView forwardPlayGround(String username);

    QuizView newPreloadedPlayground(String username, Integer lessonId);

    void deletePreloadedPlayground(String username);

    Boolean checkAnswer(String username, String answer) throws SQLException;

    List<List<String>> executeSql(String username, String sql) throws SQLException;
}
