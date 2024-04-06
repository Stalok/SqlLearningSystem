package org.derrick.sqllearningsystem.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.RegisterData;
import org.derrick.sqllearningsystem.exception.UsernameExistedException;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class CredentialServiceImpl implements CredentialService {

    private final CredentialMapper credentialMapper;
    @Override
    public boolean login(String username, String password) {
        // get the password from the database
        String passwordFromDB = credentialMapper.getPassword(username);

        // compare the password from the database with the password from the user
        if (password.equals(passwordFromDB)) {
            // update the last login time
            credentialMapper.updateLastLoginTime(username);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void register(RegisterData registerData) {
        // check if the username already exists
        if (credentialMapper.checkUsername(registerData.username()) > 0) {
            throw new UsernameExistedException();
        }
        // register the user
        // TODO: hash the password
        credentialMapper.register(registerData.username(), registerData.password(), registerData.email());
        log.info("User {} registered successfully", registerData.username());
    }
}
