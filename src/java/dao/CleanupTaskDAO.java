package dao;

import model.CleanupTask;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import java.util.List;

public class CleanupTaskDAO {

    public boolean addTask(
            CleanupTask task) {

        boolean status = false;

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql
                    = "INSERT INTO cleanup_tasks("
                    + "street_id, assigned_team, task_status"
                    + ") VALUES (?, ?, ?)";

            PreparedStatement stmt
                    = conn.prepareStatement(sql);

            stmt.setInt(
                    1,
                    task.getStreetId());

            stmt.setString(
                    2,
                    task.getAssignedTeam());

            stmt.setString(
                    3,
                    task.getTaskStatus());

            int rows
                    = stmt.executeUpdate();

            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<CleanupTask>
            getAllTasks() {

        List<CleanupTask> tasks
                = new ArrayList<>();

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql
                    = "SELECT * FROM cleanup_tasks";

            PreparedStatement stmt
                    = conn.prepareStatement(
                            sql);

            ResultSet rs
                    = stmt.executeQuery();

            while (rs.next()) {

                CleanupTask task
                        = new CleanupTask();

                task.setId(
                        rs.getInt("id"));

                task.setStreetId(
                        rs.getInt(
                                "street_id"));

                task.setAssignedTeam(
                        rs.getString(
                                "assigned_team"));

                task.setTaskStatus(
                        rs.getString(
                                "task_status"));

                task.setAssignedDate(
                        rs.getString(
                                "assigned_date"));

                task.setCompletedDate(
                        rs.getString(
                                "completed_date"));

                tasks.add(task);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tasks;
    }

    public boolean updateTaskStatus(
            int taskId,
            String status) {

        boolean updated = false;

        try {

            Connection conn
                    = DBConnection
                            .getConnection();

            String sql;

            if (status.equalsIgnoreCase(
                    "Completed")) {

                sql
                        = "UPDATE cleanup_tasks "
                        + "SET task_status=?, "
                        + "completed_date=NOW() "
                        + "WHERE id=?";

            } else {

                sql
                        = "UPDATE cleanup_tasks "
                        + "SET task_status=? "
                        + "WHERE id=?";
            }

            PreparedStatement stmt
                    = conn.prepareStatement(
                            sql);

            stmt.setString(1, status);

            stmt.setInt(2, taskId);

            int rows
                    = stmt.executeUpdate();

            updated = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

    public CleanupTask getTaskById(
            int id) {

        CleanupTask task = null;

        String sql
                = "SELECT * FROM cleanup_tasks "
                + "WHERE id=?";

        try (Connection conn
                = DBConnection.getConnection(); PreparedStatement stmt
                = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            ResultSet rs
                    = stmt.executeQuery();

            if (rs.next()) {

                task = new CleanupTask();

                task.setId(
                        rs.getInt("id"));

                task.setStreetId(
                        rs.getInt(
                                "street_id"));

                task.setAssignedTeam(
                        rs.getString(
                                "assigned_team"));

                task.setTaskStatus(
                        rs.getString(
                                "task_status"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return task;
    }
}
