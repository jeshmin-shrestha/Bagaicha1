<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
            --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #F8F9FA;
            color: var(--dark);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
          
        }

        /* Header Space */
        .header-space {
            height: 50px;
        }

        /* Welcome Section */
       .welcome-section {
            background:#C3CDB2;
            color: #2E7D32;
            border-radius: 20px;
            padding: 30px;
            margin: 30px auto;
            max-width: 1200px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(44, 110, 73, 0.2);
        }
        
        .welcome-content {
            max-width: 60%;
            height:150px;
            z-index: 2;
            position: relative;
            padding:10px;
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
        
       
/* Dashboard Stats */
        .stats-section {
            margin: 40px 0;
            
        }

        .section-title {
            font-size: 1.8rem;
            color:#4c956c;
            margin-bottom: 25px;
            font-weight: 600;
           
            padding-left: 15px;
        }

        .section-title::before {
           
            position: absolute;
            left: 0;
            top: 5px;
            height: 80%;
            width: 4px;
            background: var(--primary);
            border-radius: 4px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .stat-card {
         background-color:#C3CDB2;
            border-radius: 12px;
            padding: 25px;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-top: 4px solid var(--primary);
            display: flex;
            align-items: center;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .stat-icon {
            width: 120px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            
            
        }

        .stat-icon img {
            width: 120px;
            height: 120px;
            object-fit: contain;
        }

        .stat-content h3 {
            color: var(--gray);
            font-size: 1rem;
            margin-bottom: 5px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .stat-content .value {
            color: var(--primary-dark);
            font-size: 1.8rem;
            font-weight: 600;
        }

        /* Recent Activity Section */
        .recent-section {
            margin-bottom: 40px;
        }

        .recent-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
            gap: 25px;
        }

        .recent-card {
            background-color: #C3CDB2;
            border-radius: 12px;
            padding: 25px;
            box-shadow: var(--card-shadow);
        }

        .recent-card h3 {
            color: black;
            font-size: 1.3rem;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .recent-list {
            list-style: none;
        }

        .recent-item {
            padding: 12px 0;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
        }

        .recent-item:last-child {
            border-bottom: none;
        }

        .recent-item img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }

        .recent-item-info h4 {
            font-size: 0.95rem;
            font-weight: 500;
            margin-bottom: 3px;
            color:black;
        }

      

        /* Action Button */
        .action-btn {
    display: inline-block;
    background-color: #4c956c;
    color: white;
    padding: 12px 30px;
    border-radius: 30px;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
    border: 2px solid var(--primary-color);
    text-align: center;
    margin-top: 20px;
    cursor: pointer;
    font-size: 1rem;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.action-btn:hover {
    background-color: white;
    color: var(--primary-color);
    text-decoration: none;
    box-shadow: 0 4px 8px rgba(0,0,0,0.15);
}
        /* Responsive Adjustments */
        @media (max-width: 1200px) {
            .welcome-section {
                padding: 30px;
            }
            
            .welcome-content {
                max-width: 55%;
            }
            
            .bot-icon {
                width: 150px;
                height: 150px;
            }
        }

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

.stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .welcome-section h1 {
                font-size: 2rem;
            }
            
            .section-title {
                font-size: 1.5rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .recent-grid {
                grid-template-columns: 1fr;
            }
            
            .stat-icon {
                width: 60px;
                height: 60px;
            }
            
            .stat-icon img {
                width: 30px;
                height: 30px;
            }
        }
        @media (max-width: 576px) {
            .welcome-section {
                padding: 25px 15px;
            }
            
            .welcome-section h1 {
                font-size: 1.8rem;
            }
            
            .stat-card {
                flex-direction: column;
                text-align: center;
                padding: 20px;
            }
            
            .stat-icon {
                margin-right: 0;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />
    <div class="header-space"></div>

    <!-- Welcome Section -->
   
    <div class="welcome-section container">
        <div class="welcome-content">
            <h1>Welcome Back, Plant Lover!</h1>
            <p>Let's make your plants thrive!</p>
        </div>
        <img src="resources/images/system/robot_icon.png" alt="Plant Care Assistant" class="bot-icon">
    </div>

   <!-- Main Content -->
    <div class="container">
        <!-- Stats Section -->
        <section class="stats-section">
            <h2 class="section-title">Dashboard Overview</h2>
            <div class="stats-grid">
                <!-- Total Plants -->
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="resources/images/system/plants4.png" alt="Plants Icon">
                    </div>
                    <div class="stat-content">
                        <h3>Total Plants</h3>
                        <div class="value">1,248</div>
                    </div>
                </div>
                
                <!-- Total Users -->
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="resources/images/system/newusers2.png" alt="Users Icon">
                    </div>
                    <div class="stat-content">
                        <h3>Total Users</h3>
                        <div class="value">856</div>
                    </div>
                </div>
                
                
                
                <!-- Categories -->
                <div class="stat-card">
                    <div class="stat-icon">
                        <img src="resources/images/system/categoryplantss.png" alt="Categories Icon">
                    </div>
                    <div class="stat-content">
                        <h3>Plant Categories</h3>
                        <div class="value">24</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Recent Activity Section -->
        <section class="recent-section">
            <h2 class="section-title">Recent Activity</h2>
            <div class="recent-grid">
                <!-- Recently Added Plants -->
                <div class="recent-card">
                    <h3>New Plants Added</h3>
                    <ul class="recent-list">
                        <li class="recent-item">
                            <div class="recent-item-info">
                                <h4>Rose</h4>
                                
                            </div>
                        </li>
                        <li class="recent-item">
                            <div class="recent-item-info">
                                <h4>Peace Lily</h4>
                               
                            </div>
                        </li>
                        <li class="recent-item">
                            <div class="recent-item-info">
                                <h4>Marigold</h4>
                            
                            </div>
                            
                        </li>
                    </ul>
                    <a href="allPlants.jsp" class="action-btn">View All Plants</a>
                </div>
                
                <!-- New User Registrations -->
                <div class="recent-card">
                    <h3>New User Signups</h3>
                    <ul class="recent-list">
                        <li class="recent-item">
                            <div class="recent-item-info">
                                <h4>Jeshmin Shrestha</h4>
                               
                            </div>
                           
                        </li>
                        <li class="recent-item">
                            <div class="recent-item-info">
                                <h4>Ram Shrestha</h4>
                            </div>
                        </li>
                        <li class="recent-item">
                            <div class="recent-item-info">
                                <h4>Krishna Shrestha</h4>
                            </div>
                        </li>
                    </ul>
                    <a href="manageUsers.jsp" class="action-btn">Manage Users</a>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>