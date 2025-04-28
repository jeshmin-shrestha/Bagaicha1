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
           <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user_product.css" />

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
   <section class="product-card">
                       <div class="search-container">
    <div class="search-wrapper">
        <input type="text" class="search-input" placeholder="Search plants...">
        <button class="search-btn">
            <i class="fas fa-search"></i>
        </button>
    </div>
    <button class="btn btn-outline">
        <i class="fas fa-sort"></i> Sort By
    </button>
</div>  
    <div class="name_product">
        <div>
            <h3>Rose</h3> 
            <span>Rosa</span> 
        </div>
        <img src="resources/images/system/rose1.jpg" alt="Rose">
    </div>
    <div class="plant-detail">
        <span>Watering requirement</span>
        <img src="resources/images/system/water_icon.png" alt="Water">
    </div>
    <div class="plant-detail">
        <span>Sunlight Requirement</span>
        <img src="resources/images/system/sun_icon.png" alt="Sun">
    </div>
    <div class="plant-detail">
        <span>Plant Category</span>
        <img src="resources/images/system/tree_icon.png" alt="Category">
    </div>
    <div class="plant-detail">
        <span>Soil Type</span>
        <img src="resources/images/system/soil_icon.png" alt="Soil">
    </div>
    <div class="plant-detail">
        <span>Blooming Season</span>
        <img src="resources/images/system/bloom_icon.png" alt="Flower">
    </div>
    <div class="plant-detail">
        <span>Fertilizer Requirement</span>
        <img src="resources/images/system/fertilizer_icon.png" alt="Fertilizer">
    </div>
    <div class="plant-detail">
        <span>Care Description</span>
        <img src="resources/images/system/care_icon.png" alt="Care">
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