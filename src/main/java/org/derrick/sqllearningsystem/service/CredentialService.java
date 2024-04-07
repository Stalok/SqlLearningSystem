package org.derrick.sqllearningsystem.service;

import org.derrick.sqllearningsystem.entity.RegisterData;

public interface CredentialService {
    void login(String username, String password);

    void register(RegisterData registerData);

    void updatePassword(String username, String originalPassword, String newPassword);
}
