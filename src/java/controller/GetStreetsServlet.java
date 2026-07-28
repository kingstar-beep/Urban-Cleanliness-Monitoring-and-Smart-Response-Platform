package controller;

import dao.StreetDAO;
import model.Street;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/streets")
public class GetStreetsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        StreetDAO dao = new StreetDAO();

        List<Street> streets = dao.getAllStreets();

        response.getWriter().println("<h2>Street List</h2>");

        for (Street street : streets) {

            response.getWriter().println(
                    "<p>"
                    + street.getId() + " | "
                    + street.getName() + " | "
                    + street.getCity()
                    + "</p>"
            );
        }
    }
}