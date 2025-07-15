package com.harshdeep.controller;


import com.harshdeep.service.ContactsService;
import com.harshdeep.serviceimpl.ContactsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteContactsServlet")
public class DeleteContactsServlet extends HttpServlet {

    private ContactsService contactsService = new ContactsServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contactId = request.getParameter("contactId");

        contactsService.deleteContact(contactId);

        response.sendRedirect("home.jsp");
    }




}
