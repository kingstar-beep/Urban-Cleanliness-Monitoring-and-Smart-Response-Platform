package controller;

import dao.CleanupTaskDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ReportDAO;

import model.CleanupTask;

@WebServlet("/update-task-status")
public class UpdateTaskStatusServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        int taskId
                = Integer.parseInt(
                        request.getParameter(
                                "taskId"));

        String status
                = request.getParameter(
                        "status");

        CleanupTaskDAO dao
                = new CleanupTaskDAO();

        boolean updated
                = dao.updateTaskStatus(
                        taskId,
                        status);

        if (updated) {

            if (status.equalsIgnoreCase(
                    "Completed")) {

                CleanupTask task
                        = dao.getTaskById(
                                taskId);

                ReportDAO reportDAO
                        = new ReportDAO();

                reportDAO.resolveReportsByStreet(
                        task.getStreetId());
            }

            response.sendRedirect(
                    "cleanup-dashboard.jsp");

        } else {

            response.getWriter()
                    .println(
                            "Status update failed!");
        }
    }
}
