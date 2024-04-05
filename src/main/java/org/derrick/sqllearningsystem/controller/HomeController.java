package org.derrick.sqllearningsystem.controller;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.LoginData;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
@Slf4j
@AllArgsConstructor
public class HomeController {

    CredentialService credentialService;
    @GetMapping("/")
    public String home() {
        return "Welcome to SQL Learning System !";
    }

    @PostMapping("/login")
    public String login(@RequestBody LoginData loginData) {
        credentialService.login(loginData.username(), loginData.password());
        return "Login successful";
    }
}
