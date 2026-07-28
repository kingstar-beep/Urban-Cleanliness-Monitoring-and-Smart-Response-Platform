package controller;

import dao.ScoreDAO;
import model.Score;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/scores")
public class GetScoresServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        ScoreDAO dao = new ScoreDAO();

        List<Score> scores = dao.getAllScores();

        response.getWriter().println("<h2>Street Scores</h2>");

        for (Score score : scores) {

            response.getWriter().println(
                "<p>"
                + "Street ID: "
                + score.getStreetId()
                + " | Reports: "
                + score.getComplaintCount()
                + " | Score: "
                + score.getFinalScore()
                + " | Status: "
                + score.getStatus()
                + "</p>"
            );
        }
    }
}