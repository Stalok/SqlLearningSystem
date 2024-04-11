package org.derrick.sqllearningsystem.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.LoginData;
import org.derrick.sqllearningsystem.entity.RegisterData;
import org.derrick.sqllearningsystem.entity.UpdatePasswordData;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.web.bind.annotation.*;


@RestController
@Slf4j
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost")
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
    public String login(@RequestBody LoginData loginData) {
        return credentialService.login(loginData.username(), loginData.password());
    }


    @PostMapping("/register")
    public String register(@RequestBody RegisterData registerData) {
            credentialService.register(registerData);
            return "Register successful";
    }

    /**
     * Update the password
     * @param updatePasswordData update password data
     * @return update password successful
     */
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestBody UpdatePasswordData updatePasswordData) {
            credentialService.updatePassword(updatePasswordData.username(), updatePasswordData.originalPassword(), updatePasswordData.newPassword());
            return "Update password successful";
    }

}
