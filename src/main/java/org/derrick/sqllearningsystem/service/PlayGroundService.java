package org.derrick.sqllearningsystem.service;

import java.io.IOException;

public interface PlayGroundService {
    void newPlayGround(String username, Integer playgroundId);
    void ExtendPlayGround(String username);
    void deletePlayGround(String username);

}
