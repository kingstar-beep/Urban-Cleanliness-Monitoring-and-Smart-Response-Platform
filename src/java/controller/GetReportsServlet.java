package controller;

import dao.ReportDAO;
import model.Report;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/reports")
public class GetReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        ReportDAO dao = new ReportDAO();

        List<Report> reports = dao.getAllReports();

        response.getWriter().println("<h2>Reports List</h2>");

        for (Report report : reports) {

            response.getWriter().println(
                    "<p>"
                    + "Report ID: " + report.getId()
                    + " | Street ID: " + report.getStreetId()
                    + " | Type: " + report.getType()
                    + " | Source: " + report.getSource()
                    + "</p>"
            );
        }
    }
}