package org.derrick.sqllearningsystem.exception;

public class PasswordNotMatchException extends RuntimeException {
    public PasswordNotMatchException() {
        super("Password not match");
    }
}
