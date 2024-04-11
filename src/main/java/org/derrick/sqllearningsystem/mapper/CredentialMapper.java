package org.derrick.sqllearningsystem.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.derrick.sqllearningsystem.entity.UserCredential;

@Mapper
public interface CredentialMapper {

    /**
     * Check if the user exists
     * @param username username
     * @param password password
     * @return 1 if the user exists, 0 if the user does not exist
     */
    @Select("SELECT COUNT(*) FROM user WHERE username = #{username} AND password = #{password}")
    int countUsersByCredential(String username, String password);

    /**
     * Check if the user exists
     * @param username username
     * @return 1 if the user exists, 0 if the user does not exist
     */
    @Select("SELECT COUNT(*) FROM user WHERE username = #{username}")
    int countUsersByUsername(String username);

    @Select("SELECT username, password, is_active FROM user WHERE username = #{username} limit 1")
    UserCredential getUserByUsername(String username);
    /**
     * Register a new user
     * @param username username
     * @param password password
     * @param email email
     */
    @Insert("INSERT INTO user (username, password, email) VALUES (#{username}, #{password}, #{email})")
    void register(String username, String password, String email);

    /**
     * Update the last login time
     * @param username username
     */
    @Update("UPDATE user SET last_login_time = NOW() WHERE username = #{username}")
    void updateLastLoginTime(String username);

    /**
     * Update the password
     * @param username username
     * @param password password
     */
    @Update("UPDATE user SET password = #{password} WHERE username = #{username}")
    void updatePassword(String username, String password);

    /**
     * Update the email
     * @param username username
     * @param email email
     */
    @Update("UPDATE user SET email = #{email} WHERE username = #{username}")
    void updateEmail(String username, String email);

    @Select("SELECT progress FROM user WHERE username = #{username}")
    int getProgressByUsername(String username);
}
