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
    <!-- Plant Details Section -->
        <section class="product-card">
            <div class="name_product">
                <div>
                    <h3>${plant.plantName}</h3> 
                    <span class="scientific-name">${plant.scientificName}</span> 
                </div>
                <img src="${pageContext.request.contextPath}${plant.imageUrl}" 
                     alt="${plant.plantName}" class="plant-image"
                     onerror="this.src='${pageContext.request.contextPath}/resources/images/system/default-plant.jpg'">
            </div>
            
            <div class="plant-details-container">
                <!-- Watering Requirement -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Watering Requirement</div>
                        <div class="detail-value">${plant.waterFrequency}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/water_icon.png" alt="Water" class="detail-icon">
                </div>
                
                <!-- Sunlight Requirement -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Sunlight Requirement</div>
                        <div class="detail-value">${plant.sunlightRequirement}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/sun_icon.png" alt="Sun" class="detail-icon">
                </div>
                
                <!-- Plant Category -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Plant Category</div>
                        <div class="detail-value">${plant.categoryId}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/tree_icon.png" alt="Category" class="detail-icon">
                </div>
                
                <!-- Soil Type -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Soil Type</div>
                        <div class="detail-value">${plant.soilType}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/soil_icon.png" alt="Soil" class="detail-icon">
                </div>
                
                <!-- Blooming Season -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Blooming Season</div>
                        <div class="detail-value">${plant.bloomingSeason}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/bloom_icon.png" alt="Flower" class="detail-icon">
                </div>
                
                <!-- Fertilizer Requirement -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Fertilizer Requirement</div>
                        <div class="detail-value">${plant.fertilizerRequirement}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/fertilizer_icon.png" alt="Fertilizer" class="detail-icon">
                </div>
                
                <!-- Care Description -->
                <div class="plant-detail">
                    <div class="detail-content">
                        <div class="detail-label">Care Instructions</div>
                        <div class="detail-value">${plant.careDescription}</div>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/system/care_icon.png" alt="Care" class="detail-icon">
                </div>
            </div>
            
            <div class="back-button">
                <button onclick="window.history.back()">
                    <i class="fas fa-arrow-left"></i> Back to Plants
                </button>
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