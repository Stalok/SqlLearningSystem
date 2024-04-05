package org.derrick.sqllearningsystem.mapper;

import org.apache.ibatis.annotations.*;
import org.derrick.sqllearningsystem.entity.PlayGroundSession;

import java.time.LocalDateTime;

@Mapper
public interface PlayGroundMapper {
    @Insert("insert into sql_db.`sql_session` (username, container_id, expiry_time, port) values (#{username}, #{containerId}, #{expiryTime}, #{port})")
    void newPlayGround(String username, String containerId, LocalDateTime expiryTime, Integer port);

    @Select("select expiry_time from sql_db.`sql_session` where username = #{username}")
    LocalDateTime getExpiryTime(String username);

    @Update("update sql_db.`sql_session` set expiry_time = #{expiryTime} where username = #{username}")
    void updateExpiryTime(String username, LocalDateTime expiryTime);

    @Select("select port from sql_db.`sql_session` where username = #{username}")
    Integer getPort(String username);

    @Delete("delete from sql_db.`sql_session` where username = #{username}")
    void deletePlayGround(String username);

    @Select("select * from sql_db.`sql_session` where username = #{username}")
    PlayGroundSession getPlayGroundSession(String username);
}
