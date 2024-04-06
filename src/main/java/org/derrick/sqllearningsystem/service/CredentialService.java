package org.derrick.sqllearningsystem.service;

import org.derrick.sqllearningsystem.entity.RegisterData;

public interface CredentialService {
    boolean login(String username, String password);

    void register(RegisterData registerData);
}
