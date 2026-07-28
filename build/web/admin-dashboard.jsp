<%-- 
    Document   : admin-dashboard
    Created on : May 10, 2026, 11:46:04 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="dao.StreetDAO" %>
<%@ page import="dao.ReportDAO" %>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="dao.CleanupTaskDAO" %>
<%@ page import="model.Street" %>
<%@ page import="model.Report" %>
<%@ page import="model.Score" %>

<%@ page import="java.util.List" %>
<%

    ReportDAO reportDAO
            = new ReportDAO();

    ScoreDAO scoreDAO
            = new ScoreDAO();

    CleanupTaskDAO taskDAO
            = new CleanupTaskDAO();

    int totalReports
            = reportDAO
                    .getAllReports()
                    .size();

    int totalScores
            = scoreDAO
                    .getAllScores()
                    .size();

    int totalTasks
            = taskDAO
                    .getAllTasks()
                    .size();

    int dirtyCount = 0;

    int criticalCount = 0;

    for (model.Score score
            : scoreDAO.getAllScores()) {

        if (score.getStatus()
                .equalsIgnoreCase(
                        "Dirty")) {

            dirtyCount++;
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>

        <title>Admin Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>

            body{
                font-family: Arial;
                background:#f4f4f4;
                margin:0;
                padding:0;
            }

            h1{
                text-align:center;
                padding:20px;
            }

            .dashboard{
                display:grid;
                grid-template-columns:
                    repeat(auto-fit, minmax(220px,1fr));

                gap:20px;

                padding:20px;
            }

            .card{

                padding:30px;

                border-radius:12px;

                color:white;

                text-align:center;

                font-size:20px;

                font-weight:bold;

                box-shadow:0 4px 10px rgba(0,0,0,0.2);
            }

            .blue{
                background:#3498db;
            }

            .green{
                background:#2ecc71;
            }

            .orange{
                background:#f39c12;
            }

            .red{
                background:#e74c3c;
            }

            .dark{
                background:#2c3e50;
            }

            .number{
                font-size:40px;
                margin-top:10px;
            }

            .alert-section{

                width:90%;

                margin:20px auto;
            }

            .alert-card{

                padding:18px;

                border-radius:12px;

                margin-bottom:15px;

                color:white;

                font-weight:bold;

                box-shadow:0 0 10px
                    rgba(0,0,0,0.1);
            }

            .critical-alert{

                background:#b91c1c;
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
                Urban Cleanliness Admin Dashboard
            </h1>

            <%            StreetDAO streetDAO
                        = new StreetDAO();

                // ReportDAO reportDAO
                //         = new ReportDAO();
                //  ScoreDAO scoreDAO
                //         = new ScoreDAO();
                List<Street> streets
                        = streetDAO.getAllStreets();

                List<Report> reports
                        = reportDAO.getAllReports();

                List<Integer> trendCounts
                        = reportDAO.getDailyReportCounts();

                List<String> trendDates
                        = reportDAO.getDailyReportDates();

                List<Score> scores
                        = scoreDAO.getAllScores();

                int highPriority = 0;

                int mediumPriority = 0;

                int lowPriority = 0;

                for (Score score : scores) {

                    if (score.getStatus()
                            .equalsIgnoreCase(
                                    "Dirty")) {

                        highPriority++;

                    } else if (score.getStatus()
                            .equalsIgnoreCase(
                                    "Moderate")) {

                        mediumPriority++;

                    } else {

                        lowPriority++;
                    }
                }

                int cleanCount = 0;
                int moderateCount = 0;
                //int dirtyCount = 0;

                for (Score score : scores) {

                    if (score.getStatus()
                            .equalsIgnoreCase("Clean")) {

                        cleanCount++;

                    } else if (score.getStatus()
                            .equalsIgnoreCase("Moderate")) {

                        moderateCount++;

                    } else if (score.getStatus()
                            .equalsIgnoreCase("Dirty")) {

                        dirtyCount++;

                    } else if (score.getStatus()
                            .equalsIgnoreCase("Critical")) {

                        criticalCount++;
                    }
                }

            %>

            <div class="alert-section">

                <h2>
                    🚨 Operational Alerts
                </h2>

                <%    for (Score score : scores) {

                        if (score.getStatus()
                                .equalsIgnoreCase(
                                        "Critical")) {

                            Street alertStreet
                                    = streetDAO.getStreetById(
                                            score.getStreetId());

                %>

                <div class="alert-card critical-alert">

                    ⚠️ Critical hotspot detected at
                    <b>
                        <%= alertStreet.getName()%>
                    </b>

                </div>

                <%
                        }
                    }
                %>

            </div>

            <div style="
                 text-align:right;
                 margin:20px;
                 ">

                <a href="logout"
                   style="
                   background:red;
                   color:white;
                   padding:10px 15px;
                   text-decoration:none;
                   border-radius:6px;
                   ">

                    Logout

                </a>

            </div>

            <div class="dashboard">

                <div class="card dark">

                    Critical Hotspots

                    <div class="number">
                        <%= criticalCount%>
                    </div>

                </div>

                <div class="card blue">

                    Total Streets

                    <div class="number">
                        <%= streets.size()%>
                    </div>

                </div>

                <div class="card dark">

                    Total Reports

                    <div class="number">
                        <%= reports.size()%>
                    </div>

                </div>

                <div class="card green">

                    Clean Streets

                    <div class="number">
                        <%= cleanCount%>
                    </div>

                </div>

                <div class="card orange">

                    Moderate Streets

                    <div class="number">
                        <%= moderateCount%>
                    </div>

                </div>

                <div class="card red">

                    Dirty Streets

                    <div class="number">
                        <%= dirtyCount%>
                    </div>

                </div>

            </div>

            <div style="
                 display:flex;
                 gap:20px;
                 justify-content:center;
                 margin:20px;
                 flex-wrap:wrap;
                 ">

                <div style="
                     background:#ff4d4d;
                     color:white;
                     padding:20px;
                     width:250px;
                     border-radius:12px;
                     text-align:center;
                     ">

                    <h2>
                        High Priority
                    </h2>

                    <h1>
                        <%= highPriority%>
                    </h1>

                    <p>
                        Dirty Streets
                    </p>

                </div>

                <div style="
                     background:#ffaa00;
                     color:white;
                     padding:20px;
                     width:250px;
                     border-radius:12px;
                     text-align:center;
                     ">

                    <h2>
                        Medium Priority
                    </h2>

                    <h1>
                        <%= mediumPriority%>
                    </h1>

                    <p>
                        Moderate Streets
                    </p>

                </div>

                <div style="
                     background:#28a745;
                     color:white;
                     padding:20px;
                     width:250px;
                     border-radius:12px;
                     text-align:center;
                     ">

                    <h2>
                        Low Priority
                    </h2>

                    <h1>
                        <%= lowPriority%>
                    </h1>

                    <p>
                        Clean Streets
                    </p>

                </div>

            </div>

            <div style="
                 width:80%;
                 margin:auto;
                 background:white;
                 padding:20px;
                 border-radius:12px;
                 margin-top:20px;
                 ">

                <h2 align="center">
                    Cleanliness Analytics
                </h2>

                <canvas id="cleanlinessChart"></canvas>

            </div>

            <div style="
                 width:80%;
                 margin:auto;
                 background:white;
                 padding:20px;
                 border-radius:12px;
                 margin-top:20px;
                 ">

                <h2 align="center">
                    Dirt Report Trends
                </h2>

                <canvas id="trendChart"></canvas>

            </div>

            <div style="
                 padding:20px;
                 ">

                <div style="
                     max-height:500px;
                     overflow-y:auto;
                     border-radius:10px;
                     ">
                    <h2>
                        Recent Dirt Reports
                    </h2>

                    <table
                        style="
                        width:100%;
                        border-collapse:collapse;
                        background:white;
                        ">

                        <tr style="background:#222;color:white;">

                            <th style="padding:12px;">
                                Street
                            </th>

                            <th style="padding:12px;">
                                Report
                            </th>

                            <th style="padding:12px;">
                                Image
                            </th>

                            <th style="padding:12px;">
                                Uploaded
                            </th>
                            <th style="padding:12px;">
                                Action
                            </th>

                        </tr>

                        <%

                            for (Report report : reports) {

                                Street street
                                        = streetDAO.getStreetById(
                                                report.getStreetId());

                        %>

                        <tr style="border-bottom:1px solid #ccc;">

                            <td style="padding:12px;">
                                <%= street.getName()%>
                            </td>

                            <td style="padding:12px;">
                                <%= report.getReportText()%>
                            </td>

                            <td style="padding:12px;">

                                <img
                                    src="<%= report.getImagePath()%>"
                                    width="120"
                                    height="80"
                                    style="border-radius:8px;"/>

                            </td>

                            <td style="padding:12px;">

                                <%= report.getStatus()%>

                            </td>

                            <td style="padding:12px;">

                                <%

                                    if (report.getStatus()
                                            .equalsIgnoreCase("Pending")) {
                                %>

                                <a href="resolve-report?id=<%= report.getId()%>"
                                   style="
                                   background:green;
                                   color:white;
                                   padding:8px 12px;
                                   text-decoration:none;
                                   border-radius:6px;
                                   ">

                                    Resolve

                                </a>

                                <%
                                } else {
                                %>

                                <span style="color:green;font-weight:bold;">
                                    Resolved
                                </span>

                                <%
                                    }
                                %>

                            </td>

                        </tr>

                        <%
                            }
                        %>

                    </table>
                </div>

            </div>
            <script>

                const ctx =
                        document.getElementById(
                                'cleanlinessChart'
                                );
                new Chart(ctx, {

                type: 'bar',
                        data: {

                        labels: [
                                'Clean',
                                'Moderate',
                                'Dirty',
                                'Critical'
                        ],
                                datasets: [{

                                label:
                                        'Street Cleanliness Status',
                                        data: [
                <%= cleanCount%>,
                <%= moderateCount%>,
                <%= dirtyCount%>,
                <%= criticalCount%>
                                        ],
                                        backgroundColor: [
                                                'green',
                                                'yellow',
                                                'orange',
                                                '#8b0000'
                                        ],
                                        borderWidth: 1
                                }]
                        },
                        options: {

                        responsive: true,
                                scales: {

                                y: {
                                beginAtZero: true
                                }
                                }
                        }
                });
            </script>

            <script>

                const trendCtx =
                        document.getElementById(
                                'trendChart'
                                );
                new Chart(trendCtx, {

                type: 'line',
                        data: {

                        labels: [

                <%

                    for (int i = 0;
                            i < trendDates.size();
                            i++) {

                %>

                        "<%= trendDates.get(i)%>"

                <%

                    if (i < trendDates.size() - 1) {
                %>

                        ,
                <%
                        }
                    }
                %>

                        ],
                                datasets: [{

                                label:
                                        'Reports Submitted',
                                        data: [

                <%
                    for (int i = 0;
                            i < trendCounts.size();
                            i++) {

                %>

                <%= trendCounts.get(i)%>

                <%

                    if (i < trendCounts.size() - 1) {
                %>

                                        ,
                <%
                        }
                    }
                %>

                                        ],
                                        borderColor: 'red',
                                        fill: false,
                                        tension: 0.3
                                }]
                        },
                        options: {

                        responsive: true
                        }
                });

            </script>
        </div>
    </body>
</html>
