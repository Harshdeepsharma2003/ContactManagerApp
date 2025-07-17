<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Profile</title>
   <link rel="stylesheet" href="css/updateprofile.css">
</head>
<body>

<div class="update-profile-container">
    <h2>Update Profile</h2>

    <form action="UpdateProfileServlet" method="get">
          <label for="userId">User ID</label>
          <input type="text" name="userId" id="userid" required />

          <button type="submit">Fetch Profile</button>
        </form>


    <form id="updateProfileForm" action="UpdateProfileServlet" method="post" autocomplete="off" onsubmit="return validateForm();">

         <label for="userId">User Id</label>
         <input type="text" id="userid" name="userId" value="${User.userId}" readonly />


        <label for="username">Username</label>
        <input type="text" id="username" name="username" value="${User.userName}" required />


        <label for="password">New Password</label>
        <input type="password" id="password" name="password" placeholder="new password"/>


         <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${User.email}" required />


        <div class="form-actions">
            <button type="submit">Update Profile</button>
        </div>
        <div id="formMessage"></div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/JS/updateprofile.js"></script>

</body>
</html>
