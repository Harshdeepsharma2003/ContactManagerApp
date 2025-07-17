<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Manager - Professional Contact Management System</title>
  <link rel="stylesheet" href="css/landingpage.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

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


          <a href="login.jsp" class="nav-link active">
            <i class="fas fa-users"></i>
            Contacts
          </a>

          <a href="login.jsp" class="nav-link">
            <i class="fas fa-user"></i>
            Profile
          </a>

           <a href="signin.jsp" class="action-btn info">
                                     <i class="fas fa-user"></i>
                                     Login
                                   </a>
                                   <a href="register.jsp" class="action-btn custom">
                                     <i class="fas fa-user"></i>
                                     Register
                                   </a>
                 </a>
               </div>
  </div>

        </div>

        <!-- Mobile menu toggle -->
        <div class="mobile-menu-toggle">
          <i class="fas fa-bars"></i>
        </div>
      </div>
    </nav>
  </header>
<br>
    </div>
  </main>

<!-- Continuous Image Slider -->
<section class="image-slider">
  <div class="slider-track">
    <div class="slide"><img src="images/contact1.png" ></div>
    <div class="slide"><img src="images/contact2.png" ></div>
     <!-- Repeat slides for seamless loop -->
    <div class="slide"><img src="images/contact1.png" ></div>
    <div class="slide"><img src="images/contact2.png"></div>
     </div>
</section>
<br>
<br>
<!-- Professional Footer -->
<footer class="footer">
  <div class="footer-content">
    <!-- Branding Section -->
    <div class="footer-section">
      <div class="footer-brand">
        <i class="fas fa-address-book"></i>
        <span>ContactManager</span>
      </div>
      <p class="footer-description">
        Your trusted contact management solution for organizing and managing all your personal and professional contacts efficiently.
      </p>

  <!-- Bottom Row -->
  <div class="footer-bottom">
    <div class="footer-bottom-content">
      <p>&copy; 2025 ContactManager. All rights reserved.</p>
      <p>Made with <i class="fas fa-heart"></i> for better contact management</p>
    </div>
  </div>
</footer>
   <script src="js/landingpage.js"></script>
</body>
</html>
