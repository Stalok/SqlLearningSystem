package org.derrick.sqllearningsystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.derrick.sqllearningsystem.entity.Quiz;

@Mapper
public interface PlayGroundMapper {

    @Select("select * from sql_learning_system_db.`quizzes` where id = #{quizId}")
    Quiz getQuizById(Integer quizId);

    @Select("select * from sql_learning_system_db.`quizzes` where lesson_id = #{lessonId} and lesson_quiz_id = 1")
    Quiz getFirstQuizByLessonId(Integer lessonId);

    @Select("select * from sql_learning_system_db.`quizzes` where lesson_id = #{lessonId} and lesson_quiz_id = #{lessonQuizId}")
    Quiz getQuizByLessonIdAndLessonQuizId(Integer lessonId, Integer lessonQuizId);

    @Select("select total_quizzes from sql_learning_system_db.`lesson` where id = #{lessonId}")
    Integer countQuizByLessonId(Integer lessonId);
}
