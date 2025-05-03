<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
           <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    
</head>
<body>
    <footer class="footer">
    
        <div class="footer-container">
            <div class="footer-logo">
                <img src="resources/images/system/logo1.png" alt="Bagaicha Logo">
                
            </div>

            <div class="footer-nav">
                <h3 class="footer-section-title">Navigation</h3>
                <ul>
                    <li>  <a href="/Bagaicha/home">Home</a></li>
                    <li>
<c:choose>
    <c:when test="${role == 'admin'}">
        <a href="${pageContext.request.contextPath}/adminProduct">Plant</a>
    </c:when>
    <c:when test="${role == 'user'}">
        <a href="${pageContext.request.contextPath}/productList">Plant</a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/home">Plant</a>
    </c:otherwise>
    </c:choose></li>
                   
                    <li><a href="/Bagaicha/about">About Us</a></li>
                    <li><a href="/Bagaicha/contact">Contact Us</a></li>
                    <li><a href="/Bagaicha/profile">Profile</a></li>
                </ul>
            </div>

            <div class="footer-contact">
                <h3 class="footer-section-title">Contact Us</h3>
                <p><i>📞</i> +977 9812345678</p>
                <p><i>✉️</i> info@bagaicha.com</p>
                <p><i>🏠</i> Kathmandu, Nepal</p>
                
                <div class="social-icons">
                    <a href="mailto:shresthajeshmin30@gmail.com" aria-label="Email"><img src="resources/images/system/maill_.png" alt="Email"></a>
                    <a href="https://www.facebook.com/profile.php?id=61558683090680" aria-label="Facebook"><img src="resources/images/system/faceboook.png" alt="Facebook"></a>
                    <a href="https://www.linkedin.com/in/jeshmin-shrestha/" aria-label="Linkedin"><img src="resources/images/system/linkedin_icon.png" alt="Linkedin"></a>
                    <a href="https://www.youtube.com/@jeshminshrestha2371" aria-label="YouTube"><img src="resources/images/system/yttt.png" alt="YouTube"></a>
                </div>
            </div>

   <div class="footer-subscribe">
    <h3 class="footer-section-title">Join Our Newsletter</h3>
    <p>Subscribe for updates and promotions</p>
    <form id="subscribeForm" class="subscribe-form">
        <div class="input-wrapper">
            <input type="email" id="emailInput" name="email" placeholder="jeshmin@gmail.com" required>
            <button type="submit">Subscribe</button>
        </div>
    </form>
</div>

<script>
document.getElementById('subscribeForm').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent form submission
    
    const email = document.getElementById('emailInput').value;
    
    // Basic email validation
    if (!email.includes('@') || !email.includes('.')) {
        alert('Please enter a valid email address');
        return;
    }
    
    // Check if it's a Gmail address (optional)
    if (email.endsWith('@gmail.com') || email.endsWith('@googlemail.com')) {
        alert('Thank you for subscribing with your Gmail!');
    } else {
        alert('Thank you for subscribing!');
    }
    
    // Clear the form
    document.getElementById('emailInput').value = '';
});
</script>


        <div class="footer-bottom">
            <p>&copy; 2023 Bagaicha. All rights reserved. | <a href="#" style="color: rgba(255, 255, 255, 0.7);">Privacy Policy</a> | <a href="#" style="color: rgba(255, 255, 255, 0.7);">Terms of Service</a></p>
        </div>
    </footer>
    

</body>

</html>