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

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Question> questions = quizDAO.getAllQuestions();
        req.setAttribute("questions", questions);
        req.getRequestDispatcher("/quiz.jsp").forward(req, resp);
    }
}