<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Contact</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9fafb;
            margin: 0;
            padding: 0;
        }
        .delete-container {
            max-width: 400px;
            margin: 80px auto;
            background: #fff;
            padding: 30px 28px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #c62828;
            margin-bottom: 25px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px 14px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input[type="number"]:focus {
            border-color: #c62828;
            outline: none;
        }
        .form-actions {
            margin-top: 28px;
            text-align: center;
        }
        button {
            background-color: #c62828;
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
            background-color: #9b1c1c;
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

<div class="delete-container">
    <h2>Delete Contact</h2>
    <form id="deleteContactForm" action="DeleteContactServlet" method="post" onsubmit="return validateForm();">
        <label for="contactId">Contact ID</label>
        <input type="number" id="contactId" name="contactId" min="1" required placeholder="Enter Contact ID to delete" />

        <div class="form-actions">
            <button type="submit">Delete Contact</button>
        </div>
        <div id="message"></div>
    </form>
</div>

<script>
    function validateForm() {
        const contactIdInput = document.getElementById('contactId');
        const messageDiv = document.getElementById('message');
        messageDiv.textContent = '';
        messageDiv.className = '';

        const contactId = contactIdInput.value.trim();

        if (!contactId || isNaN(contactId) || Number(contactId) < 1) {
            messageDiv.textContent = 'Please enter a valid Contact ID (positive number).';
            messageDiv.className = 'error';
            return false;
        }
        return true;
    }
</script>

</body>
</html>
