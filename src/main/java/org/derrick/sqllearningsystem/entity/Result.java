package org.derrick.sqllearningsystem.entity;

public record Result<T> (int code, String message, T data){
}