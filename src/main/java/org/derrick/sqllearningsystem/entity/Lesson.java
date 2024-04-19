package org.derrick.sqllearningsystem.entity;

import java.time.LocalDateTime;

public record Lesson(int id, String name, String description, String type, int chapter_id, int total_quizzes, LocalDateTime create_time, LocalDateTime update_time, boolean is_active) {

}