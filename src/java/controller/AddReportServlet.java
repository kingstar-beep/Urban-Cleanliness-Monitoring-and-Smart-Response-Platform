package controller;

import dao.ReportDAO;
import model.Report;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/add-report")
public class AddReportServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int streetId =
                Integer.parseInt(request.getParameter("street_id"));

        String type = request.getParameter("type");

        String source = request.getParameter("source");

        Report report =
                new Report(streetId, type, source);

        ReportDAO dao = new ReportDAO();

        boolean status = dao.addReport(report);

        if (status) {

            response.getWriter().println(
                    "Report added successfully!"
            );

        } else {

            response.getWriter().println(
                    "Failed to add report!"
            );
        }
    }
}