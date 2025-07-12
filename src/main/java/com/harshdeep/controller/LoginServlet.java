package com.harshdeep.controller;

import com.harshdeep.service.UserService;
import com.harshdeep.serviceimpl.UserServiceImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userid");
        String password = request.getParameter("password");

        if (userId == null || userId.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "User ID and password are required.");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
            return;
        }

        try {
            boolean authenticated = userService.authenticate(userId, password);

            if (authenticated) {
                HttpSession session = request.getSession();
                session.setAttribute("userid", userId);
                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("error", "Invalid password.");
                request.getRequestDispatcher("signin.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
    }
}


