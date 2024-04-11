package org.derrick.sqllearningsystem.entity;

import lombok.Setter;
import org.derrick.sqllearningsystem.connecter.PlaygroundConnector;

import java.time.LocalDateTime;
import java.util.Objects;

public final class PlayGroundSession{
    private final String username;
    private final String containerId;
    private final LocalDateTime expiryTime;
    private final Integer port;
    private final Integer playgroundId;
    @Setter
    private Integer quizId;
    private final PlaygroundConnector mainConnector;
    private final PlaygroundConnector mirrorConnector;

    public PlayGroundSession(String username, String containerId, LocalDateTime expiryTime, Integer port, Integer playgroundId, Integer quizId, PlaygroundConnector mainConnector, PlaygroundConnector mirrorConnector) {
        this.username = username;
        this.containerId = containerId;
        this.expiryTime = expiryTime;
        this.port = port;
        this.playgroundId = playgroundId;
        this.quizId = quizId;
        this.mainConnector = mainConnector;
        this.mirrorConnector = mirrorConnector;
    }

    public String username() {
        return username;
    }

    public String containerId() {
        return containerId;
    }

    public LocalDateTime expiryTime() {
        return expiryTime;
    }

    public Integer port() {
        return port;
    }

    public Integer playgroundId() {
        return playgroundId;
    }

    public Integer quizId() {
        return quizId;
    }

    public PlaygroundConnector mainConnector() {
        return mainConnector;
    }

    public PlaygroundConnector mirrorConnector() {
        return mirrorConnector;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) return true;
        if (obj == null || obj.getClass() != this.getClass()) return false;
        var that = (PlayGroundSession) obj;
        return Objects.equals(this.username, that.username) &&
                Objects.equals(this.containerId, that.containerId) &&
                Objects.equals(this.expiryTime, that.expiryTime) &&
                Objects.equals(this.port, that.port) &&
                Objects.equals(this.playgroundId, that.playgroundId) &&
                Objects.equals(this.quizId, that.quizId) &&
                Objects.equals(this.mainConnector, that.mainConnector) &&
                Objects.equals(this.mirrorConnector, that.mirrorConnector);
    }

    @Override
    public int hashCode() {
        return Objects.hash(username, containerId, expiryTime, port, playgroundId, quizId, mainConnector, mirrorConnector);
    }

    @Override
    public String toString() {
        return "PlayGroundSession[" +
                "username=" + username + ", " +
                "containerId=" + containerId + ", " +
                "expiryTime=" + expiryTime + ", " +
                "port=" + port + ", " +
                "playgroundId=" + playgroundId + ", " +
                "quizId=" + quizId + ", " +
                "mainConnector=" + mainConnector + ", " +
                "mirrorConnector=" + mirrorConnector + ']';
    }

}
