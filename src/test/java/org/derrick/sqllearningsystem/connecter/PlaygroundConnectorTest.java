package org.derrick.sqllearningsystem.connecter;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertNotNull;

class PlaygroundConnectorTest {

    @Test
    void connect() {
        PlaygroundConnector playgroundConnector = new PlaygroundConnector("jdbc:mysql://localhost:2562/?user=root&password=123456");
        assertNotNull(playgroundConnector);
    }
}