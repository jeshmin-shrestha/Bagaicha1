<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c6e49;
            --primary-light: #4c956c;
            --primary-lighter: #b5d6a7;
            --primary-lightest: #dfeac9;
            --accent: #fefee3;
            --text-dark: #333333;
            --text-medium: #555555;
            --text-light: #777777;
            --white: #ffffff;
            --light-bg: #f8f9fa;
            --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --border-radius: 12px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-bg);
            color: var(--text-dark);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
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
        

        /* Plant Table Section */
        .plant-section {
            background-color:#C3CDB2;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            margin: 2rem auto;
            box-shadow: var(--card-shadow);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .section-title {
            font-size: 1.5rem;
            color: var(--primary);
            font-weight: 600;
        }

        .action-buttons {
            display: flex;
            gap: 0.75rem;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            border: none;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background-color: var(--primary);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--primary-light);
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background-color: var(--primary-lightest);
        }

        /* Search Wrapper Styles */
.search-wrapper {
    position: relative;
    display: flex;
    align-items: center;
}

.search-input {
    padding: 0.5rem 2rem 0.5rem 1rem; /* Right padding for button */
    border-radius: 6px;
    border: 1px solid #ddd;
    min-width: 200px;
    transition: var(--transition);
    height: 38px; /* Match button height */
}

.search-input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 2px rgba(44, 110, 73, 0.2);
}

.search-btn {
    position: absolute;
    right: 0.5rem;
    background: transparent;
    border: none;
    color: var(--text-light);
    cursor: pointer;
    font-size: 1rem;
    padding: 0.5rem;
    transition: var(--transition);
}

.search-btn:hover {
    color: var(--primary);
}

/* Adjust action buttons for better spacing */
.action-buttons {
    display: flex;
    gap: 0.75rem;
    flex-wrap: wrap;
    align-items: center;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .search-wrapper {
        width: 100%;
    }
    
    .search-input {
        width: 100%;
    }
    
    .action-buttons > * {
        width: 100%;
    }
    
    .btn {
        justify-content: center;
    }
}
        /* Table Styles */
        .plant-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .plant-table thead {
            background-color: var(--primary);
            color: var(--white);
        }

        .plant-table th {
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }

        .plant-table tbody tr {
            border-bottom: 1px solid #eee;
            transition: var(--transition);
        }

        .plant-table tbody tr:nth-child(even) {
            background-color: var(--primary-lightest);
        }

        .plant-table tbody tr:hover {
            background-color: #f0f7ed;
        }

        .plant-table td {
            padding: 1rem;
            color: var(--text-medium);
        }

        .action-icons {
            display: flex;
            gap: 1rem;
        }

        .action-icon {
            background: none;
            border: none;
            color: var(--text-light);
            cursor: pointer;
            font-size: 1rem;
            transition: var(--transition);
        }

        .action-icon.view {
            color: var(--primary-light);
        }

        .action-icon.edit {
            color: var(--primary);
        }

        .action-icon.delete {
            color: #e74c3c;
        }

        .action-icon:hover {
            transform: scale(1.1);
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

            
            .section-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .action-buttons {
                width: 100%;
            }
           
        }
         @media (max-width: 768px) {
            .welcome-section h1 {
                font-size: 2rem;
            }
            }
    </style>
</head>
<body>
    <div class="container">
        <!-- Welcome Section -->
    <div class="welcome-section container">
        <div class="welcome-content">
            <h1>Welcome Back, Plant Lover!</h1>
            <p>Let's make your plants thrive!</p>
        </div>
        <img src="resources/images/system/robot_icon.png" alt="Plant Care Assistant" class="bot-icon">
    </div>

        <!-- Plant Table Section -->
        <section class="plant-section">
            <div class="section-header">
    <h2 class="section-title">Plant Collection</h2>
    <div class="action-buttons">
        <button class="btn btn-primary">
            <i class="fas fa-plus"></i> Add Plant
        </button>
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
</div>
           

            <table class="plant-table">
                <thead>
                    <tr>
                        <th>Plant Name</th>
                        <th>Category</th>
                        <th>Last Watered</th>
                        <th>Actions</th>
                      
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Rose (Rosa spp.)</td>
                        <td>Seasonal Flower</td>
                        <td>2 days ago</td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view" title="View">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button class="action-icon edit" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="action-icon delete" title="Delete">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Snake Plant (Sansevieria)</td>
                        <td>Indoor Plant</td>
                        <td>1 week ago</td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view" title="View">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button class="action-icon edit" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="action-icon delete" title="Delete">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Basil (Ocimum basilicum)</td>
                        <td>Herb</td>
                        <td>Yesterday</td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view" title="View">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button class="action-icon edit" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="action-icon delete" title="Delete">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>

<%@ include file="footer.jsp" %>
</body>
</html>