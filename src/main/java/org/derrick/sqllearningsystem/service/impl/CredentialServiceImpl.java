package org.derrick.sqllearningsystem.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.RegisterData;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class CredentialServiceImpl implements CredentialService {

    private final CredentialMapper credentialMapper;
    @Override
    public void login(String username, String password) {

        // check if the username or password is empty
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            throw new IllegalArgumentException("Username or password is empty");
        }


        // TODO: hash the password

        // check if the password is correct
        switch (credentialMapper.countUsersByCredential(username, password)) {
            case 0:
                throw new IllegalArgumentException("Username or password is incorrect");
            case 1:
                break;
            default:
                throw new IllegalStateException("More than one user with the same username and password");
        }

        // update the last login time
        credentialMapper.updateLastLoginTime(username);
    }

    @Override
    public void register(RegisterData registerData) {
        // check if the username, password or email is empty or null
        if (registerData.username() == null || registerData.password() == null || registerData.email() == null
                || registerData.username().isEmpty() || registerData.password().isEmpty() || registerData.email().isEmpty()) {
            throw new IllegalArgumentException("Username, password or email is empty");
        }
        // check if the username already exists
        if (credentialMapper.countUsersByUsername(registerData.username()) > 0) {
            throw new IllegalArgumentException("Username already exists");
        }
        // register the user
        // TODO: hash the password
        credentialMapper.register(registerData.username(), registerData.password(), registerData.email());
        log.info("User {} registered successfully", registerData.username());
    }

    @Override
    public void updatePassword(String username, String originalPassword, String newPassword) {
        // check if the username, original password or new password is empty or null
        if (username == null || originalPassword == null || newPassword == null || username.isEmpty() || originalPassword.isEmpty() || newPassword.isEmpty()) {
            throw new IllegalArgumentException("Username, original password or new password is empty");
        }

        // check if the new password is longer than 8 characters
        if (newPassword.length() < 8) {
            throw new IllegalArgumentException("New password must be longer than 8 characters");
        }

        // check if the new password includes numbers, letters and special characters
//        if (!newPassword.matches(".*[0-9].*") || !newPassword.matches(".*[a-zA-Z].*") || !newPassword.matches(".*[^0-9a-zA-Z].*")) {
//            throw new IllegalArgumentException("New password must include numbers, letters and special characters");
//        }

        // check if the original password is correct
        if (credentialMapper.countUsersByCredential(username, originalPassword) == 0) {
            throw new IllegalArgumentException("Username or original password is incorrect");
        }

        // update the password
        credentialMapper.updatePassword(username, newPassword);
    }
}
