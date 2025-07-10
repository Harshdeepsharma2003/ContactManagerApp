<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Profile</title>
    <style>
        body {
            background: #eef2f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }
        .update-profile-container {
            max-width: 450px;
            margin: 70px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
            padding: 32px 28px;
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 28px;
            letter-spacing: 1.2px;
        }
        label {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            color: #34495e;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px 14px;
            margin-top: 6px;
            border: 1.8px solid #bdc3c7;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        .form-actions {
            margin-top: 28px;
            text-align: center;
        }
        button {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 12px 42px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 7px;
            cursor: pointer;
            transition: background-color 0.25s ease;
        }
        button:hover {
            background-color: #1c5980;
        }
        #formMessage {
            margin-top: 16px;
            text-align: center;
            font-weight: 600;
            font-size: 1rem;
        }
        #formMessage.error {
            color: #c0392b;
        }
        #formMessage.success {
            color: #27ae60;
        }
    </style>
</head>
<body>

<div class="update-profile-container">
    <h2>Update Profile</h2>
    <form id="updateProfileForm" action="UpdateUserProfileServlet" method="post" autocomplete="off" onsubmit="return validateForm();">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" value="${user.username}" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${user.email}" required />

        <label for="password">New Password</label>
        <input type="password" id="password" name="password" placeholder="Enter new password" />

        <label for="confirmPassword">Confirm New Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" />

        <div class="form-actions">
            <button type="submit">Update Profile</button>
        </div>
        <div id="formMessage"></div>
    </form>
</div>

<script>
    function validateForm() {
        const username = document.getElementById('username').value.trim();
        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const messageDiv = document.getElementById('formMessage');

        messageDiv.innerHTML = '';
        messageDiv.className = '';

        // Username validation
        if (username.length < 3) {
            messageDiv.textContent = 'Username must be at least 3 characters long.';
            messageDiv.className = 'error';
            return false;
        }

        // Email validation (simple regex)
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            messageDiv.textContent = 'Please enter a valid email address.';
            messageDiv.className = 'error';
            return false;
        }

        // Password validation (optional - only if user enters a new password)
        if (password.length > 0) {
            if (password.length < 6) {
                messageDiv.textContent = 'Password must be at least 6 characters long.';
                messageDiv.className = 'error';
                return false;
            }
            if (password !== confirmPassword) {
                messageDiv.textContent = 'Passwords do not match.';
                messageDiv.className = 'error';
                return false;
            }
        }

        // All validations passed
        return true;
    }
</script>

</body>
</html>
