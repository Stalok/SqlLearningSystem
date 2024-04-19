package org.derrick.sqllearningsystem.entity;

import java.util.List;

public record ChapterView(String name, List<LessonView> lessonViewList) {
}
