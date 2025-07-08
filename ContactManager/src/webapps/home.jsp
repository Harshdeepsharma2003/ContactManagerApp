<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <title>Sign In</title>
   <link rel="stylesheet" href="CSS/home.css">
</head>
<body>
<div class="container">
    <h2>Contact Manager</h2>

    <!-- Add Contact Form -->
    <form action="AddContactServlet" method="post" autocomplete="off">
        <div class="form-row">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" required>
            <label for="phone">Phone</label>
            <input type="text" name="phone" id="phone" required>
        </div>
        <div class="form-row">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" required>
            <label for="address">Address</label>
            <input type="text" name="address" id="address" required>
        </div>
        <div class="form-row">
            <label for="category">Category</label>
            <select name="category" id="category" required>
                <option value="">--Select Category--</option>
                <option value="teachers">Teachers</option>
                <option value="closefriends">Close Friends</option>
                <option value="neighbours">Neighbours</option>
                <option value="colleagues">Colleagues</option>
                <option value="services">Services</option>
                <option value="schoolfriends">School Friends</option>
                <option value="collegefriends">College Friends</option>
                <option value="work">Work</option>
            </select>
        </div>
        <div class="form-actions">
            <button type="submit">Add Contact</button>
        </div>
    </form>

    <!-- Search Bar and Favourites Filter -->
    <div class="search-bar" style="gap:10px; display:flex; justify-content:flex-end; align-items:center;">
        <input type="text" id="searchInput" placeholder="Search contacts..." onkeyup="filterTable()">
        <label style="font-weight:normal; font-size:0.9rem;">
            <input type="checkbox" id="favouritesOnly" onchange="filterFavourites()"> Show Favourites Only
        </label>
    </div>

    <!-- Contacts Table -->
    <table id="contactsTable">
        <thead>
            <tr>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Category</th>
                <th>Favourite</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="contact" items="${contactList}">
                <tr data-favourite="${contact.favourite}">
                    <td>${contact.name}</td>
                    <td>${contact.phone}</td>
                    <td>${contact.email}</td>
                    <td>${contact.address}</td>
                    <td>${contact.category}</td>
                    <td style="text-align:center;">
                        <form action="ToggleFavouriteServlet" method="post" style="display:inline;">
                            <input type="hidden" name="contactId" value="${contact.contactId}">
                            <input type="checkbox" name="favourite" class="favourite-checkbox" onchange="this.form.submit()"
                                <c:if test="${contact.favourite}">checked</c:if> >
                        </form>
                    </td>
                    <td class="actions">
                        <a href="EditContactServlet?id=${contact.contactId}" class="edit">Update</a>
                        <a href="DeleteContactServlet?id=${contact.contactId}" class="delete" onclick="return confirm('Delete this contact?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty contactList}">
                <tr>
                    <td colspan="7" style="text-align:center; color:#888;">No contacts found.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>
<script src="${pageContext.request.contextPath}/JS/home.js"></script>

</body>
</html>
