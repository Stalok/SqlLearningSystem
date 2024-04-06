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

    @ExceptionHandler(UsernameExistedException.class)
    public ResponseEntity<String> handleUsernameExistedException(UsernameExistedException e) {
        log.error("Username existed exception: ", e);
        return ResponseEntity.badRequest().body("Username existed");
    }
}