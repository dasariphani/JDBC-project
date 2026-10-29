package com.quiz.controller;

import com.quiz.dao.QuizDAO;
import com.quiz.model.Question;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/submit-quiz")
public class SubmitQuizServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Question> questions = quizDAO.getAllQuestions();
        int score = 0;

        for (Question q : questions) {
            String selected = req.getParameter("q_" + q.getId());
            if (selected != null && selected.trim().equalsIgnoreCase(q.getCorrectOption().trim())) {
                score++;
            }
        }

        req.setAttribute("score", score);
        req.setAttribute("total", questions.size());
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }
}