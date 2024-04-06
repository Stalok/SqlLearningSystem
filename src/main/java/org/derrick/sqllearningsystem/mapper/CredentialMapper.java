package org.derrick.sqllearningsystem.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CredentialMapper {
    @Select("SELECT password FROM user WHERE username = #{username}")
    String getPassword(String username);

    @Select("SELECT COUNT(*) FROM user WHERE username = #{username}")
    int checkUsername(String username);

    @Insert("INSERT INTO user (username, password, email) VALUES (#{username}, #{password}, #{email})")
    void register(String username, String password, String email);

    @Update("UPDATE user SET last_login_time = NOW() WHERE username = #{username}")
    void updateLastLoginTime(String username);

    @Update("UPDATE user SET password = #{password} WHERE username = #{username}")
    void updatePassword(String username, String password);

    @Update("UPDATE user SET email = #{email} WHERE username = #{username}")
    void updateEmail(String username, String email);
}
