<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PlantCare Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
                  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_homepage.css" />
   
</head>
<body>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("user")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

    <!-- Include header.jsp -->
    <jsp:include page="header.jsp" />
    
    <!-- Header Space -->
    <div class="header-space"></div>
    
    <!-- Welcome Section -->
    <div class="welcome-section container">
        <div class="welcome-content">
<h1>Welcome Back, ${sessionScope.userName}!</h1>
            <p>Let's make your plants thrive!</p>
        </div>
        <img src="resources/images/system/robot_icon.png" alt="Plant Care Assistant" class="bot-icon">
    </div>
    
    <!-- Main Content Container -->
    <div class="container">
        <!-- Reminders Section -->
        <section class="reminders-section">
            <h2 class="section-title">Today's Reminders</h2>
            <div class="reminders-grid">
                <!-- Light Reminder -->
                <div class="reminder-card">
                    <div class="reminder-icon">
                        <img src="resources/images/system/newplant.png" alt="Sun Icon">
                    </div>
                    <div class="reminder-content">
                        <h3>Light Check</h3>
                        <p>Don't forget to move your Plant into the light today!</p>
                    </div>
                </div>
                
                <!-- Nutrition Reminder -->
                <div class="reminder-card">
                    <div class="reminder-icon">
                        <img src="resources/images/system/cart_icon.png" alt="Nutrition Icon">
                    </div>
                    <div class="reminder-content">
                        <h3>Weekly Feeding</h3>
                        <p>Add nutrients to support healthy growth this week.</p>
                    </div>
                </div>
                
                <!-- Water Reminder -->
                <div class="reminder-card">
                    <div class="reminder-icon">
                        <img src="resources/images/system/total_icon.png" alt="Water Icon">
                    </div>
                    <div class="reminder-content">
                        <h3>Watering Time</h3>
                        <p>Check soil moisture and water your thirsty plants.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Plants Gallery Section -->
        <section class="plants-section">
            <h2 class="section-title">Your Plant Collection</h2>
            <div class="plants-grid">
                <!-- Plant Card 1 -->
                <div class="plant-card">
                    <img src="resources/images/system/rose1.jpg" alt="Snake Plant" class="plant-image">
                    <div class="plant-info">
                        <h3>Rose </h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div>
                
                <!-- Plant Card 2 -->
                <div class="plant-card">
                    <img src="resources/images/system/lily1.jpg" alt="Peace Lily" class="plant-image">
                    <div class="plant-info">
                        <h3>Peace Lily</h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div>
                
                <!-- Plant Card 3 -->
                <div class="plant-card">
                    <img src="resources/images/system/marigold1.jpg" alt="Monstera" class="plant-image">
                    <div class="plant-info">
                        <h3>Marigold</h3>
                        <div class="plant-meta">
                            
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div>
                
                <!-- Plant Card 4 -->
                <div class="plant-card">
                    <img src="resources/images/system/aloevera1.jpg" alt="Pothos" class="plant-image">
                    <div class="plant-info">
                        <h3>Aloe Vera</h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div>
            </div>
            
            <div class="browse-all">
               <a href="userProduct"
 class="browse-all-btn">Browse All Plants</a>
            </div>
        </section>
        
        <!-- CTA Section -->
        <section class="cta-section">
            <h2 class="section-title">Explore More</h2>
            <div class="cta-cards">
                <!-- Learn More Card -->
                <div class="cta-card">
                    <div class="cta-icon">
                        <img src="resources/images/system/brain_icon.png" alt="Info Icon">
                    </div>
                    <div class="cta-content">
                        <h3>Learn More  About Us?</h3>
                        
                        <a href="about.jsp" class="see-more-btn">Learn More</a>
                    </div>
                </div>
                
                <!-- Newsletter Card -->
                <div class="cta-card">
                    <div class="cta-icon">
                        <img src="resources/images/system/mailsub.png" alt="Newsletter Icon">
                    </div>
                    <div class="cta-content">
                        <h3>Leave us a feedback</h3>
                        
                        <a href="subscribe.jsp" class="see-more-btn">Send us feedback</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>