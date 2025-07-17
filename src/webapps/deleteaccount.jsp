<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete User Profile</title>
   <link rel="stylesheet" href="css/deleteaccount.css">
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

                <div class="mobile-menu-toggle">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
        </nav>
    </header>

<!-- Delete User Profile Section -->
<section class="form-section">
    <div class="section-header">
        <h2>
            <i class="fas fa-user-slash"></i>
            Delete User Profile
        </h2>
        <p class="section-description">Please enter your User ID and password to delete your profile permanently.</p>
    </div>

    <form id="deleteUserForm"
          action="DeleteUserProfileServlet"
          method="post"
          autocomplete="off"
          class="contact-form"
          onsubmit="return validateForm();">
        <div class="form-grid">
            <div class="form-group">
                <label for="userId">
                    <i class="fas fa-id-card"></i>
                    User ID
                </label>
                <input type="text" id="userId" name="userId" placeholder="Enter your User ID" required />
            </div>
            <div class="form-group">
                <label for="password">
                    <i class="fas fa-lock"></i>
                    Password
                </label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
            </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="submit-btn danger">
                <i class="fas fa-user-slash"></i>
                Delete Profile
            </button>
        </div>
        <div id="message"></div>
    </form>
</section>

<script src="${pageContext.request.contextPath}/js/deleteaccount.js"></script>
</body>
</html>
