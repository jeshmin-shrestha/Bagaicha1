<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PlantCare Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
                   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_product_list.css" />
    
   
</head>
<body>
    <!-- Include header.jsp -->
    <jsp:include page="header.jsp" />
    
    <!-- Header Space -->
    <div class="header-space"></div>
    
    <!-- Welcome Section -->
    <div class="welcome-section container">
        <div class="welcome-content">
            <h1>Welcome Back, Plant Lover!</h1>
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
        <div class="search-container">
    <form class="search-wrapper" action="${pageContext.request.contextPath}/productList" method="get">
        <input type="text" class="search-input" name="search" placeholder="Search plants..." required>
        <button type="submit" class="search-btn">
            <i class="fas fa-search"></i>
            
        </button>
        
        
    </form>
    
</div>

      <!-- Plants Gallery Section -->
<section class="plants-section">
    <h2 class="section-title">Your Plant Collection</h2>
    <div class="plants-grid">
        <c:choose>
            <c:when test="${not empty plants}">
                <c:forEach items="${plants}" var="plant" varStatus="loop">
                    <div class="plant-card">
                        <img src="${pageContext.request.contextPath}${plant.imageUrl}" 
                             alt="${plant.plantName}" class="plant-image"
                             onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/resources/images/system/default-plant.jpg'">
                        <div class="plant-info">
                            <h3>${plant.plantName}</h3>
                            <p class="scientific-name">${plant.scientificName}</p>
                         <button class="see-more-btn" 
        onclick="location.href='${pageContext.request.contextPath}/productView?id=${plant.plantId}'">
    View Details
</button>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="no-plants-message">
                    <p>No plants found in your collection.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <c:if test="${param.showBrowseAll ne false}">
        <div class="browse-all">
            <a href="${pageContext.request.contextPath}/productList" class="browse-all-btn">Browse All Plants</a>
        </div>
    </c:if>
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