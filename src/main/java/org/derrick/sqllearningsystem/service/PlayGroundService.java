package org.derrick.sqllearningsystem.service;

import org.derrick.sqllearningsystem.entity.QuizView;

public interface PlayGroundService {
    QuizView newPlayGround(String username, Integer playgroundId) throws Exception;

    void deletePlayGround(String username);

    QuizView newPlayGround(String username);

    QuizView forwardPlayGround(String username);

    QuizView newPreloadedPlayground(String username, Integer lessonId);

    void deletePreloadedPlayground(String username);
}
