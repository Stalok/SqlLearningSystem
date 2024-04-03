package org.derrick.sqllearningsystem.dao;

public record Result<T> (int code, String message, T data){
}