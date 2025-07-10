<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body {
            background: #f6f8fa;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            max-width: 400px;
            margin: 60px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            padding: 32px 28px 24px 28px;
        }
        .profile-container h2 {
            text-align: center;
            margin-bottom: 28px;
            color: #1976d2;
            letter-spacing: 1px;
        }
        .profile-form label {
            display: block;
            margin-bottom: 8px;
            margin-top: 18px;
            color: #333;
            font-weight: 500;
        }
        .profile-form input[type="text"],
        .profile-form input[type="email"] {
            width: 100%;
            padding: 10px 12px;
            border: 1.5px solid #b0bec5;
            border-radius: 6px;
            font-size: 1rem;
            margin-bottom: 6px;
            transition: border 0.2s;
        }
        .profile-form input[type="text"]:focus,
        .profile-form input[type="email"]:focus {
            border-color: #1976d2;
            outline: none;
        }
        .profile-form .form-actions {
            text-align: center;
            margin-top: 24px;
        }
        .profile-form button {
            background: #1976d2;
            color: #fff;
            border: none;
            padding: 12px 38px;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }
        .profile-form button:hover {
            background: #1565c0;
        }
        .profile-form .error {
            color: #d32f2f;
            margin-top: 8px;
            text-align: center;
            font-size: 0.98rem;
        }
        .profile-form .success {
            color: #388e3c;
            margin-top: 8px;
            text-align: center;
            font-size: 0.98rem;
        }
    </style>
</head>
<body>
<div class="profile-container">
    <h2>User Profile</h2>
    <form class="profile-form" id="profileForm" action="UpdateUserProfileServlet" method="post" autocomplete="off" onsubmit="return validateProfileForm();">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" value="${user.username}" required>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" value="${user.email}" required>

        <div class="form-actions">
            <button type="submit">Update Profile</button>
        </div>
        <div id="formMessage"></div>
    </form>
</div>

<script>
function validateProfileForm() {
    var username = document.getElementById('username').value.trim();
    var email = document.getElementById('email').value.trim();
    var messageDiv = document.getElementById('formMessage');
    messageDiv.innerHTML = '';
    messageDiv.className = '';

    // Username validation
    if (username.length < 3) {
        messageDiv.innerHTML = 'Username must be at least 3 characters.';
        messageDiv.className = 'error';
        return false;
    }
    // Email validation (simple regex)
    var emailPattern = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
    if (!emailPattern.test(email)) {
        messageDiv.innerHTML = 'Please enter a valid email address.';
        messageDiv.className = 'error';
        return false;
    }
    // Optionally, show a success message (for demonstration)
    // messageDiv.innerHTML = 'Profile updated successfully!';
    // messageDiv.className = 'success';
    // return false; // Prevent actual submit for demo
    return true;
}
</script>
</body>
</html>
