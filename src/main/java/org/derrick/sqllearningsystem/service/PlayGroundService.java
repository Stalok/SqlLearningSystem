package org.derrick.sqllearningsystem.service;

public interface PlayGroundService {
    void newPlayGround(String username, Integer playgroundId) throws Exception;

    void deletePlayGround(String username);

    void newPlayGround(String username);

    void forwardPlayGround(String username);
}
