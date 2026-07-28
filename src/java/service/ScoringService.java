package service;

import dao.ScoreDAO;
import util.DBConnection;
import model.Score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.EmailUtil;

public class ScoringService {

    public void calculateScores() {

        String sql
                = "SELECT s.id AS street_id, "
                + "COUNT(r.id) AS total_reports "
                + "FROM streets s "
                + "LEFT JOIN reports r "
                + "ON s.id = r.street_id "
                + "GROUP BY s.id";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            ScoreDAO scoreDAO = new ScoreDAO();

            while (rs.next()) {

                int streetId = rs.getInt("street_id");

                int totalReports
                        = rs.getInt("total_reports");

                int finalScore = totalReports;

                String status;

                if (finalScore <= 2) {

                    status = "Clean";

                } else if (finalScore <= 5) {

                    status = "Moderate";

                } else if (finalScore <= 10) {

                    status = "Dirty";

                } else {

                    status = "Critical";
                }

                Score score = new Score();

                score.setStreetId(streetId);
                score.setComplaintCount(totalReports);
                score.setFinalScore(finalScore);
                score.setStatus(status);

                if (scoreDAO.scoreExists(streetId)) {
                    scoreDAO.updateScore(score);
                } else {
                    scoreDAO.saveScore(score);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
