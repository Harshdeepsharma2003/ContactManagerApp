package com.harshdeep.controller;

import com.harshdeep.model.Contacts;
import com.harshdeep.service.ContactsService;
import com.harshdeep.serviceimpl.ContactsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayContactsServlet")
public class DisplayContactsServlet extends HttpServlet {
    private ContactsService contactsService = new ContactsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = null;
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("userid") != null) {
            userId = (String) session.getAttribute("userid");
        } else {
            response.sendRedirect("login.jsp");
            return; // prevents executing the rest of the code
        }

        List<Contacts> contactList = contactsService.getAllContacts(userId);
        request.setAttribute("contactList", contactList);

        String targetPage = request.getParameter("page");
        if (targetPage == null || targetPage.isEmpty()) {
            targetPage = "home.jsp";
        }

        request.getRequestDispatcher(targetPage).forward(request, response);
    }
}

