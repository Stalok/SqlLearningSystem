package org.derrick.sqllearningsystem.entity;

public record UpdatePasswordData(String username, String originalPassword, String newPassword) {
}
