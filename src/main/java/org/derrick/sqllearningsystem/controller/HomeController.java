package org.derrick.sqllearningsystem.controller;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.LoginData;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@Slf4j
@AllArgsConstructor
public class HomeController {

    CredentialService credentialService;
    @GetMapping("/")
    public String home() {
        return "Welcome to SQL Learning System!";
    }

    /**
     * Login
     * @param loginData login data
     * @return login successful
     */
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginData loginData) {
        if (loginData.username() == null || loginData.password() == null) {
            return ResponseEntity.badRequest().body("Username or password is missing");
        } else if (loginData.username().isEmpty() || loginData.password().isEmpty()){
            return ResponseEntity.badRequest().body("Username or password is empty");
        } else if (credentialService.login(loginData.username(), loginData.password())) {
            return ResponseEntity.ok("Login successful");
        } else {
            return ResponseEntity.badRequest().body("Login failed");
        }

    }
}
