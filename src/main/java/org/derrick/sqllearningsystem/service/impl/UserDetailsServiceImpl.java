package org.derrick.sqllearningsystem.service.impl;

import lombok.RequiredArgsConstructor;
import org.derrick.sqllearningsystem.entity.UserCredential;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {
    private final CredentialMapper credentialMapper;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // check if the username is empty or null
        if (username == null || username.isEmpty()) {
            throw new IllegalArgumentException("Username is empty");
        }
        // get the user by username
        UserCredential userCredential = credentialMapper.getUserByUsername(username);

        // check if the user exists
        if (userCredential == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return userCredential;
    }
}
