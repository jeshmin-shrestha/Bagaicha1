<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
               <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/password_reset.css" />
    
</head>
<body>
<% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
<% } %>

<% if (session.getAttribute("success") != null) { %>
    <div class="alert alert-success">
        <%= session.getAttribute("success") %>
    </div>
    <% session.removeAttribute("success"); %>
<% } %>
<main class="reset-container">
    <a href="user_profile.jsp" class="back-btn">&#8592;</a>
    
    <section class="welcome-box">
        <h2>Hello ${user.fullName}!</h2> <!-- Dynamic user name -->
        <img src="${pageContext.request.contextPath}/resources/images/system/user/${user.image}" 
             onerror="this.src='${pageContext.request.contextPath}/resources/images/system/user_icon.png'" 
             class="user-icon">
    </section>

    <section class="reset-box">
        <h3>Reset Password</h3>
        <p>Enter the email address you used when you joined.</p>

<form action="${pageContext.request.contextPath}/passwordReset" method="post">

            <label for="username">Username</label>
                <input type="text" name="userName" required>
            
            <label for="currentPassword">Current Password</label>
    <input type="password" name="currentPassword" required>

            <label for="newPassword">New Password</label>
                <input type="password" name="newPassword" required>


            <button type="submit">Reset Password</button>
        </form>
    </section>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>