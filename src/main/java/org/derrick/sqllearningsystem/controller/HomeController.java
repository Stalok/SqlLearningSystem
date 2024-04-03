package org.derrick.sqllearningsystem.controller;

import com.spotify.docker.client.DefaultDockerClient;
import com.spotify.docker.client.DockerClient;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/")
@Slf4j
public class HomeController {
    @GetMapping
    public String home(Principal principal, HttpSession session) {
        log.info("User: " + principal.getName() + " is visiting the home page, session id: " + session.getId());
        try (DockerClient docker = DefaultDockerClient.fromEnv().build()) {
            docker.ping();
        } catch (Exception e) {
            log.error("Docker is not running", e);
            return "Docker is not running";
        }
        return "Welcome to SQL Learning System, " + principal.getName() + "!";
    }

    @GetMapping("/docker")
    public String docker() {
        try (DockerClient docker = DefaultDockerClient.fromEnv().build()) {
            docker.ping();
            System.out.println("Docker is running" + docker.info());
        } catch (Exception e) {
            log.error("Docker is not running", e);
            return "Docker is not running";
        }
        return "Welcome to SQL Learning System !";
    }
}
