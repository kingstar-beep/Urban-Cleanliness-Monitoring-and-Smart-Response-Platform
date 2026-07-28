package dao;

import model.Score;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ScoreDAO {

    // SAVE SCORE
    public boolean saveScore(Score score) {

        boolean status = false;

        String sql
                = "INSERT INTO scores(street_id, complaint_count, final_score, status)"
                + " VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, score.getStreetId());
            stmt.setInt(2, score.getComplaintCount());
            stmt.setInt(3, score.getFinalScore());
            stmt.setString(4, score.getStatus());

            int rows = stmt.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // GET ALL SCORES
    public List<Score> getAllScores() {

        List<Score> scores = new ArrayList<>();

        String sql = "SELECT * FROM scores";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {

                Score score = new Score();

                score.setId(rs.getInt("id"));
                score.setStreetId(rs.getInt("street_id"));
                score.setComplaintCount(
                        rs.getInt("complaint_count")
                );
                score.setFinalScore(
                        rs.getInt("final_score")
                );
                score.setStatus(rs.getString("status"));

                scores.add(score);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return scores;
    }

    public boolean scoreExists(int streetId) {

        boolean exists = false;

        String sql
                = "SELECT * FROM scores WHERE street_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt
                = conn.prepareStatement(sql)) {

            stmt.setInt(1, streetId);

            ResultSet rs = stmt.executeQuery();

            exists = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    public boolean updateScore(Score score) {

        boolean status = false;

        String sql
                = "UPDATE scores SET complaint_count=?, "
                + "final_score=?, status=? "
                + "WHERE street_id=?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt
                = conn.prepareStatement(sql)) {

            stmt.setInt(1,
                    score.getComplaintCount());

            stmt.setInt(2,
                    score.getFinalScore());

            stmt.setString(3,
                    score.getStatus());

            stmt.setInt(4,
                    score.getStreetId());

            int rows = stmt.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Score> getTopDirtyStreets() {

        List<Score> scores
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection.getConnection();

            String sql
                    = "SELECT * FROM scores ORDER BY final_score DESC";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                Score score
                        = new Score();

                score.setStreetId(
                        rs.getInt("street_id"));

                score.setComplaintCount(
                        rs.getInt("complaint_count"));

                score.setFinalScore(
                        rs.getInt("final_score"));

                score.setStatus(
                        rs.getString("status"));

                scores.add(score);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return scores;
    }
}
