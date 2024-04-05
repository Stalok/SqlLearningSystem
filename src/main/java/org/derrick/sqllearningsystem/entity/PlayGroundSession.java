package org.derrick.sqllearningsystem.entity;

import java.time.LocalDateTime;

public record PlayGroundSession(String username, String containerId, LocalDateTime expiryTime, Integer port) {
}
