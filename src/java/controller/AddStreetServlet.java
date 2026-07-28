package controller;

import dao.StreetDAO;
import model.Street;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/add-street")
public class AddStreetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String city = request.getParameter("city");

        double latitude =
                Double.parseDouble(request.getParameter("latitude"));

        double longitude =
                Double.parseDouble(request.getParameter("longitude"));

        Street street =
                new Street(name, city, latitude, longitude);

        StreetDAO dao = new StreetDAO();

        boolean status = dao.addStreet(street);

        if (status) {
            response.getWriter().println(
                    "Street added successfully!"
            );
        } else {
            response.getWriter().println(
                    "Failed to add street!"
            );
        }
    }
}