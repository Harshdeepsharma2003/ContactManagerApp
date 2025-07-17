<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contact Manager - Professional Contact Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="css/showcontacts.css">

</head>
<body>
    <!-- Header with Professional Navbar -->
    <header class="header">
        <nav class="navbar">
            <div class="nav-container">
                <div class="nav-brand">
                    <i class="fas fa-address-book"></i>
                    <span>ContactManager</span>
                </div>

                             <div class="action-buttons">
                                 <a href="updatecontact.jsp" class="action-btn primary">
                                     <i class="fas fa-edit"></i>
                                     Update Contact
                                 </a>
                                 <a href="deletecontacts.jsp" class="action-btn warning">
                                     <i class="fas fa-trash"></i>
                                     Delete Contact
                                 </a>
                                 <a href="updateprofile.jsp" class="action-btn info">
                                     <i class="fas fa-user-edit"></i>
                                     Update Profile
                                 </a>
                                 <a href="deleteaccount.jsp" class="action-btn danger">
                                     <i class="fas fa-user-times"></i>
                                     Delete Profile
                                 </a>
                             </div>

                <div class="mobile-menu-toggle">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
        </nav>
    </header>

            <!-- Quick Actions Bar -->
            <section class="quick-actions">

            <div class="nav-menu">
                                <a href="landingpage.jsp" class="nav-link">
                                    <i class="fas fa-home"></i>
                                    Home
                                </a>
                                <a href="contacts.jsp" class="nav-link active">
                                    <i class="fas fa-users"></i>
                                    Contacts
                                </a>

                           <div class="nav-actions">
                               <%
                                   String userId = (String) session.getAttribute("userid");
                                   if (userId != null) {
                               %>
                                   <div class="user-info">
                                       <i class="fas fa-user-circle"></i>
                                       Welcome, User Id <strong><%= userId %></strong>
                                   </div>
                               <%
                                   }
                               %>

                               <form action="LogoutServlet" method="get" class="logout-form">
                                   <button type="submit" class="logout-btn">
                                       <i class="fas fa-sign-out-alt"></i>
                                       Logout
                                   </button>
                               </form>
                           </div>

            </section>


            <!-- Contacts Table -->
            <section class="table-section">
                <div class="section-header">
                    <h2>
                        <i class="fas fa-list"></i>
                        Your Contacts
                    </h2>
                    <div class="table-controls">
                        <div class="search-box">
                            <i class="fas fa-search"></i>
                            <input type="text" placeholder="Search contacts..." id="searchInput">
                        </div>

                    </div>
                </div>

                <div class="table-container">
                    <table id="contactsTable">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user"></i> Name</th>
                                <th><i class="fas fa-phone"></i> Phone</th>
                                <th><i class="fas fa-envelope"></i> Email</th>
                                <th><i class="fas fa-map-marker-alt"></i> Address</th>
                                <th><i class="fas fa-tags"></i> Category</th>
                                <th><i class="fas fa-star"></i> Favorite</th>
                                <th><i class="fas fa-cogs"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dynamic content from JSP -->
                            <c:forEach var="contact" items="${contactList}">
                                <tr>
                                    <td>
                                        <div class="contact-name name-cell">
                                            <div class="avatar">
                                                <i class="fas fa-user"></i>
                                            </div>
                                            ${contact.name}
                                        </div>
                                    </td>
                                    <td>
                                        <a href="tel:${contact.phone}" class="phone-link">
                                            ${contact.phone}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="mailto:${contact.email}" class="email-link">
                                            ${contact.email}
                                        </a>
                                    </td>
                                    <td>${contact.address}</td>
                                    <td>
                                        <span class="category-badge ${contact.category}">
                                            ${contact.category}
                                        </span>
                                    </td>
                                    <td class="favorite-cell">
                                        <form action="AddContactServlet" method="post" class="favorite-form">
                                            <input type="hidden" name="contactId" value="${contact.contactId}" />
                                            <input type="checkbox" name="favorite" class="favorite-checkbox" onchange="this.form.submit()"
                                                <c:if test="${contact.isFavorite}">checked</c:if> />
                                            <label class="star-label">
                                                <i class="fas fa-star"></i>
                                            </label>
                                        </form>
                                    </td>
                                    <td class="actions">
                                        <a href="updatecontact.jsp" class="action-link edit" title="Edit Contact">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="deletecontacts.jsp" class="action-link delete" title="Delete Contact"
                                           onclick="return confirm('Are you sure you want to delete this contact?');">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty contactList}">
                                <tr class="no-data">
                                    <td colspan="7">
                                        <div class="no-contacts">
                                            <i class="fas fa-user-friends"></i>
                                            <h3>No contacts found</h3>
                                            <p>Start by adding your first contact using the form above.</p>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </section>

        </div>
    </main>
     <script src="js/showcontacts.js"></script>
     </body>
     </html>