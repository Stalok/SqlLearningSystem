package org.derrick.sqllearningsystem.controller;

import lombok.RequiredArgsConstructor;
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
     * @param username username
     * @param playgroundId playground id
     * @return message
     */
    @PostMapping("/{username}/{playgroundId}")
    public String newPlayGround(@PathVariable String username, @PathVariable Integer playgroundId) throws Exception {
        playGroundService.newPlayGround(username, playgroundId);
        return "Playground created for " + username;
    }

    /**
     * Create a new playground with the progress of the last playground
     * @param username username
     * @return message
     */
    @PostMapping("/{username}")
    public String newPlayGround(@PathVariable String username) {
        playGroundService.newPlayGround(username);
        return "Playground created for " + username;
    }

    /**
     * Create a new playground with the progress of the last playground
     * @param principal principal
     * @return message
     */
    @PostMapping("/new")
    public String newPlayGround(Principal principal) {
        playGroundService.newPlayGround(principal.getName());
        return "Playground created for " + principal.getName();
    }

    @GetMapping("/continue/{username}")
    public String forwardPlayGround(@PathVariable String username) {
        playGroundService.forwardPlayGround(username);
        return "Playground extended for " + username;
    }

    @DeleteMapping("/{username}")
    public String deletePlayGround(@PathVariable String username) {
        playGroundService.deletePlayGround(username);
        return "Playground deleted for " + username;
    }

}
