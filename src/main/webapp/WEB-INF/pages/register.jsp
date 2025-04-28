<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Bagaicha</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />
</head>
<body>
    <div class="left-panel" style="background-image: url('${pageContext.request.contextPath}/resources/images/system/background2.png');">
        <img src="${pageContext.request.contextPath}/resources/images/system/logo1.png" alt="Bagaicha Logo" class="logo1-img">
    </div>
    
    <div class="right-panel">
        <!-- Register Form -->
        <form id="register-form" class="auth-form" action="${pageContext.request.contextPath}/register/" method="post" enctype="multipart/form-data">
            <div class="form-box">
                <%-- Error/Success Messages --%>
                <% String error = (String) request.getAttribute("error"); %>
                <% if (error != null) { %>
                    <div class="error-message" style="color: red; margin-bottom: 10px;">
                        <%= error %>
                    </div>
                <% } %>
                <% String success = (String) session.getAttribute("success"); %>
                <% if (success != null) { %>
                    <div class="success-message" style="color: green; margin-bottom: 10px;">
                        <%= success %>
                        <% session.removeAttribute("success"); %>
                    </div>
                <% } %>

                <img src="${pageContext.request.contextPath}/resources/images/system/logo1.png" alt="Bagaicha Logo" class="logo-img">
                <h2 class="form-title">Create your account</h2>

                <!-- Full Name -->
                <div class="form-row">
                    <div class="form-group full-width">
                        <label for="register-fullname">Full Name</label>
                        <input type="text" id="register-fullname" name="fullName" value="${param.fullName}" required>
                        <c:if test="${not empty errors.fullNameError}">
                            <span class="error">${errors.fullNameError}</span>
                        </c:if>
                    </div>
                </div>

                <!-- Username and Email -->
                <div class="form-row">
                    <div class="form-group half-width">
                        <label for="register-username">Username</label>
                        <input type="text" id="register-username" name="userName" value="${param.userName}" required>
                        <c:if test="${not empty errors.userNameError}">
                            <span class="error">${errors.userNameError}</span>
                        </c:if>
                    </div>

                    <div class="form-group half-width">
                        <label for="register-email">Email</label>
                        <input type="email" id="register-email" name="userEmail" value="${param.userEmail}" required>
                        <c:if test="${not empty errors.userEmailError}">
                            <span class="error">${errors.userEmailError}</span>
                        </c:if>
                    </div>
                </div>

                <!-- Phone and Address -->
                <div class="form-row">
                    <div class="form-group half-width">
                        <label for="register-phone">Phone Number</label>
                        <input type="tel" id="register-phone" name="userPhoneNo" value="${param.userPhoneNo}" required>
                        <span class="error" id="register-phone-error"></span>
    <c:if test="${not empty errors.userPhoneError}">
        <span class="error">${errors.userPhoneError}</span>
    </c:if>
                    </div>

                    <div class="form-group half-width">
                        <label for="register-address">Address</label>
                        <input type="text" id="register-address" name="userAddress" value="${param.userAddress}" required>
                        <c:if test="${not empty errors.userAddressError}">
                            <span class="error">${errors.userAddressError}</span>
                        </c:if>
                    </div>
                </div>

                <!-- Password -->
                <div class="form-row">
                    <div class="form-group half-width">
                        <label for="register-password">Password</label>
                        <input type="password" id="register-password" name="userPassword" required>
                        <c:if test="${not empty errors.userPasswordError}">
                            <span class="error">${errors.userPasswordError}</span>
                        </c:if>
                    </div>

                    <div class="form-group half-width">
                        <label for="register-confirm-password">Confirm Password</label>
                        <input type="password" id="register-confirm-password" name="retypePassword" required>
                        <c:if test="${not empty errors.retypePasswordError}">
                            <span class="error">${errors.retypePasswordError}</span>
                        </c:if>
                    </div>
                </div>

                <!-- Profile Image -->
                <div class="form-row">
                    <div class="form-group full-width">
                        <label for="register-image">Profile Image</label>
                        <input type="file" id="register-image" name="image" accept="image/*" required>
                        <c:if test="${not empty errors.imageError}">
                            <span class="error">${errors.imageError}</span>
                        </c:if>
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
                <p style="text-align: center; color: #666; margin-top: 1rem;">
                    Already have an account? <a href="${pageContext.request.contextPath}/login" style="color: #2e7d32;">Login here</a>
                </p>
            </div>
        </form>

        <footer class="copyright"> &copy; 2025 Bagaicha. All rights reserved. </footer>
    </div>

    <script>
        // Client-side validation
        document.getElementById('register-form').addEventListener('submit', function(e) {
            const password = document.getElementById('register-password').value;
            const confirmPassword = document.getElementById('register-confirm-password').value;
            const phone = document.getElementById('register-phone').value;
            let formValid = true;

            // Reset error highlights
            document.querySelectorAll('.error-highlight').forEach(el => {
                el.classList.remove('error-highlight');
            });

            // Password match validation
            if (password !== confirmPassword) {
                formValid = false;
                document.getElementById('register-confirm-password').classList.add('error-highlight');
                displayError('register-confirm-password', 'Passwords do not match!');
            }

            // Phone validation
            const phoneRegex = /^98\d{8}$/;
            if (!phone.match(phoneRegex)) {
                formValid = false;
                document.getElementById('register-phone').classList.add('error-highlight');
                displayError('register-phone', 'Phone must be 10 digits starting with 98');
            }

            if (!formValid) {
                e.preventDefault();
            }
        });

        
    </script>
</body>
</html>