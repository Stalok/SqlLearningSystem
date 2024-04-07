package org.derrick.sqllearningsystem.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleException(Exception e) {
        log.error("Exception: ", e);
        return ResponseEntity.internalServerError().body("Unknown error");
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<String> handleIllegalArgumentException(IllegalArgumentException e) {
        log.error("Illegal argument exception: ", e);
        return ResponseEntity.badRequest().body(e.getMessage());
    }

    @ExceptionHandler(IllegalStateException.class)
    public ResponseEntity<String> handleIllegalStateException(IllegalStateException e) {
        log.error("Illegal state exception: ", e);
        return ResponseEntity.internalServerError().body("Internal error");
    }

    @ExceptionHandler(UsernameExistedException.class)
    public ResponseEntity<String> handleUsernameExistedException(UsernameExistedException e) {
        log.error("Username existed exception: ", e);
        return ResponseEntity.badRequest().body("Username existed");
    }

    @ExceptionHandler(UserNotExistedException.class)
    public ResponseEntity<String> handleUserNotExistedException(UserNotExistedException e) {
        log.error("User not existed exception: ", e);
        return ResponseEntity.badRequest().body("User not existed");
    }

    @ExceptionHandler(PasswordNotMatchException.class)
    public ResponseEntity<String> handlePasswordNotMatchException(PasswordNotMatchException e) {
        log.error("Password not match exception: ", e);
        return ResponseEntity.badRequest().body("Password not match");
    }
}
