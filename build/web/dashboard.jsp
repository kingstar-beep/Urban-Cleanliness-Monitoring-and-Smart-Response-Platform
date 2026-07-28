<%-- 
    Document   : dashboard
    Created on : May 7, 2026, 2:29:58 AM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="model.Score" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Urban Cleanliness Dashboard</title>

        <style>

            body{
                font-family: Arial;
                margin: 30px;
            }

            table{
                width: 100%;
                border-collapse: collapse;
            }

            th, td{
                border: 1px solid #ccc;
                padding: 10px;
                text-align: center;
            }

            th{
                background-color: #333;
                color: white;
            }

            .clean{
                background-color: #90EE90;
            }

            .moderate{
                background-color: #FFD700;
            }

            .dirty{
                background-color: #FF7F7F;
            }

        </style>

    </head>
    <body>

        <h1>Urban Cleanliness Dashboard</h1>

        <table>

            <tr>
                <th>Street ID</th>
                <th>Reports</th>
                <th>Score</th>
                <th>Status</th>
            </tr>

            <%

                ScoreDAO dao = new ScoreDAO();

                List<Score> scores = dao.getAllScores();

                for (Score score : scores) {

                    String cssClass = "";

                    String status
                            = score.getStatus().trim().toLowerCase();

                    if (status.equals("clean")) {
                        cssClass = "clean";
                    } else if (status.equals("moderate")) {
                        cssClass = "moderate";
                    } else if (status.equals("dirty")) {
                        cssClass = "dirty";
                    }

            %>

            <tr class="<%= cssClass%>">

                <td><%= score.getStreetId()%></td>

                <td><%= score.getComplaintCount()%></td>

                <td><%= score.getFinalScore()%></td>

                <td><%= score.getStatus()%></td>

            </tr>

            <%
                }
            %>

        </table>

    </body>
</html>