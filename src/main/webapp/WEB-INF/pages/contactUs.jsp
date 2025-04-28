<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | Bagaicha</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contactUs.css" />
   
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- Contact Header -->
    <section class="contact-header">

    </section>

    <!-- Main Content -->
    <div class="contact-container">
        <!-- Form Section -->
        <section class="form-section">
            <!-- Contact Form -->
            <div class="contact-card">
                <h3>🌿 Send Us a Message</h3>
                <form method="post" action="ContactServlet">
                    <div class="form-group">
                        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    </div>
                    <div class="form-group">
                        <input type="tel" name="phone" class="form-control" placeholder="Phone Number">
                    </div>
                    <div class="form-group">
                        <textarea name="message" class="form-control" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="submit-btn">Send Message</button>
                </form>
            </div>

            <!-- Newsletter Form -->
<div class="contact-card" >
    <h3 style="font-size: 1.7rem; margin-bottom: 10px;">🌿 Join Our Green Letter</h3>
    <p style="margin-bottom: 25px; color: #2c6e49; font-weight: 500;">
        One email. Once a month. Everything you need to grow better.
    </p>
     <form action="subscribe.jsp" method="post" class="subscribe-form">
                    <div class="input-wrapper">
                        <input type="email" name="email" placeholder="Your email address" required>
                        <button type="submit">Subscribe</button>
                    </div>
                </form>
    <p style="font-size: 0.8rem; margin-top: 15px; color: #333;">
        We hate spam. Unsubscribe anytime.
    </p>
</div>
    </section>

        <!-- Contact Info -->
        <section class="contact-info">
            <div class="info-item">
               <img src="resources/images/system/tel1.png" class="info-icon">
                <span>+977 9812345678</span>
            </div>
            <div class="info-item">
                <img src="resources/images/system/mailtur.png" class="info-icon">
                <span>Bagaicha@gmail.com</span>
            </div>
            <div class="info-item">
<img src="resources/images/system/locationpin.png" class="info-icon">                <span>Kathmandu, Nepal</span>
            </div>
        </section>

        <!-- Map Section -->
        <section class="map-container">
            <iframe src="https://maps.google.com/maps?q=kathmandu&t=&z=13&ie=UTF8&iwloc=&output=embed" ></iframe>
        </section>
    </div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>