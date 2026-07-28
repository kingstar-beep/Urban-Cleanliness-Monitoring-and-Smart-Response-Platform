<%-- 
    Document   : trend-prediction
    Created on : May 13, 2026, 3:22:57 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="dao.ReportDAO" %>

<%@ page import="java.util.List" %>


<html>

    <head>

        <title>
            Trend Prediction Dashboard
        </title>

        <script
            src="https://cdn.jsdelivr.net/npm/chart.js">
        </script>

        <style>

            body{
                font-family:Arial;
                padding:20px;
                background:#f4f4f4;
            }

            .chart-container{

                width:90%;

                margin:auto;

                background:white;

                padding:20px;

                border-radius:12px;
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
                Urban Cleanliness Trend Prediction
            </h2>

            <div class="chart-container">

                <canvas id="trendChart"></canvas>

            </div>

            <%                ReportDAO dao
                        = new ReportDAO();

                List<Object[]> trends
                        = dao.getTrendData();

                String labels = "";

                String data = "";

                for (Object[] row : trends) {

                    labels += "'"
                            + row[0]
                            + "',";

                    data
                            += row[1] + ",";
                }

            %>

            <script>

                var ctx =
                        document.getElementById(
                                'trendChart')
                        .getContext('2d');

                new Chart(ctx, {

                    type: 'line',

                    data: {

                        labels: [
                <%= labels%>
                        ],

                        datasets: [{

                                label:
                                        'Daily Reports Trend',

                                data: [
                <%= data%>
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
