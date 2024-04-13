package org.derrick.sqllearningsystem.controller;

import lombok.RequiredArgsConstructor;
import org.derrick.sqllearningsystem.entity.QuizView;
import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

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
    @PostMapping("/{playgroundId}")
    public QuizView newPlayGround(Principal principal, @PathVariable Integer playgroundId) throws Exception {
        return playGroundService.newPlayGround(principal.getName(), playgroundId);
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

    @PutMapping("/check")
    public String checkAnswer(Principal principal) {
        //TODO
        return "Playground checked for " + principal.getName();
    }

    @PutMapping("/sql")
    public String executeSql(Principal principal) {
        //TODO
        return "SQL checked for " + principal.getName();
    }
}
