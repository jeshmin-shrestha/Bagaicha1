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
    <style>
        :root {
            --primary-color: #2c6e49;
            --secondary-color: #4c956c;
            --accent-color: #fefee3;
            --light-bg: #f9f9f9;
            --card-bg: #ffffff;
            --text-dark: #333333;
            --text-medium: #555555;
            --text-light: #777777;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
    
body {
    background: #B3B3B3; /* Change this line */
    line-height: 1.6;
}
        
        
        /* Header Area */
        .header-space {
            height: 80px; /* Matches header height */
        }
        
        /* Welcome Section */
        .welcome-section {
            background:#C3CDB2;
            color: #2E7D32;
            border-radius: 20px;
            padding: 40px;
            margin: 30px auto;
            max-width: 1200px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(44, 110, 73, 0.2);
        }
        
        .welcome-content {
            max-width: 60%;
            height:200px;
            z-index: 2;
            position: relative;
            padding:40px;
        }
        
        .welcome-section h1 {
            font-size: 2.5rem;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        .welcome-section p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 20px;
            color:#808080
        }
        
        .bot-icon {
            position: absolute;
            top: 15px;
            right: 60px;
            width: 200px;
            height: 200px;
            animation: wave 3s ease-in-out infinite;
        }

        /* Waving animation */
        @keyframes wave {
            0% { transform: translateX(0) rotate(0deg); }
            25% { transform: translateX(10px) rotate(5deg); }
            50% { transform: translateX(0) rotate(0deg); }
            75% { transform: translateX(-10px) rotate(-5deg); }
            100% { transform: translateX(0) rotate(0deg); }
        }
        
        /* Main Content Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Reminders Section */
        .reminders-section {
            margin: 40px 0;
        }
        
        .section-title {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-bottom: 25px;
            position: relative;
            padding-left: 15px;
        }
        
        .section-title::before {
            
            position: absolute;
            left: 0;
            top: 5px;
            height: 80%;
            width: 5px;
            
            border-radius: 5px;
        }
        
        .reminders-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }
        
        .reminder-card {
            background-color: #C3CDB2;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height:200px;
            display: flex;
            align-items: center;
        }
        
        .reminder-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        
        /* Modified Reminder Icon Styles */
        .reminder-icon {
            width: 80px; /* Increased from 60px */
            height: 80px; /* Increased from 60px */
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            flex-shrink: 0;
            background-color: transparent; /* Removed the background */
            border-radius: 0; /* Removed rounded corners */
        }
        
        .reminder-icon img {
            width: 190px; /* Increased from 30px */
            height: 190px; /* Increased from 30px */
            object-fit: contain;
        }
        
        .reminder-content h3 {
            color: #2E7D32;
            font-size: 1.3rem;
            margin-bottom: 8px;
            padding-left:10px;
        }
        
        .reminder-content p {
            color: #808080;
            font-size: 0.95rem;
              padding-left:10px;
        }
/* Search Container Styles */
.search-container {
    display: flex;
    gap: 15px;
    margin-bottom: 30px;
    align-items: center;
}

.search-wrapper {
    flex-grow: 1;
    position: relative;
    display: flex;
}

.search-input {
    background-color: white;
    border: 2px solid var(--primary-color);
    padding: 12px 50px 12px 20px;
    border-radius: 30px;
    width: 100%;
    font-size: 1rem;
    color: var(--text-dark);
    box-shadow: var(--shadow-sm);
    transition: all 0.3s ease;
}

.search-input:focus {
    outline: none;
    border-color: var(--secondary-color);
    box-shadow: 0 0 0 3px rgba(76, 149, 108, 0.2);
}

.search-btn {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    background: transparent;
    border: none;
    color: var(--primary-color);
    cursor: pointer;
    font-size: 1.1rem;
    padding: 8px;
}

.btn-outline {
    background-color: white;
    border: 2px solid var(--primary-color);
    color: var(--primary-color);
    padding: 12px 20px;
    border-radius: 30px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    white-space: nowrap;
}

.btn-outline:hover {
    background-color: var(--primary-color);
    color: white;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .search-container {
        flex-direction: column;
        align-items: stretch;
    }
    
    .btn-outline {
        width: 100%;
    }
}

        
        /* Plants Gallery */
        .plants-section {
            margin: 50px 0;
        }
        
        .plants-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }
        
        .plant-card {
            background-color: #C3CDB2;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        .plant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .plant-image {
            width: 100%;
            height: 230px;
            object-fit: cover;
            padding:10px;
            border-radius: 20px;
        }
        
        .plant-info {
            padding: 20px;
        }
        
        .plant-info h3 {
            color: var(--primary-color);
            font-size: 1.2rem;
            margin-bottom: 10px;
        }
        
        .plant-meta {
            display: flex;
            justify-content: space-between;
            color: var(--text-medium);
            font-size: 0.9rem;
            margin-bottom: 15px;
        }
        
        .see-more-btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 8px 20px;
            border-radius: 30px;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            width: 100%;
            text-align: center;
        }
        
        .see-more-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .browse-all {
            text-align: center;
            margin-top: 30px;
        }
        
        .browse-all-btn {
            display: inline-block;
            background-color: transparent;
            color: var(--primary-color);
            padding: 10px 30px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 500;
            border: 2px solid var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .browse-all-btn:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        /* CTA Section */
        .cta-section {
            margin: 50px 0;
            
        }
        
        .cta-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-top: 20px;
        }
        
        
        .cta-card {
            background-color: #C3CDB2;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            display: flex;
            flex-direction:  row;
            align-items: center; /* Ensures vertical centering */
    justify-content: space-between; /* Space between the text and image */
            
        }
        
        .cta-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .cta-icon {
            width: 100px;
            height: 100px;
            order: 1;
            
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }
        
        .cta-icon img {
            width: 150px;
            height: 150px;
        
        }
        
        .cta-content h3 {
            color: var(--primary-color);
            font-size: 1.4rem;
            margin-bottom: 15px;
        }
        
        .cta-content p {
            color: var(--text-medium);
            margin-bottom: 20px;
        }
        
        /* Values Section */
        .values-section {
            margin: 50px 0;
        }
        
        .values-list {
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .values-list ul {
            list-style-type: none;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .values-list li {
            display: flex;
            align-items: center;
            padding: 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        
        .values-list li:hover {
            background-color: rgba(44, 110, 73, 0.05);
        }
        
        .values-list li::before {
            content: '🌿';
            margin-right: 15px;
            font-size: 1.2rem;
        }
        
        .values-list strong {
            color: var(--primary-color);
            font-weight: 500;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .welcome-section {
                padding: 30px;
            }
            
            .welcome-content {
                max-width: 100%;
            }
            
          
    .bot-icon {
        display: block; /* Ensure it is visible */
        top: 15px; /* Keep it aligned at the top */
        right: 10px; /* Adjust the position slightly for smaller screens */
        width: 150px; /* Keep it visible but reduce size for mobile */
        height: 150px; /* Same as width to maintain aspect ratio */
        animation: wave 3s ease-in-out infinite; /* Keep the animation */
    }


            
            .reminders-grid, .cta-cards {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .welcome-section h1 {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 1.5rem;
            }
            
            .plant-card {
                max-width: 100%;
            }
            
            .reminder-icon {
                width: 60px;
                height: 60px;
            }
            
            .reminder-icon img {
                width: 50px;
                height: 50px;
            }
        }
    </style>
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
                 <!-- Plant Card 5 -->
                <div class="plant-card">
                    <img src="resources/images/system/aloevera1.jpg" alt="Pothos" class="plant-image">
                    <div class="plant-info">
                        <h3>Aloe Vera</h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div> <!-- Plant Card 6 -->
                <div class="plant-card">
                    <img src="resources/images/system/aloevera1.jpg" alt="Pothos" class="plant-image">
                    <div class="plant-info">
                        <h3>Aloe Vera</h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div> <!-- Plant Card 7 -->
                <div class="plant-card">
                    <img src="resources/images/system/aloevera1.jpg" alt="Pothos" class="plant-image">
                    <div class="plant-info">
                        <h3>Aloe Vera</h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div> <!-- Plant Card 8 -->
                <div class="plant-card">
                    <img src="resources/images/system/aloevera1.jpg" alt="Pothos" class="plant-image">
                    <div class="plant-info">
                        <h3>Aloe Vera</h3>
                        <div class="plant-meta">
                           
                        </div>
                        <button class="see-more-btn">View Details</button>
                    </div>
                </div> <!-- Plant Card 9 -->
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