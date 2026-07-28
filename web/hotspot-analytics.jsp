<%-- 
    Document   : hotspot-analytics
    Created on : May 13, 2026, 3:06:30 PM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="dao.ReportDAO" %>
<%@ page import="dao.StreetDAO" %>

<%@ page import="model.Street" %>

<%@ page import="java.util.List" %>



<html>

    <head>

        <title>
            Hotspot Analytics Dashboard
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

            .hotspot{

                background:#ff4d4d;

                color:white;

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
            <h2>
                Recurring Dirty Hotspots
            </h2>

            <table>

                <tr>

                    <th>Street</th>

                    <th>Total Reports</th>

                    <th>Risk Level</th>

                </tr>

                <%                    ReportDAO reportDAO
                            = new ReportDAO();

                    StreetDAO streetDAO
                            = new StreetDAO();

                    List<Object[]> hotspots
                            = reportDAO
                                    .getHotspotData();

                    for (Object[] row : hotspots) {

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

                        String cssClass = "";

                        if (totalReports >= 5) {

                            riskLevel = "High";

                            cssClass = "hotspot";

                        } else if (totalReports >= 3) {

                            riskLevel = "Medium";
                        }

                %>

                <tr class="<%= cssClass%>">

                    <td>
                        <%= street.getName()%>
                    </td>

                    <td>
                        <%= totalReports%>
                    </td>

                    <td>
                        <%= riskLevel%>
                    </td>

                </tr>

                <%
                    }
                %>

            </table>
        </div>
    </body>

</html>