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
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_product1.css" />
    
   
        
   
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