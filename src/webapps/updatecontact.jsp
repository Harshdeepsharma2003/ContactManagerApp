<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Contact</title>
    <link rel="stylesheet" href="css/updatecontact.css">
</head>
<body>

<div class="update-contact-container">
    <h2>Update Contact</h2>

    <form action="UpdateContactServlet" method="get">
      <label for="contactid">Contact ID</label>
      <input type="text" name="contactId" id="contactid" required />

      <button type="submit">Fetch Contact</button>
    </form>


    <form id="updateContactForm" action="UpdateContactServlet" method="post" onsubmit="return validateForm();">
        <label for="contactId">Contact Id</label>
        <input type="text" name="contactId" value="${Contacts.contactId}" readonly />

        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="${Contacts.name}" required />

        <label for="phone">Phone</label>
        <input type="text" id="phone" name="phone" value="${Contacts.phone}" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${Contacts.email}" required />

        <label for="address">Address</label>
        <input type="text" id="address" name="address" value="${Contacts.address}" required />

        <label for="category">Category</label>
        <select id="category" name="category" required>
            <option value="">--Select Category--</option>
            <option value="teachers" <c:if test="${Contacts.category == 'teachers'}">selected</c:if>>Teachers</option>
            <option value="closefriends" <c:if test="${Contacts.category == 'closefriends'}">selected</c:if>>Close Friends</option>
            <option value="neighbours" <c:if test="${Contacts.category == 'neighbours'}">selected</c:if>>Neighbours</option>
            <option value="colleagues" <c:if test="${Contacts.category == 'colleagues'}">selected</c:if>>Colleagues</option>
            <option value="services" <c:if test="${Contacts.category == 'services'}">selected</c:if>>Services</option>
            <option value="schoolfriends" <c:if test="${Contacts.category == 'schoolfriends'}">selected</c:if>>School Friends</option>
            <option value="collegefriends" <c:if test="${Contacts.category == 'collegefriends'}">selected</c:if>>College Friends</option>
            <option value="work" <c:if test="${Contacts.category == 'work'}">selected</c:if>>Work</option>
        </select>

        <div class="checkbox-container">
            <input type="checkbox" id="isFavourite" name="favourite" value="true" <c:if test="${Contacts.isFavorite}">checked</c:if> />
            <label for="isFavourite" style="margin: 0;">Mark as Favourite</label>
        </div>

        <div class="form-actions">
            <button type="submit">Update Contact</button>
        </div>

        <div id="formMessage"></div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/JS/updatecontact.js"></script>

</body>
</html>
