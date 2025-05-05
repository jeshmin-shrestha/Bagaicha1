<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/password_reset.css" />
</head>
<body>
    <div class="header-space"></div>

    <div class="container">
 



        <main class="reset-container">
            <a href="${pageContext.request.contextPath}/profile" class="back-btn">&#8592; </a>
            
            <section class="welcome-box">
                <h2>Hello ${sessionScope.userName}!</h2>
                <img src="${pageContext.request.contextPath}/resources/images/system/user/${user.image}" 
                     onerror="this.src='${pageContext.request.contextPath}/resources/images/system/user_icon.png'" 
                     class="user-icon">
            </section>
<%-- Error Messages --%>
        <c:if test="${not empty requestScope.error}">
            <div class="message error">
                <c:choose>
                    <c:when test="${requestScope.error eq 'empty_password'}">New password cannot be empty</c:when>
                    <c:when test="${requestScope.error eq 'short_password'}">Password must be at least 8 characters</c:when>
                    <c:when test="${requestScope.error eq 'password_mismatch'}">New passwords don't match</c:when>
                    <c:when test="${requestScope.error eq 'current_incorrect'}">Current password is incorrect</c:when>
                    <c:when test="${requestScope.error eq 'update_failed'}">Failed to update password</c:when>
                    <c:otherwise>An error occurred</c:otherwise>
                </c:choose>
            </div>
        </c:if>

        <%-- Success Message --%>
        <c:if test="${not empty requestScope.success}">
            <div class="message success">
                ${requestScope.success}
            </div>
        </c:if>

            <section class="reset-box">
            
                <h3>Reset Password</h3>
                <form id="passwordResetForm" action="${pageContext.request.contextPath}/passwordReset" method="post" >
                    <input type="hidden" name="userId" value="${user.userId}">
                    
                    <div class="form-group">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" id="oldPassword" name="oldPassword" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" name="newPassword" required minlength="8">
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required minlength="8">
                    </div>
                    
                    <button type="submit" class="btn-submit">Change Password</button>
                </form>
            </section>
        </main>
    </div>
<script>
document.getElementById('passwordResetForm').addEventListener('submit', function(e) {
    const newPass = document.getElementById('newPassword').value;
    const confirmPass = document.getElementById('confirmPassword').value;
    
    // Basic client-side validation
    if (newPass !== confirmPass) {
        e.preventDefault();
        alert("New passwords don't match!");
        return;
    }
    
    if (newPass.length < 8) {
        e.preventDefault();
        alert("Password must be at least 8 characters");
        return;
    }
    
    // If validation passes, form will submit
    console.log("Password reset form submitting...");
});
</script>

<%@ include file="footer.jsp" %>
    


</body>
</html>