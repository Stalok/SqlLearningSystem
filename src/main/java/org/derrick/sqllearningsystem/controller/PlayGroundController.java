package org.derrick.sqllearningsystem.controller;

import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController("/playground")
public class PlayGroundController {

    private final PlayGroundService playGroundService;

    PlayGroundController(PlayGroundService playGroundService) {
        this.playGroundService = playGroundService;
    }

    @GetMapping("/{username}/{playgroundId}")
    public ResponseEntity<String> newPlayGround(@PathVariable String username, @PathVariable Integer playgroundId) {
        playGroundService.newPlayGround(username, playgroundId);
        return ResponseEntity.ok().body("Playground created for " + username);
    }

    @GetMapping("/extend/{username}")
    public ResponseEntity<String> extendPlayGround(@PathVariable String username) {
        playGroundService.ExtendPlayGround(username);
        return ResponseEntity.ok().body("Playground extended for " + username);
    }

    @DeleteMapping("/{username}")
    public ResponseEntity<String> deletePlayGround(@PathVariable String username) {
        playGroundService.deletePlayGround(username);
        return ResponseEntity.ok().body("Playground deleted for " + username);
    }

}
