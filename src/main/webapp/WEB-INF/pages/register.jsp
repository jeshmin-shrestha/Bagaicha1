<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bagaicha</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />


</head>
<body>
	<div class="left-panel" style="background-image: url('${pageContext.request.contextPath}/resources/images/system/background2.png');">

	 	<img
			src="${pageContext.request.contextPath}/resources/images/system/logo1.png"
			alt="Bagaicha Logo" class="logo1-img">
	
	
   </div>
	<div class="right-panel">
		<div class="auth-toggle">
			<button class="toggle-btn active" id="show-login">Login</button>
			<button class="toggle-btn" id="show-register">Register</button>
		</div>

		<!-- Login Form -->
		<form id="login-form" class="auth-form" action="LoginServlet"
			method="post">
			<div class="form-box">
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
            <input type="checkbox" id="terms" name="terms" required />
           
  <label style="text-align: center; color: #666; margin-bottom: 1.5rem;" >Stay signed in
   
  </label>
  </div>
  <br>
  
				<button type="submit" class="submit-btn">Login</button>
			</div>
		</form>

	<!-- Register Form -->
		<form id="register-form" class="auth-form" action="${pageContext.request.contextPath}/register/" method="post" enctype="multipart/form-data">
			<div class="form-box">
				<img src="${pageContext.request.contextPath}/resources/images/system/logo1.png" />
				<h2 class="form-title">Create your account</h2>

				<!-- Full Name Row -->
				<div class="form-row">
					<div class="form-group full-width">
						<label for="register-fullname">Full Name</label>
						<input type="text" id="register-fullname" name="fullName" required>
					</div>
				</div>

				<!-- Username and Email Row -->
				<div class="form-row">
					<div class="form-group half-width">
						<label for="register-username">Username</label>
						<input type="text" id="register-username" name="userName" required>
					</div>

					<div class="form-group half-width">
						<label for="register-email">Email</label>
						<input type="email" id="register-email" name="userEmail" required>
					</div>
				</div>

				<!-- Phone Number and Address Row -->
				<div class="form-row">
					<div class="form-group half-width">
						<label for="register-phone">Phone Number</label>
						<input type="tel" id="register-phone" name="userPhoneNo">
					</div>

					<div class="form-group half-width">
						<label for="register-address">Address</label>
						<input type="text" id="register-address" name="userAddress" required>
					</div>
				</div>

				<!-- Password and Confirm Password Row -->
				<div class="form-row">
					<div class="form-group half-width">
						<label for="register-password">Password</label>
						<input type="password" id="register-password" name="userPassword" required>
					</div>

					<div class="form-group half-width">
						<label for="register-confirm-password">Confirm Password</label>
						<input type="password" id="register-confirm-password" name="retypePassword" required>
					</div>
				</div>

				<!-- Image Upload Row -->
				<div class="form-row">
					<div class="form-group full-width">
						<label for="register-image">Profile Image</label>
						<input type="file" id="register-image" name="image" accept="image/*" required>
					</div>
				</div>
				<div class="termsandconditions">
					<input type="checkbox" id="terms" name="terms" required />
					<label style="text-align: center; color: #666; margin-bottom: 1.5rem;">
						I agree to the <a href="/terms-conditions">Terms and Conditions</a>
					</label>
				</div>
				<br>
				<button type="submit" class="submit-btn">Register</button>
			</div>
		</form>
		<footer class="copyright"> &copy; 2025 Bagaicha. All rights
			reserved. </footer>
	</div>

	<script>
		document
				.getElementById('show-login')
				.addEventListener(
						'click',
						function() {
							document.getElementById('login-form').style.display = 'block';
							document.getElementById('register-form').style.display = 'none';
							this.classList.add('active');
							document.getElementById('show-register').classList
									.remove('active');
						});

		document
				.getElementById('show-register')
				.addEventListener(
						'click',
						function() {
							document.getElementById('register-form').style.display = 'block';
							document.getElementById('login-form').style.display = 'none';
							this.classList.add('active');
							document.getElementById('show-login').classList
									.remove('active');
						});

		// Simple client-side validation
		document.getElementById('register-form').addEventListener(
				'submit',
				function(e) {
					const password = document
							.getElementById('register-password').value;
					const confirmPassword = document
							.getElementById('register-confirm-password').value;

					if (password !== confirmPassword) {
						e.preventDefault();
						alert('Passwords do not match!');
					}
				});
	</script>
</body>
</html>