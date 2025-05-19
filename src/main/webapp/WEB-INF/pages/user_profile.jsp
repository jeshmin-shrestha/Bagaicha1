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
<%-- General or specific error message --%>
<% 
    String errorParam = request.getParameter("error");
    if (errorParam != null) {
        String errorMsg = "";
        switch (errorParam) {
            case "invalid_fullname":
                errorMsg = "Full name must be at least 3 characters.";
                break;
            case "invalid_email":
                errorMsg = "Invalid email format.";
                break;
            case "invalid_address":
                errorMsg = "Address must not be empty.";
                break;
            case "invalid_phone":
                errorMsg = "Phone number must be between 10 digits and starts with 98.";
                break;
            case "update_failed":
                errorMsg = "Failed to update profile. Please try again.";
                break;
            default:
                errorMsg = "Unknown error occurred.";
        }
%>
    <div class="message error"><%= errorMsg %></div>
<%
    }
%>
		
		<div class="profile-card">
			<div class="profile-header">
				<img
					src="${pageContext.request.contextPath}/resources/images/system/user/${user.image}"
					alt="Profile Picture" class="profile-avatar">
					

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
						<a href="${pageContext.request.contextPath}/logout"
   class="btn btn-logout"
   onclick="return confirm('Do you really want to logout?');">
    <i class="fas fa-sign-out-alt"></i> Log out
</a>

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
	        let isValid = true;
	        messageContainer.textContent = ""; // reset message

	        // Basic validations
	        const fullName = document.getElementById('fullName').value.trim();
	        const email = document.getElementById('email').value.trim();
	        const address = document.getElementById('address').value.trim();
	        const phone = document.getElementById('phone').value.trim();

	        const phoneRegex = /^[0-9]{7,15}$/;
	        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

	        if (fullName === "") {
	            isValid = false;
	            messageContainer.textContent = "Full name cannot be empty.";
	        } else if (!emailRegex.test(email)) {
	            isValid = false;
	            messageContainer.textContent = "Please enter a valid email address.";
	        } else if (address === "") {
	            isValid = false;
	            messageContainer.textContent = "Address cannot be empty.";
	        } else if (!phoneRegex.test(phone)) {
	            isValid = false;
	            messageContainer.textContent = "Enter a valid phone number (10 digits).";
	        }

	        if (!isValid) {
	            e.preventDefault(); // prevent form submission
	            messageContainer.style.display = 'block';
	            window.scrollTo({ top: 0, behavior: 'smooth' });
	        }
	    });
	});
</script>
</body>
</html>