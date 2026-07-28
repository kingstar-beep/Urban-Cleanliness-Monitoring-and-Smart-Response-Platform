package controller;

import service.ScoringService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/calculate-scores")
public class CalculateScoreServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ScoringService service =
                new ScoringService();

        service.calculateScores();

        response.getWriter().println(
                "Scores calculated successfully!"
        );
    }
}