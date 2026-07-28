<%-- 
    Document   : smart-recommendations
    Created on : May 13, 2026, 3:35:43 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html"
        pageEncoding="UTF-8"%>

<%@ page import="dao.ReportDAO" %>
<%@ page import="dao.StreetDAO" %>

<%@ page import="model.Street" %>

<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html>

    <head>

        <title>
            Smart Recommendation Engine
        </title>

        <style>

            body{

                font-family:Arial;

                background:#f4f4f4;

                padding:20px;
            }

            .card{

                background:white;

                padding:20px;

                margin-bottom:20px;

                border-radius:10px;

                box-shadow:0 0 8px rgba(0,0,0,0.1);
            }

            .high{
                border-left:8px solid red;
            }

            .medium{
                border-left:8px solid orange;
            }

            .low{
                border-left:8px solid green;
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
                AI Smart Recommendations
            </h2>

            <%

                ReportDAO reportDAO
                        = new ReportDAO();

                StreetDAO streetDAO
                        = new StreetDAO();

                List<Object[]> recommendations
                        = reportDAO
                                .getSmartRecommendations();

                for (Object[] row : recommendations) {

                    int streetId
                            = (Integer) row[0];

                    int totalReports
                            = (Integer) row[1];

                    Street street
                            = streetDAO
                                    .getStreetById(
                                            streetId);

                    String priority
                            = "LOW PRIORITY";

                    String recommendation
                            = "Routine monitoring recommended.";

                    String cssClass
                            = "low";

                    if (totalReports >= 6) {

                        priority
                                = "HIGH PRIORITY";

                        recommendation
                                = "Deploy emergency cleanup team immediately.";

                        cssClass
                                = "high";

                    } else if (totalReports >= 3) {

                        priority
                                = "MEDIUM PRIORITY";

                        recommendation
                                = "Schedule cleanup within 24 hours.";

                        cssClass
                                = "medium";
                    }

            %>

            <div class="card
                 <%= cssClass%>">

                <h3>

                    <%= priority%>

                </h3>

                <p>

                    <b>Street:</b>

                    <%= street.getName()%>

                </p>

                <p>

                    <b>Total Reports:</b>

                    <%= totalReports%>

                </p>

                <p>

                    <b>AI Recommendation:</b>

                    <%= recommendation%>

                </p>

            </div>

            <%
                }
            %>
        </div>
    </body>

</html>