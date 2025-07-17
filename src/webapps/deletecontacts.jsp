<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Contact</title>
    <link rel="stylesheet" href="css/deletecontacts.css">
</head>
<body>

<section class="form-section">
    <div class="section-header">
        <h2>
            <i class="fas fa-user-minus"></i>
            Delete Contact
        </h2>
        <p class="section-description">Enter the Contact ID below to permanently remove a contact.</p>
    </div>
    <form id="deleteContactsForm"
          action="DeleteContactsServlet"
          method="post"
          autocomplete="off"
          onsubmit="return validateForm();">
        <div class="form-group">
            <label for="contactId">
                <i class="fas fa-id-badge"></i>
                Contact ID
            </label>
            <input type="number"
                   id="contactId"
                   name="contactId"
                   min="1"
                   required
                   placeholder="Enter Contact ID to delete" />
        </div>
        <div class="form-actions">
            <button type="submit" class="submit-btn danger">
                <i class="fas fa-user-minus"></i>
                Delete Contact
            </button>
        </div>
        <div id="message"></div>
    </form>
</section>


<script src="${pageContext.request.contextPath}/JS/deletecontacts.js"></script>

</body>
</html>
