package servlet;

import dao.ReportDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resolve-report")
public class ResolveReportServlet
extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id =
        Integer.parseInt(
                request.getParameter("id"));

        ReportDAO dao =
                new ReportDAO();

        dao.resolveReport(id);

        response.sendRedirect(
        "admin-dashboard.jsp");
    }
}