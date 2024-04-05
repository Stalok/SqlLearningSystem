package org.derrick.sqllearningsystem.service;

public interface CredentialService {
    boolean login(String username, String password);

    void register(String username, String password);
}
