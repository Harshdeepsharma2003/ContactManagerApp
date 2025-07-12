<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete User Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .delete-profile-container {
            max-width: 400px;
            margin: 80px auto;
            background: #fff;
            padding: 30px 28px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #d32f2f;
            margin-bottom: 25px;
            letter-spacing: 1.1px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 14px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            margin-bottom: 16px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #d32f2f;
            outline: none;
        }
        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
        button {
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 12px 38px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 7px;
            cursor: pointer;
            transition: background-color 0.25s ease;
        }
        button:hover {
            background-color: #a82828;
        }
        #message {
            margin-top: 18px;
            text-align: center;
            font-weight: 600;
            font-size: 1rem;
        }
        #message.error {
            color: #d32f2f;
        }
        #message.success {
            color: #388e3c;
        }
    </style>
</head>
<body>

<div class="delete-profile-container">
    <h2>Delete User Profile</h2>
    <form id="deleteUserForm" action="DeleteUserProfileServlet" method="post" onsubmit="return validateForm();">
        <label for="userId">User ID</label>
        <input type="text" id="userId" name="userId" placeholder="Enter your User ID" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required />

        <div class="form-actions">
            <button type="submit">Delete Profile</button>
        </div>
        <div id="message"></div>
    </form>
</div>

<script>
    function validateForm() {
        const userId = document.getElementById('userId').value.trim();
        const password = document.getElementById('password').value.trim();
        const messageDiv = document.getElementById('message');

        messageDiv.textContent = '';
        messageDiv.className = '';

        if (userId.length === 0) {
            messageDiv.textContent = 'User ID is required.';
            messageDiv.className = 'error';
            return false;
        }

        if (password.length === 0) {
            messageDiv.textContent = 'Password is required.';
            messageDiv.className = 'error';
            return false;
        }

        // Additional validations can be added here if needed

        return true; // Allow form submission
    }
</script>

</body>
</html>
