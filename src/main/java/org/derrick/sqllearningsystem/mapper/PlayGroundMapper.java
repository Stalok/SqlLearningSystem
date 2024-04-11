package org.derrick.sqllearningsystem.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.derrick.sqllearningsystem.entity.PlayGroundSession;
import org.derrick.sqllearningsystem.entity.Quiz;

import java.time.LocalDateTime;
import java.util.List;

@Mapper
public interface PlayGroundMapper {
    @Insert("insert into sql_learning_system_db.`playground_session` (username, container_id, port, expiry_time) values (#{username}, #{containerId}, #{port}, #{expiryTime})")
    void newPlayGround(String username, String containerId, Integer port, LocalDateTime expiryTime);

    @Select("select * from sql_learning_system_db.`playground_session` where expiry_time > now()")
    List<PlayGroundSession> getExpiredPlaygrounds();


    @Delete("delete from sql_learning_system_db.`playground_session` where username = #{username}")
    void deletePlayGround(String username);

    @Select("select * from sql_learning_system_db.`playground_session` where username = #{username}")
    PlayGroundSession getPlayGroundSessionByUsername(String username);

    @Select("select * from sql_learning_system_db.`quizzes` where id = #{quizId}")
    Quiz getQuizById(Integer quizId);

    @Select("select * from sql_learning_system_db.`quizzes` where playground_id = #{playgroundId} and playground_quiz_id = 1")
    Quiz getFirstQuizByPlaygroundId(Integer playgroundId);

    @Select("select count(*) from sql_learning_system_db.`quizzes` where playground_id = #{playgroundId}")
    Integer countQuizByPlaygroundId(Integer playgroundId);
}
