<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile | Bagaicha</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/user_profile.css" />

</head>
<body>

	<div class="header-space"></div>

	<div class="container">
		<%
		if (request.getParameter("success") != null) {
		%>
		<div class="message success">Profile updated successfully!</div>
		<%
		}
		%>

		<%
		if (request.getParameter("error") != null) {
		%>
		<div class="message error">
			<%="update_failed".equals(request.getParameter("error")) ? "Failed to update profile. Please try again." : ""%>
		</div>
		<%
		}
		%>
		<div class="profile-card">
			<div class="profile-header">
				<img
					src="${pageContext.request.contextPath}/resources/images/system/user/${user.image}"
					alt="Profile Picture" class="profile-avatar"
					onerror="this.src='${pageContext.request.contextPath}/resources/images/system/newuser.png'">
				<h2>${user.fullName}</h2>
				<button class="edit-profile-btn" id="editProfileBtn">
					<i class="fas fa-pencil-alt"></i> Edit Profile
				</button>
			</div>

			<div class="profile-body">
				<!-- Change type="button" to type="submit" and add form action -->
				<form id="profileForm"
					action="${pageContext.request.contextPath}/userUpdate"
					method="post">
					<div class="form-grid">
						<div class="form-group">
							<input type="hidden" name="userId" value="${user.userId}" /> <label
								for="fullName">Full Name</label>
							<div class="input-field">
								<input type="text" id="fullName" name="fullName"
									value="${user.fullName}" readonly>

							</div>
						</div>

						<div class="form-group">
							<label for="email">Email</label>
							<div class="input-field">
								<input type="email" id="email" name="email"
									value="${user.userEmail}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="username">Username</label>
							<div class="input-field">
								<input type="text" id="username" name="username"
									value="${user.userName}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="address">Address</label>
							<div class="input-field">
								<input type="text" id="address" name="address"
									value="${user.userAddress}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label>Phone Number</label>
							<div class="phone-input">
								<img class="flag" src="https://flagcdn.com/w40/np.png"
									alt="Nepal Flag"> <input type="tel" id="phone"
									name="phone" value="${user.userPhoneNo}" readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="password">Password</label>
							<div class="input-field">
								<input type="password" id="password" value="*********" readonly>
							</div>
						</div>
					</div>

					<div class="action-buttons">
						<button type="submit" class="btn btn-save" id="saveBtn"
							style="display: none;">
							<i class="fas fa-save"></i> Save Changes
						</button>

						<button type="button" class="btn btn-cancel" id="cancelBtn">
							<i class="fas fa-times"></i> Cancel
						</button>
						<a href="${pageContext.request.contextPath}/passwordReset" class="btn btn-change-password">
    <i class="fas fa-key"></i> Change Password
</a>
						<button type="button" class="btn btn-logout">
							<i class="fas fa-sign-out-alt"></i> Log out
						</button>
					</div>
				</form>
			</div>


		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<script>
	// Replace the entire script section with this cleaned-up version:
	document.addEventListener('DOMContentLoaded', function() {
	    const editProfileBtn = document.getElementById('editProfileBtn');
	    const saveBtn = document.getElementById('saveBtn');
	    const cancelBtn = document.getElementById('cancelBtn');
	    const inputs = document.querySelectorAll('#profileForm input[type="text"], #profileForm input[type="email"], #profileForm input[type="tel"]');
	    const form = document.getElementById('profileForm');
	    
	    // Toggle edit mode
	    editProfileBtn.addEventListener('click', function() {
	        inputs.forEach(input => {
	            input.readOnly = !input.readOnly;
	            input.classList.toggle('editable');
	        });
	        
	        saveBtn.style.display = 'inline-flex';
	        cancelBtn.style.display = 'inline-flex';
	        editProfileBtn.style.display = 'none';
	        
	        if (inputs.length > 0) {
	            inputs[0].focus();
	        }
	    });
	    saveBtn.addEventListener('click', function(e) {
	        console.log("Save button clicked - preparing to submit form");
	        // Let the form submit normally
	    });
	    // Cancel edit mode
	    cancelBtn.addEventListener('click', function() {
	        inputs.forEach(input => {
	            input.readOnly = true;
	            input.classList.remove('editable');
	            // Reset to original values from server
	            input.value = input.defaultValue;
	        });
	        
	        saveBtn.style.display = 'none';
	        cancelBtn.style.display = 'none';
	        editProfileBtn.style.display = 'flex';
	    });
	    
	    // Form submission
	    form.addEventListener('submit', function(e) {
	        console.log("Form submitting...");
	        // Let it submit normally
	    });
	});
</script>
</body>
</html>