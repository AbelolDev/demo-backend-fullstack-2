package com.demo.LoQuieresTeLoVendo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNAUTHORIZED) // devuelve automáticamente 401
public class AuthException extends RuntimeException {
    public AuthException(String message) {
        super(message);
    }
}
