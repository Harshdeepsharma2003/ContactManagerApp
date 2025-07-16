<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Manager - Professional Contact Management System</title>
  <link rel="stylesheet" href="css/landingpage.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<style>

.image-slider {
  overflow: hidden;
  background: #f0f0f0;
  padding: 20px 0;
}

.slider-track {
  display: flex;
  width: calc(300px * 8); /* Adjust based on number of slides */
  animation: scrollSlider 40s linear infinite;
}

.slide {
  flex: 0 0 auto;
  width: 300px;
  margin-right: 20px;
}

.slide img {
  width: 100%;
  height: auto;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

@keyframes scrollSlider {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}


</style>

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

        <div class="nav-menu">
          <a href="dashboard.jsp" class="nav-link">
            <i class="fas fa-home"></i>
            Dashboard
          </a>
          <a href="contacts.jsp" class="nav-link active">
            <i class="fas fa-users"></i>
            Contacts
          </a>
          <a href="favorites.jsp" class="nav-link">
            <i class="fas fa-heart"></i>
            Favorites
          </a>
          <a href="profile.jsp" class="nav-link">
            <i class="fas fa-user"></i>
            Profile
          </a>

           <a href="signin.jsp" class="action-btn info">
                                     <i class="fas fa-user"></i>
                                     Login
                                   </a>
                                   <a href="register.jsp" class="action-btn info">
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


      <!-- Quick Actions Bar -->
      <section class="quick-actions">
        <h1 class="page-title">
          <i class="fas fa-users"></i>
          Contact Management
        </h1>

      </section>

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




  <script>
    // Mobile menu toggle
    document.querySelector('.mobile-menu-toggle').addEventListener('click', function() {
      document.querySelector('.nav-menu').classList.toggle('active');
    });

    // Search functionality
    document.getElementById('searchInput').addEventListener('keyup', function() {
      const searchTerm = this.value.toLowerCase();
      const rows = document.querySelectorAll('#contactsTable tbody tr:not(.no-data)');

      rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(searchTerm) ? '' : 'none';
      });
    });

    // View toggle functionality
    document.querySelectorAll('.view-btn').forEach(btn => {
      btn.addEventListener('click', function() {
        document.querySelectorAll('.view-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
      });
    });
  </script>
</body>
</html>