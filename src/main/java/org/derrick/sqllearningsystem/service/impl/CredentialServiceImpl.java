package org.derrick.sqllearningsystem.service.impl;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@AllArgsConstructor
public class CredentialServiceImpl implements CredentialService {

    CredentialMapper credentialMapper;
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
    public void register(String username, String password) {

    }
}
