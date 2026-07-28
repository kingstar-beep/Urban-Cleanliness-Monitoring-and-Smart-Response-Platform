<%-- 
    Document   : cleanup-dashboard
    Created on : May 12, 2026, 8:20:30 AM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="dao.CleanupTaskDAO" %>
<%@ page import="dao.StreetDAO" %>

<%@ page import="model.CleanupTask" %>
<%@ page import="model.Street" %>

<%@ page import="java.util.List" %>



<html>

    <head>

        <title>
            Cleanup Operations Dashboard
        </title>

        <style>

            body{
                font-family:Arial;
                padding:20px;
                background:#f4f4f4;
            }

            table{

                width:100%;

                border-collapse:collapse;

                background:white;
            }

            th, td{

                padding:15px;

                border:1px solid #ccc;

                text-align:center;
            }

            th{

                background:#333;

                color:white;
            }

            .stats-grid{

                display:grid;

                grid-template-columns:
                    repeat(auto-fit,
                    minmax(220px,1fr));

                gap:20px;

                margin-bottom:25px;
            }

            .task-card{

                padding:25px;

                border-radius:15px;

                color:white;

                text-align:center;

                box-shadow:0 0 15px
                    rgba(0,0,0,0.1);
            }

            .task-card h2{

                font-size:40px;

                margin-bottom:10px;
            }

            .pending-card{

                background:#f59e0b;
            }

            .progress-card{

                background:#2563eb;
            }

            .completed-card{

                background:#16a34a;
            }

            table{

                border-radius:12px;

                overflow:hidden;

                box-shadow:0 0 15px
                    rgba(0,0,0,0.08);
            }

            button{

                background:#2563eb;

                color:white;

                border:none;

                padding:8px 14px;

                border-radius:8px;

                cursor:pointer;
            }

            button:hover{

                background:#1d4ed8;
            }

            select{

                padding:6px;

                border-radius:6px;
            }

        </style>

    </head>

    <body>
        <%            if (session.getAttribute(
                    "admin") == null) {

                response.sendRedirect(
                        "login.jsp");

                return;
            }

        %>
        <jsp:include page="sidebar.jsp"/>

        <div class="main-content">
            <h2>
                Cleanup Operations Dashboard
            </h2>

            <%                CleanupTaskDAO taskDAO
                        = new CleanupTaskDAO();

                StreetDAO streetDAO
                        = new StreetDAO();

                List<CleanupTask> tasks
                        = taskDAO.getAllTasks(); %>

            <%

                int pendingTasks = 0;
                int progressTasks = 0;
                int completedTasks = 0;

                for (CleanupTask task : tasks) {

                    if (task.getTaskStatus()
                            .equalsIgnoreCase(
                                    "Pending")) {

                        pendingTasks++;

                    } else if (task.getTaskStatus()
                            .equalsIgnoreCase(
                                    "In Progress")) {

                        progressTasks++;

                    } else if (task.getTaskStatus()
                            .equalsIgnoreCase(
                                    "Completed")) {

                        completedTasks++;
                    }
                }

            %>

            <div class="stats-grid">

                <div class="task-card pending-card">

                    <h2>
                        <%= pendingTasks%>
                    </h2>

                    <p>
                        Pending Tasks
                    </p>

                </div>

                <div class="task-card progress-card">

                    <h2>
                        <%= progressTasks%>
                    </h2>

                    <p>
                        Tasks In Progress
                    </p>

                </div>

                <div class="task-card completed-card">

                    <h2>
                        <%= completedTasks%>
                    </h2>

                    <p>
                        Completed Tasks
                    </p>

                </div>

            </div>
            <table>

                <tr>

                    <th>ID</th>

                    <th>Street</th>

                    <th>Assigned Team</th>

                    <th>Status</th>

                    <th>Assigned Date</th>

                    <th>Completed Date</th>

                </tr>

                <%

                    for (CleanupTask task : tasks) {

                        Street street
                                = streetDAO
                                        .getStreetById(
                                                task.getStreetId());

                %>

                <tr>

                    <td>
                        <%= task.getId()%>
                    </td>

                    <td>
                        <%= street.getName()%>
                    </td>

                    <td>
                        <%= task.getAssignedTeam()%>
                    </td>

                    <td>
                        <%

                            String badgeColor = "#f59e0b";

                            if (task.getTaskStatus()
                                    .equalsIgnoreCase(
                                            "In Progress")) {

                                badgeColor = "#2563eb";

                            } else if (task.getTaskStatus()
                                    .equalsIgnoreCase(
                                            "Completed")) {

                                badgeColor = "#16a34a";
                            }

                        %>

                        <div style="
                             margin-bottom:10px;
                             ">

                            <span style="
                                  background:<%= badgeColor%>;
                                  color:white;
                                  padding:6px 14px;
                                  border-radius:20px;
                                  font-size:13px;
                                  font-weight:bold;
                                  ">

                                <%= task.getTaskStatus()%>

                            </span>

                        </div>

                        <form action="update-task-status"
                              method="post">

                            <input type="hidden"
                                   name="taskId"
                                   value="<%= task.getId()%>">

                            <select name="status">

                                <option
                                    <%= task.getTaskStatus()
                                            .equals("Pending")
                                            ? "selected" : ""%>>

                                    Pending

                                </option>

                                <option
                                    <%= task.getTaskStatus()
                                            .equals("In Progress")
                                            ? "selected" : ""%>>

                                    In Progress

                                </option>

                                <option
                                    <%= task.getTaskStatus()
                                            .equals("Completed")
                                            ? "selected" : ""%>>

                                    Completed

                                </option>

                            </select>

                            <button type="submit">

                                Update

                            </button>

                        </form>

                    </td>

                    <td>
                        <%= task.getAssignedDate()%>
                    </td>

                    <td>
                        <%= task.getCompletedDate()%>
                    </td>

                </tr>

                <%
                    }
                %>

            </table>
        </div>
    </body>

</html>
