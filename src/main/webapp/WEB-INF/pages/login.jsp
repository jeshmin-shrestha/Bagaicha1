<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Bagaicha</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
	<div class="left-panel"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/system/background2.png');">
		<img
			src="${pageContext.request.contextPath}/resources/images/system/logo1.png"
			alt="Bagaicha Logo" class="logo1-img">
	</div>

	<div class="right-panel">
		<!-- Login Form -->

		<form id="login-form" class="auth-form"
			action="${pageContext.request.contextPath}/login" method="post">

			<div class="form-box">
				<%
				String errorMessage = (String) request.getAttribute("error");
				String successMessage = (String) request.getAttribute("success");

				if (errorMessage != null && !errorMessage.isEmpty()) {
					out.println("<p class=\"error-message\">" + errorMessage + "</p>");
				}

				if (successMessage != null && !successMessage.isEmpty()) {
				%>
				<p class="success-message"><%=successMessage%></p>
				<%
				}
				%>
				<img
					src="${pageContext.request.contextPath}/resources/images/system/logo1.png"
					alt="Bagaicha Logo" class="logo-img">

				<h2 class="form-title">Welcome back</h2>

				<p style="text-align: center; color: #666; margin-bottom: 1.5rem;">You've
					been missed!</p>
				<br>

				<div class="form-group">
					<label for="login-username">Phone, email or username</label> <input
						type="text" id="login-username" name="username" required>
				</div>
				<div class="form-group">
					<label for="login-password">Password</label> <input type="password"
						id="login-password" name="password" required>
				</div>

				<div class="forgot-password">
					<a href="/forgot-password">Forgot Password?</a>
				</div>

				<br>

				<div class="termsandconditions">

					<input type="checkbox" id="terms" name="terms" /> <label
						style="text-align: center; color: #666; margin-bottom: 1.5rem;">Stay
						signed in </label>

				</div>

				<br>


				<button type="submit" class="submit-btn">Login</button>

				<div class="no-account">
					<p style="text-align: center; color: #666; margin-top: 1rem;">
						Don't have an account? <a
							href="${pageContext.request.contextPath}/register"
							style="color: #2e7d32;">Register here</a>
					</p>
				</div>
			</div>

		</form>



		<footer class="copyright"> &copy; 2025 Bagaicha. All rights
			reserved. </footer>
	</div>

	<script>
        // Client-side validation
document.getElementById('login-form').addEventListener('submit', function(e) {
                   function displayError(fieldId, message) {
            let errorElement = document.querySelector(`#${fieldId}-error`);
            if (!errorElement) {
                errorElement = document.createElement('span');
                errorElement.className = 'error';
                errorElement.id = `${fieldId}-error`;
                document.getElementById(fieldId).parentNode.appendChild(errorElement);
            }
            errorElement.textContent = message;
        }
    </script>
</body>
</html>