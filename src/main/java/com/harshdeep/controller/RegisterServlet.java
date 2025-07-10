package com.harshdeep.controller;

import com.harshdeep.model.User;
import com.harshdeep.service.UserService;
import com.harshdeep.serviceimpl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    // Use the service layer
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract parameters from request
        String userid = request.getParameter("userid");
        System.out.println("USERID from request: " + userid);

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        if (userid == null || userid.trim().isEmpty()) {
            request.setAttribute("error", "User ID is required.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Create User model object
        User user = new User(userid, username, password,email);

        try {
            // Register user via service layer
            userService.insertUser(user);

            // On success, redirect to success page
            response.sendRedirect("signin.jsp");
        } catch (IllegalArgumentException e) {
            // Validation or business logic error
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
            // Unexpected errors (e.g. DB errors)
            request.setAttribute("error", "Internal server error. Please try again later.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
}

