<%-- 
    Document   : assign-task
    Created on : May 12, 2026, 12:29:22 AM
    Author     : KINGSTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.StreetDAO" %>
<%@ page import="model.Street" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html>

    <head>

        <title>
            Assign Cleanup Task
        </title>

        <style>

            body{

                font-family:Arial;

                background:#f4f4f4;

                padding:30px;
            }

            .container{

                background:white;

                padding:30px;

                border-radius:12px;

                width:500px;

                margin:auto;

                box-shadow:0 0 10px rgba(0,0,0,0.2);
            }

            input, select{

                width:100%;

                padding:12px;

                margin-top:10px;

                border-radius:6px;

                border:1px solid #ccc;
            }

            button{

                width:100%;

                padding:12px;

                margin-top:20px;

                background:#007bff;

                color:white;

                border:none;

                border-radius:6px;

                cursor:pointer;
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
            <div class="container">

                <h2>
                    Assign Cleanup Task
                </h2>

                <form action="assign-task"
                      method="post">

                    <label>
                        Select Street
                    </label>

                    <select name="streetId" required>

                        <%
                            StreetDAO dao
                                    = new StreetDAO();

                            List<Street> streets
                                    = dao.getAllStreets();

                            for (Street street : streets) {
                        %>

                        <option value="<%= street.getId()%>">
                            <%= street.getName()%>
                        </option>

                        <%
                            }
                        %>

                    </select>

                    <label>
                        Assigned Team
                    </label>

                    <input type="text"
                           name="assignedTeam"
                           placeholder="Enter cleanup team"
                           required>

                    <button type="submit">

                        Assign Task

                    </button>

                </form>

            </div>
        </div>
    </body>

</html>