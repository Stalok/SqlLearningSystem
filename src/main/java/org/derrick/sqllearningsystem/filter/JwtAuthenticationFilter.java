package org.derrick.sqllearningsystem.filter;

import io.jsonwebtoken.Claims;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.derrick.sqllearningsystem.util.JwtUtil;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = request.getHeader("Authorization");
        if (token == null || token.isEmpty()) {
            doFilter(request, response, filterChain);
            return;
        }
        Claims claims;
        try {
            claims = JwtUtil.parseToken(token);
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid token");
        }

        if (claims == null) {
            throw new IllegalArgumentException("Invalid token");
        }
        String username = claims.get("username", String.class);
        // authenticate the user

        Authentication authentication = new UsernamePasswordAuthenticationToken(username, null, null);
        SecurityContextHolder.getContext().setAuthentication(authentication);
//        System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        doFilter(request, response, filterChain);
    }
}
