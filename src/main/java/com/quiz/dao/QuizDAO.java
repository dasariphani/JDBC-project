package com.quiz.dao;

import com.quiz.model.Question;
import com.quiz.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {

    public List<Question> getAllQuestions() {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT id, question_text, option_a, option_b, option_c, option_d, correct_option FROM questions ORDER BY id ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Question(
                    rs.getInt("id"),
                    rs.getString("question_text"),
                    rs.getString("option_a"),
                    rs.getString("option_b"),
                    rs.getString("option_c"),
                    rs.getString("option_d"),
                    rs.getString("correct_option")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
