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

@WebServlet("/UpdateContactServlet")
public class UpdateContactServlet extends HttpServlet {

    // Use the service layer
    private ContactsService contactsService = new ContactsServiceImpl();



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contactId = request.getParameter("contactId");
        Contacts contact = contactsService.getContactById(contactId);
         if (contact == null) {
            request.setAttribute("errorMessage", "No contact found for ID " + contactId);
        } else {
            request.setAttribute("Contacts", contact);
        }

        request.getRequestDispatcher("updatecontact.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contactId = request.getParameter("contactId"); // read-only, used for identifying record
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String category = request.getParameter("category");
        String favorite = request.getParameter("favorite");

        Contacts contact = new Contacts();
        contact.setName(name);
        contact.setPhone(phone);
        contact.setEmail(email);
        contact.setAddress(address);
        contact.setCategory(category);
        contact.setIsFavorite(favorite);

        contactsService.updateContact(contactId, contact);

        response.sendRedirect("home.jsp"); // or wherever you want to redirect
    }


}
