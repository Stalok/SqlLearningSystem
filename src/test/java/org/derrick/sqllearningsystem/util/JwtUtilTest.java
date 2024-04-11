package org.derrick.sqllearningsystem.util;

import io.jsonwebtoken.Claims;
import org.junit.jupiter.api.Test;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;

class JwtUtilTest {

    @Test
    void isTokenExpired() {
        try {
            HashMap<String, Object> map = new HashMap<>();
            map.put("username", "janedoe");
            map.put("playground_id", 1);
            map.put("quiz_id", 1);
            String token = JwtUtil.generateToken(map);
            System.out.println(token);

            Claims claims = JwtUtil.parseToken(token);
            System.out.println(claims.get("username"));
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
    }
}