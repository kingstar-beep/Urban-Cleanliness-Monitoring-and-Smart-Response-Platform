package controller;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/test-db")
public class TestConnectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try {

            Connection conn = DBConnection.getConnection();

            if (conn != null) {
                response.getWriter().println(
                        "<h2>Database Connected Successfully!</h2>"
                );
            } else {
                response.getWriter().println(
                        "<h2>Database Connection Failed!</h2>"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Error Occurred!</h2>"
            );
        }
    }
}