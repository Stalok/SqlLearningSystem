package org.derrick.sqllearningsystem.entity;

public record Quiz(
        Integer id,
        Integer playground_id,
        Integer playground_quiz_id,
        String prerequisite_sql,
        String question,
        String type,
        String answer,
        String check_sql
) {
}
