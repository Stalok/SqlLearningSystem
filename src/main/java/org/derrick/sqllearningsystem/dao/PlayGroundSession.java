package org.derrick.sqllearningsystem.dao;

import java.time.LocalDateTime;

public record PlayGroundSession(String username, String containerId, LocalDateTime expiryTime, Integer port) {
}
