package org.derrick.sqllearningsystem.util;

public class JwtUtil {
    public static final String SECRET = "secret";
    public static final long EXPIRATION = 3600L;
    public static final String TOKEN = "token";

    public static String generateToken(String username) {



        return null;
    }

    public static String getUsername(String token) {

        return null;
    }

    public static boolean validateToken(String token) {

        return false;
    }

    public static boolean isTokenExpired(String token) {

        return false;
    }

    public static boolean isTokenInvalid(String token) {

        return false;
    }

}
