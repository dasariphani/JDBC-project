package com.quiz.model;

public class QuestionReview {
    private final Question question;
    private final String selectedOption; // null or "A", "B", "C", "D"
    private final boolean isCorrect;
    private final boolean isSkipped;

    public QuestionReview(Question question, String selectedOption) {
        this.question = question;
        this.selectedOption = selectedOption;
        this.isSkipped = (selectedOption == null || selectedOption.trim().isEmpty());
        this.isCorrect = !isSkipped && selectedOption.trim().equalsIgnoreCase(question.getCorrectOption().trim());
    }

    public Question getQuestion() { return question; }
    public String getSelectedOption() { return selectedOption; }
    public boolean isCorrect() { return isCorrect; }
    public boolean isSkipped() { return isSkipped; }

    public String getSelectedOptionText() {
        if (isSkipped) return "Not Attempted";
        switch (selectedOption.toUpperCase()) {
            case "A": return question.getOptionA();
            case "B": return question.getOptionB();
            case "C": return question.getOptionC();
            case "D": return question.getOptionD();
            default: return "Invalid Choice";
        }
    }

    public String getCorrectOptionText() {
        switch (question.getCorrectOption().toUpperCase()) {
            case "A": return question.getOptionA();
            case "B": return question.getOptionB();
            case "C": return question.getOptionC();
            case "D": return question.getOptionD();
            default: return "";
        }
    }
}