package controller;

import dao.AdminDAO;

import model.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet
extends HttpServlet {

    @Override
    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        String username =
                request.getParameter(
                        "username");

        String password =
                request.getParameter(
                        "password");

        AdminDAO dao =
                new AdminDAO();

        Admin admin =
                dao.login(
                        username,
                        password);

        if(admin != null){

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "admin",
                    admin);

            response.sendRedirect(
                    "admin-dashboard.jsp");

        }else{

            response.sendRedirect(
            "login.jsp?error=1");
        }
    }
}