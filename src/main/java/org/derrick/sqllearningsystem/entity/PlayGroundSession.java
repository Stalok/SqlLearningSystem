package org.derrick.sqllearningsystem.entity;

import org.derrick.sqllearningsystem.connecter.PlaygroundConnector;

import java.time.LocalDateTime;

public record PlayGroundSession(String username, String containerId, LocalDateTime expiryTime, Integer port, PlaygroundConnector mainConnector, PlaygroundConnector mirrorConnector){
}
