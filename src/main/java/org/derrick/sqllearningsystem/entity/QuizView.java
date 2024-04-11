package org.derrick.sqllearningsystem.entity;

public record QuizView(Integer id, Integer playground_id, Integer playground_quiz_id, String question, String type, String choice1, String choice2, String choice3, String choice4, String answer) {
    public QuizView(Quiz quiz) {
        this(quiz.id(), quiz.playground_id(), quiz.playground_quiz_id(), quiz.question(), quiz.type(), quiz.choice1(), quiz.choice2(), quiz.choice3(), quiz.choice4(), quiz.answer());
    }
    public QuizView(String message) {
        this(null, null, null, message, null, null, null, null, null, null);
    }
}
