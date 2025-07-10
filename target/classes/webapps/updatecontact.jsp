<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Contact</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }
        .update-contact-container {
            max-width: 500px;
            margin: 60px auto;
            background: #fff;
            padding: 30px 28px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #1976d2;
            margin-bottom: 28px;
            letter-spacing: 1.1px;
        }
        label {
            display: block;
            margin-top: 18px;
            font-weight: 600;
            color: #34495e;
        }
        input[type="text"],
        input[type="email"],
        select {
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
        select:focus {
            border-color: #1976d2;
            outline: none;
        }
        .checkbox-container {
            margin-top: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            color: #34495e;
        }
        .form-actions {
            margin-top: 28px;
            text-align: center;
        }
        button {
            background-color: #1976d2;
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
            background-color: #1565c0;
        }
        #formMessage {
            margin-top: 16px;
            text-align: center;
            font-weight: 600;
            font-size: 1rem;
        }
        #formMessage.error {
            color: #d32f2f;
        }
        #formMessage.success {
            color: #388e3c;
        }
    </style>
</head>
<body>

<div class="update-contact-container">
    <h2>Update Contact</h2>

    <form id="updateContactForm" action="UpdateContactServlet" method="post" onsubmit="return validateForm();">
        <!-- Hidden field to hold contactId -->
        <input type="hidden" name="contactId" value="${contact.contactId}" />

        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="${contact.name}" required />

        <label for="phone">Phone</label>
        <input type="text" id="phone" name="phone" value="${contact.phone}" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${contact.email}" required />

        <label for="address">Address</label>
        <input type="text" id="address" name="address" value="${contact.address}" required />

        <label for="category">Category</label>
        <select id="category" name="category" required>
            <option value="">--Select Category--</option>
            <option value="teachers" <c:if test="${contact.category == 'teachers'}">selected</c:if>>Teachers</option>
            <option value="closefriends" <c:if test="${contact.category == 'closefriends'}">selected</c:if>>Close Friends</option>
            <option value="neighbours" <c:if test="${contact.category == 'neighbours'}">selected</c:if>>Neighbours</option>
            <option value="colleagues" <c:if test="${contact.category == 'colleagues'}">selected</c:if>>Colleagues</option>
            <option value="services" <c:if test="${contact.category == 'services'}">selected</c:if>>Services</option>
            <option value="schoolfriends" <c:if test="${contact.category == 'schoolfriends'}">selected</c:if>>School Friends</option>
            <option value="collegefriends" <c:if test="${contact.category == 'collegefriends'}">selected</c:if>>College Friends</option>
            <option value="work" <c:if test="${contact.category == 'work'}">selected</c:if>>Work</option>
        </select>

        <div class="checkbox-container">
            <input type="checkbox" id="isFavourite" name="favourite" value="true" <c:if test="${contact.favourite}">checked</c:if> />
            <label for="isFavourite" style="margin: 0;">Mark as Favourite</label>
        </div>

        <div class="form-actions">
            <button type="submit">Update Contact</button>
        </div>

        <div id="formMessage"></div>
    </form>
</div>

<script>
    function validateForm() {
        const name = document.getElementById('name').value.trim();
        const phone = document.getElementById('phone').value.trim();
        const email = document.getElementById('email').value.trim();
        const address = document.getElementById('address').value.trim();
        const category = document.getElementById('category').value;

        const messageDiv = document.getElementById('formMessage');
        messageDiv.textContent = '';
        messageDiv.className = '';

        if (name.length < 2) {
            messageDiv.textContent = 'Name must be at least 2 characters.';
            messageDiv.className = 'error';
            return false;
        }

        // Basic phone validation (digits, spaces, +, -, parentheses)
        const phonePattern = /^[0-9+\-\s()]{6,20}$/;
        if (!phonePattern.test(phone)) {
            messageDiv.textContent = 'Please enter a valid phone number.';
            messageDiv.className = 'error';
            return false;
        }

        // Email validation
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            messageDiv.textContent = 'Please enter a valid email address.';
            messageDiv.className = 'error';
            return false;
        }

        if (address.length < 3) {
            messageDiv.textContent = 'Address must be at least 3 characters.';
            messageDiv.className = 'error';
            return false;
        }

        if (category === '') {
            messageDiv.textContent = 'Please select a category.';
            messageDiv.className = 'error';
            return false;
        }

        return true;
    }
</script>

</body>
</html>
