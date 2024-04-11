package org.derrick.sqllearningsystem.entity;

public record User (String username, String password, String email, Integer progress, String create_time, String update_time, String last_login_time, Boolean is_active){
}
