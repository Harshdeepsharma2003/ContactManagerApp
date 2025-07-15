package com.harshdeep.controller;

import com.harshdeep.model.Contacts;
import com.harshdeep.model.User;
import com.harshdeep.service.UserService;
import com.harshdeep.serviceimpl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private  UserService userService= new UserServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String userId = request.getParameter("userId");
        User user = userService.getUserById(userId);
        if (user == null) {
            request.setAttribute("errorMessage", "No contact found for ID " + userId);
        } else {
            request.setAttribute("User", user);
        }

        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId"); // read-only, used for identifying record
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        user.setEmail(email);

        userService.updateUser(userId, user);

        response.sendRedirect("home.jsp"); // or wherever you want to redirect
    }



}
