<%-- 
    Document   : risk-alerts
    Created on : May 13, 2026, 3:30:30 PM
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
            AI Risk Alerts Dashboard
        </title>

        <style>

            body{

                font-family:Arial;

                background:#f4f4f4;

                padding:20px;
            }

            .alert-box{

                background:white;

                padding:20px;

                margin-bottom:20px;

                border-left:8px solid red;

                border-radius:8px;

                box-shadow:0 0 8px rgba(0,0,0,0.1);
            }

            .high{
                border-left-color:red;
            }

            .medium{
                border-left-color:orange;
            }

            .low{
                border-left-color:green;
            }

            h2{
                margin-bottom:30px;
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
                Automated AI Risk Alerts
            </h2>

            <%                ReportDAO reportDAO
                        = new ReportDAO();

                StreetDAO streetDAO
                        = new StreetDAO();

                List<Object[]> alerts
                        = reportDAO
                                .getRiskAlerts();

                for (Object[] row : alerts) {

                    int streetId
                            = (Integer) row[0];

                    int totalReports
                            = (Integer) row[1];

                    Street street
                            = streetDAO
                                    .getStreetById(
                                            streetId);

                    String riskLevel
                            = "Low";

                    String cssClass
                            = "low";

                    if (totalReports >= 6) {

                        riskLevel
                                = "HIGH RISK";

                        cssClass
                                = "high";

                    } else if (totalReports >= 3) {

                        riskLevel
                                = "MEDIUM RISK";

                        cssClass
                                = "medium";
                    }

            %>

            <div class="alert-box
                 <%= cssClass%>">

                <h3>

                    🚨
                    <%= riskLevel%>

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

                    AI has detected increasing
                    cleanliness complaints in this area.

                    Immediate operational review
                    is recommended.

                </p>

            </div>

            <%
                }
            %>
        </div>
    </body>

</html>
