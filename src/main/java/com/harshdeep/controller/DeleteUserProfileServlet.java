package com.harshdeep.controller;

import com.harshdeep.service.ContactsService;
import com.harshdeep.service.UserService;
import com.harshdeep.serviceimpl.ContactsServiceImpl;
import com.harshdeep.serviceimpl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteUserProfileServlet")
public class DeleteUserProfileServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");


        userService.deleteProfile(userId,password);

        response.sendRedirect("home.jsp");
    }
}
