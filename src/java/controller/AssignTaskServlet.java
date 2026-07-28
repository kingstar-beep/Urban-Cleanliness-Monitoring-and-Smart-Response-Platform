package controller;

import dao.CleanupTaskDAO;

import model.CleanupTask;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/assign-task")
public class AssignTaskServlet
        extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        //  int streetId =
        //         Integer.parseInt(
        //         request.getParameter(
        //                "streetId"));
        String streetValue
                = request.getParameter(
                        "streetId");

        System.out.println(
                "Street ID = "
                + streetValue);

        int streetId
                = Integer.parseInt(
                        streetValue.trim());

        String assignedTeam
                = request.getParameter(
                        "assignedTeam");

        CleanupTask task
                = new CleanupTask();

        task.setStreetId(
                streetId);

        task.setAssignedTeam(
                assignedTeam);

        task.setTaskStatus(
                "Pending");

        CleanupTaskDAO dao
                = new CleanupTaskDAO();

        boolean status
                = dao.addTask(task);

        if (status) {

            response.getWriter()
                    .println(
                            "Cleanup task assigned successfully!");

        } else {

            response.getWriter()
                    .println(
                            "Task assignment failed!");
        }
    }
}
