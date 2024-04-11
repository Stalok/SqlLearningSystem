package org.derrick.sqllearningsystem.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

public record UserCredential(String username, String password, Boolean is_active) implements UserDetails {
    public UserCredential(String username){
        this(username, "", true);
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return is_active;
    }

    @Override
    public boolean isAccountNonLocked() {
        return is_active;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return is_active;
    }

    @Override
    public boolean isEnabled() {
        return is_active;
    }
}
