package com.harshdeep.servlet;

import com.harshdeep.util.DbUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userid = request.getParameter("userid");
        String password = request.getParameter("password");

        if (userid == null || userid.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "User ID and password are required.");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
            return;
        }

        boolean isAuthenticated = false;

        try (Connection conn = DbUtil.getConnection()) {
            // 1. Check if the user exists with the given userid and password
            String sql = "SELECT * FROM users WHERE userId = ? AND passwordHash = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, userid);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        isAuthenticated = true;
                    }
                }
            }

            // 2. If not authenticated, insert new user
            if (!isAuthenticated) {
                String insertSql = "INSERT INTO users (userId, passwordHash) VALUES (?, ?)";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                    insertStmt.setString(1, userid);
                    insertStmt.setString(2, password);
                    insertStmt.executeUpdate();
                    isAuthenticated = true; // Now the user is considered authenticated
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("signin.jsp").forward(request, response);
            return;
        }

        if (isAuthenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("userid", userid);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("error", "Login failed.");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signin.jsp").forward(request, response);
    }
}
