package dao;

import model.Report;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class ReportDAO {

    // ADD REPORT
    public boolean addReport(Report report) {

        boolean status = false;

        String sql
                = "INSERT INTO reports("
                + "street_id, report_text, image_path, ai_prediction"
                + ") VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, report.getStreetId());
            stmt.setString(2, report.getReportText());
            //stmt.setString(3, report.getSource());
            stmt.setString(3, report.getImagePath());
            stmt.setString(
                    4,
                    report.getAiPrediction());

            int rows = stmt.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {

            System.out.println("DATABASE ERROR:");
            e.printStackTrace();
        }

        return status;
    }

    // FETCH ALL REPORTS
    public List<Report> getAllReports() {

        List<Report> reports
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection.getConnection();

            String sql
                    = "SELECT * FROM reports";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                Report report
                        = new Report();

                report.setId(
                        rs.getInt("id"));

                report.setStreetId(
                        rs.getInt("street_id"));

                report.setReportText(
                        rs.getString("report_text"));

                report.setImagePath(
                        rs.getString("image_path"));

                report.setStatus(
                        rs.getString("status"));

                reports.add(report);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reports;
    }

    public List<Object[]> getHotspotData() {

        List<Object[]> hotspots
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql
                    = "SELECT street_id, "
                    + "COUNT(*) AS total_reports "
                    + "FROM reports "
                    + "GROUP BY street_id "
                    + "ORDER BY total_reports DESC";

            PreparedStatement stmt
                    = conn.prepareStatement(
                            sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                Object[] row
                        = new Object[2];

                row[0]
                        = rs.getInt(
                                "street_id");

                row[1]
                        = rs.getInt(
                                "total_reports");

                hotspots.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return hotspots;
    }

    public List<Object[]> getTrendData() {

        List<Object[]> trends
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql
                    = "SELECT DATE(created_at) "
                    + "AS report_day, "
                    + "COUNT(*) AS total_reports "
                    + "FROM reports "
                    + "GROUP BY DATE(created_at) "
                    + "ORDER BY report_day ASC";

            PreparedStatement stmt
                    = conn.prepareStatement(
                            sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                Object[] row
                        = new Object[2];

                row[0]
                        = rs.getString(
                                "report_day");

                row[1]
                        = rs.getInt(
                                "total_reports");

                trends.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return trends;
    }

    public List<Object[]> getRiskAlerts() {

        List<Object[]> alerts
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql
                    = "SELECT street_id, "
                    + "COUNT(*) AS total_reports "
                    + "FROM reports "
                    + "GROUP BY street_id "
                    + "HAVING total_reports >= 3 "
                    + "ORDER BY total_reports DESC";

            PreparedStatement stmt
                    = conn.prepareStatement(
                            sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                Object[] row
                        = new Object[2];

                row[0]
                        = rs.getInt(
                                "street_id");

                row[1]
                        = rs.getInt(
                                "total_reports");

                alerts.add(row);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return alerts;
    }

    public List<Object[]> getSmartRecommendations() {

        List<Object[]> recommendations
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql
                    = "SELECT street_id, "
                    + "COUNT(*) AS total_reports "
                    + "FROM reports "
                    + "GROUP BY street_id "
                    + "ORDER BY total_reports DESC";

            PreparedStatement stmt
                    = conn.prepareStatement(
                            sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                Object[] row
                        = new Object[2];

                row[0]
                        = rs.getInt(
                                "street_id");

                row[1]
                        = rs.getInt(
                                "total_reports");

                recommendations.add(
                        row);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return recommendations;
    }

    public boolean resolveReport(int id) {

        boolean status = false;

        try {

            Connection conn
                    = DBConnection.getConnection();

            String sql
                    = "UPDATE reports SET status='Resolved' WHERE id=?";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            stmt.setInt(1, id);

            int rows
                    = stmt.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Integer> getDailyReportCounts() {

        List<Integer> counts
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection.getConnection();

            String sql
                    = "SELECT COUNT(*) AS total "
                    + "FROM reports "
                    + "GROUP BY DATE(created_at) "
                    + "ORDER BY DATE(created_at)";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                counts.add(
                        rs.getInt("total"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return counts;
    }

    public List<String> getDailyReportDates() {

        List<String> dates
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection.getConnection();

            String sql
                    = "SELECT DATE(created_at) AS report_date "
                    + "FROM reports "
                    + "GROUP BY DATE(created_at) "
                    + "ORDER BY DATE(created_at)";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                dates.add(
                        rs.getString("report_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dates;
    }

    public void resolveReportsByStreet(
            int streetId) {

        String sql
                = "UPDATE reports "
                + "SET status='Resolved', "
                + "resolved_at=NOW() "
                + "WHERE street_id=?";

        try (Connection conn
                = DBConnection.getConnection(); PreparedStatement stmt
                = conn.prepareStatement(sql)) {

            stmt.setInt(1, streetId);

            stmt.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

}
