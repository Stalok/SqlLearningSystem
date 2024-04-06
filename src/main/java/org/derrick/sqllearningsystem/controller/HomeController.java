package org.derrick.sqllearningsystem.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.LoginData;
import org.derrick.sqllearningsystem.entity.RegisterData;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
@Slf4j
@RequiredArgsConstructor
public class HomeController {

    private final CredentialService credentialService;
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

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody RegisterData registerData) {
        if (registerData.username() == null || registerData.password() == null || registerData.email() == null) {
            return ResponseEntity.badRequest().body("Username, password or email is missing");
        } else if (registerData.username().isEmpty() || registerData.password().isEmpty() || registerData.email().isEmpty()){
            return ResponseEntity.badRequest().body("Username, password or email is empty");
        } else {
            credentialService.register(registerData);
            return ResponseEntity.ok("Register successful");
        }
    }
}
