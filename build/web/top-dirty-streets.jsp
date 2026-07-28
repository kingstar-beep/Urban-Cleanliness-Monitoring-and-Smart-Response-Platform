<%-- 
    Document   : top-dirty-streets
    Created on : May 10, 2026, 4:25:35 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="dao.ScoreDAO" %>
<%@ page import="dao.StreetDAO" %>
<%@ page import="model.Score" %>
<%@ page import="model.Street" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>

        <title>Top Dirty Streets</title>

        <style>

            table{
                width:80%;
                border-collapse: collapse;
                margin:auto;
            }

            th, td{
                border:1px solid #ccc;
                padding:12px;
                text-align:center;
            }

            th{
                background:#222;
                color:white;
            }

            .dirty{
                background:red;
                color:white;
            }

            .moderate{
                background:orange;
            }

            .clean{
                background:green;
                color:white;
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
            <h2 align="center">
                Top Dirty Streets Dashboard
            </h2>

            <table>

                <tr>
                    <th>Rank</th>
                    <th>Street</th>
                    <th>Reports</th>
                    <th>Score</th>
                    <th>Status</th>
                </tr>

                <%                ScoreDAO scoreDAO
                            = new ScoreDAO();

                    StreetDAO streetDAO
                            = new StreetDAO();

                    List<Score> scores
                            = scoreDAO.getTopDirtyStreets();

                    int rank = 1;

                    for (Score score : scores) {

                        Street street
                                = streetDAO.getStreetById(
                                        score.getStreetId());

                        String cssClass = "clean";

                        if (score.getStatus()
                                .equalsIgnoreCase("Moderate")) {

                            cssClass = "moderate";

                        } else if (score.getStatus()
                                .equalsIgnoreCase("Dirty")) {

                            cssClass = "dirty";
                        }

                %>

                <tr class="<%= cssClass%>">

                    <td><%= rank++%></td>

                    <td><%= street.getName()%></td>

                    <td>
                        <%= score.getComplaintCount()%>
                    </td>

                    <td>
                        <%= score.getFinalScore()%>
                    </td>

                    <td>
                        <%= score.getStatus()%>
                    </td>

                </tr>

                <%
                    }
                %>

            </table>
        </div>
    </body>
</html>