package com.harshdeep.controller;

import com.harshdeep.model.Contacts;
import com.harshdeep.service.ContactsService;
import com.harshdeep.serviceimpl.ContactsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddContactServlet")
public class AddContactServlet extends HttpServlet {

    // Use the service layer
    private ContactsService userService = new ContactsServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract parameters from request
        String contactid = request.getParameter("contactid");
        String userid = request.getParameter("userid");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String category = request.getParameter("category");
        String isfavorite = request.getParameter("isfavorite");

//required
        if (contactid == null || contactid.trim().isEmpty() || userid == null ||
                userid.trim().isEmpty() || name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                address == null || address.trim().isEmpty()) {
            request.setAttribute("error", "User ID is required.");
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }

        //contact model object
        Contacts contacts=new Contacts(contactid,userid,name,phone,email,address,
                                        category,isfavorite);

        try {
            // Register user via service layer
            userService.insertContact(contacts);

            // On success, redirect to success page
            response.sendRedirect("home.jsp");
        } catch (IllegalArgumentException e) {
            // Validation or business logic error
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (Exception e) {
            // Unexpected errors (e.g. DB errors)
            request.setAttribute("error", "Internal server error. Please try again later.");
            request.getRequestDispatcher("home.jsp").forward(request, response);
            e.printStackTrace();
        }


    }
}
