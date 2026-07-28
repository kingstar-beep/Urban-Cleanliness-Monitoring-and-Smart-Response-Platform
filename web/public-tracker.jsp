<%-- 
    Document   : public-tracker
    Created on : May 12, 2026, 8:32:58 AM
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
            Public Cleanup Tracker
        </title>

        <style>

            body{

                font-family:Arial;

                background:#f4f4f4;

                padding:20px;
            }

            h1{

                text-align:center;

                margin-bottom:30px;
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

                background:#007bff;

                color:white;
            }

            .pending{
                color:red;
                font-weight:bold;
            }

            .progress{
                color:orange;
                font-weight:bold;
            }

            .completed{
                color:green;
                font-weight:bold;
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
            <h1>
                Urban Cleanliness Public Tracker
            </h1>

            <table>

                <tr>

                    <th>Street</th>

                    <th>Assigned Team</th>

                    <th>Status</th>

                    <th>Assigned Date</th>

                    <th>Completed Date</th>

                </tr>

                <%

                    CleanupTaskDAO taskDAO
                            = new CleanupTaskDAO();

                    StreetDAO streetDAO
                            = new StreetDAO();

                    List<CleanupTask> tasks
                            = taskDAO.getAllTasks();

                    for (CleanupTask task : tasks) {

                        Street street
                                = streetDAO
                                        .getStreetById(
                                                task.getStreetId());

                        String cssClass = "";

                        if (task.getTaskStatus()
                                .equalsIgnoreCase(
                                        "Pending")) {

                            cssClass = "pending";

                        } else if (task.getTaskStatus()
                                .equalsIgnoreCase(
                                        "In Progress")) {

                            cssClass = "progress";

                        } else {

                            cssClass = "completed";
                        }

                %>

                <tr>

                    <td>
                        <%= street.getName()%>
                    </td>

                    <td>
                        <%= task.getAssignedTeam()%>
                    </td>

                    <td class="<%= cssClass%>">

                        <%= task.getTaskStatus()%>

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