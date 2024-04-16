package org.derrick.sqllearningsystem.controller;

import lombok.RequiredArgsConstructor;
import org.derrick.sqllearningsystem.entity.QuizView;
import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

@RestController
@RequestMapping("/playground")
@RequiredArgsConstructor
public class PlayGroundController {

    private final PlayGroundService playGroundService;

    /**
     * Create a new playground with designated playground id
     * @param playgroundId playground id
     * @return message
     */
    @PostMapping("/new/")
    public QuizView newPlayGround(Principal principal, @RequestParam Integer playgroundId) {
        return playGroundService.newPreloadedPlayground(principal.getName(), playgroundId);
    }

    /**
     * Create a new playground with the progress of the last playground
     * @param principal principal
     * @return message
     */
    @PostMapping("/new")
    public QuizView newPlayGround(Principal principal) {
        return playGroundService.newPlayGround(principal.getName());
    }

    @PostMapping("/continue")
    public QuizView forwardPlayGround(Principal principal) {
        return playGroundService.forwardPlayGround(principal.getName());
    }

    @DeleteMapping
    public String deletePlayGround(Principal principal) {
        playGroundService.deletePreloadedPlayground(principal.getName());
        return "Playground deleted for " + principal.getName();
    }

    @PostMapping("/check")
    public Boolean checkAnswer(Principal principal, @RequestParam String answer) throws SQLException {
        return playGroundService.checkAnswer(principal.getName(), answer);
    }

    @PutMapping("/sql")
    public List<List<String>> executeSql(Principal principal, @RequestParam String sql) throws SQLException {
        return playGroundService.executeSql(principal.getName(), sql);
    }
}
