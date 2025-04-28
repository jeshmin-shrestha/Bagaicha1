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
           <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_profile.css" />

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
				<form id="profileForm">
					<div class="form-grid">
						<div class="form-group">
							<label for="fullName">Full Name</label>
							<div class="input-field">
								<input type="text" id="fullName" value="${user.fullName}"
									readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="email">Email</label>
							<div class="input-field">
								<input type="email" id="email" value="${user.userEmail}"
									readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="username">Username</label>
							<div class="input-field">
								<input type="text" id="username" value="${user.userName}"
									readonly>
							</div>
						</div>

						<div class="form-group">
							<label for="address">Address</label>
							<div class="input-field">
								<input type="text" id="address" value="${user.userAddress}"
									readonly>
							</div>
						</div>

						<div class="form-group">
							<label>Phone Number</label>
							<div class="phone-input">
								<img class="flag" src="https://flagcdn.com/w40/np.png"
									alt="Nepal Flag"> <input type="tel" id="phone"
									value="${user.userPhoneNo}" readonly>
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
						<button type="button" class="btn btn-save" id="saveBtn">
							<i class="fas fa-save"></i> Save Changes
						</button>
						<button type="button" class="btn btn-cancel" id="cancelBtn">
							<i class="fas fa-times"></i> Cancel
						</button>
						<a href="${pageContext.request.contextPath}/change-password" class="btn btn-change-password">
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
    document.addEventListener('DOMContentLoaded', function() {
        const editProfileBtn = document.getElementById('editProfileBtn');
        const saveBtn = document.getElementById('saveBtn');
        const cancelBtn = document.getElementById('cancelBtn');
        const inputs = document.querySelectorAll('#profileForm input');
        
        // Toggle edit mode
        editProfileBtn.addEventListener('click', function() {
            // Toggle readonly attribute and editable class for all inputs
            inputs.forEach(input => {
                input.readOnly = !input.readOnly;
                input.classList.toggle('editable');
            });
            
            // Toggle button visibility
            saveBtn.style.display = 'inline-flex';
            cancelBtn.style.display = 'inline-flex';
            editProfileBtn.style.display = 'none';
            
            // Focus on the first input field
            if (inputs.length > 0) {
                inputs[0].focus();
            }
        });
        
        // Cancel edit mode
        cancelBtn.addEventListener('click', function() {
            // Reset all fields to readonly
            inputs.forEach(input => {
                input.readOnly = true;
                input.classList.remove('editable');
            });
            
            // Reset button visibility
            saveBtn.style.display = 'none';
            cancelBtn.style.display = 'none';
            editProfileBtn.style.display = 'flex';
        });
        
        // Save changes
        saveBtn.addEventListener('click', function() {
            // Here you would typically submit the form via AJAX or regular form submission
            alert('Profile changes saved successfully!');
            
            // After saving, return to view mode
            inputs.forEach(input => {
                input.readOnly = true;
                input.classList.remove('editable');
            });
            
            saveBtn.style.display = 'none';
            cancelBtn.style.display = 'none';
            editProfileBtn.style.display = 'flex';
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('changePasswordBtn').addEventListener('click', function() {
            window.location.href = '${pageContext.request.contextPath}/change-password';
        });
    });
</script>
</body>
</html>