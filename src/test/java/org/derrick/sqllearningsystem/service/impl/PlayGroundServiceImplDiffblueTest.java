package org.derrick.sqllearningsystem.service.impl;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.ArrayList;
import java.util.List;

@ContextConfiguration(classes = {PlayGroundServiceImpl.class})
@ExtendWith(SpringExtension.class)
class PlayGroundServiceImplDiffblueTest {

    /**
     * Method under test:
     * {@link PlayGroundServiceImpl#newPlayGround(String, Integer)}
     */
    @Test
    @Disabled
    void testNewPlayGround() {
        // Arrange
        // TODO: Populate arranged inputs
        String username = "derr";
        Integer playgroundId = 12;

        // Act
        // this.playGroundServiceImpl.newPlayGround(username, playgroundId);

        List<Boolean> portList = new ArrayList<>(100);
        for (int i = 0; i < 100; i++) {
            portList.add(false);
        }
        // Assert
        // TODO: Add assertions on result
    }
}
