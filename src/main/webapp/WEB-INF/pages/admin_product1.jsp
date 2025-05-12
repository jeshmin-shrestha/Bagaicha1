<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="header-space"></div>
    <div class="container">
        <!-- Welcome Section -->
        <div class="welcome-section container">
            <div class="welcome-content">
                <h1>Welcome Back, Plant Lover!</h1>
                <p>Let's make your plants thrive!</p>
            </div>
            <img src="${pageContext.request.contextPath}/resources/images/system/robot_icon.png" alt="Plant Care Assistant" class="bot-icon">
        </div>

        <!-- Plant Table Section -->
        <section class="plant-section">
            <div class="section-header">
                <h2 class="section-title">Plant Collection</h2>
                <div class="action-buttons">
                    <button class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/productEdit'">
                        <i class="fas fa-plus"></i> Add Plant
                    </button>
                    <div class="search-wrapper">
                        <form action="${pageContext.request.contextPath}/adminProduct" method="get">
    <input type="text" class="search-input" name="search" placeholder="Search plants" value="${searchTerm}">
    <button type="submit" class="search-btn">
        <i class="fas fa-search"></i>
    </button><br>
    <c:if test="${not empty searchTerm}">
        <a href="${pageContext.request.contextPath}/adminProduct" style=" 
    border: none;
    padding: 8px 12px;
    margin-left: 5px;
    
    color: #333;
    border-radius: 5px;">Clear</a>
    </c:if>
</form>

                    </div>
                    
                </div>
            </div>
           
            <!-- Error/Success Messages -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>
            
            <table class="plant-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Plant Name</th>
                        <th>Scientific Name</th>
                        <th>Soil Type</th>
                        <th>Fertilizer</th>
                        <th>Sunlight</th>
                        <th>Blooming Season</th>
                        <th>Water Frequency</th>
                        <th>Care Description</th>
                        <th>Added Date</th>
                        <th>Image</th>
                        <th>Category ID</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${plantList}" var="plant">
                        <tr>
                            <td>${plant.plantId}</td>
                            <td>${plant.plantName}</td>
                            <td>${plant.scientificName}</td>
                            <td>${plant.soilType}</td>
                            <td>${plant.fertilizerRequirement}</td>
                            <td>${plant.sunlightRequirement}</td>
                            <td>${plant.bloomingSeason}</td>
                            <td>${plant.waterFrequency}</td>
                            <td>${plant.careDescription}</td>
                            <td>${plant.plantAddedDate}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/images/system/${plant.imageUrl}" 
                                      onerror="this.src='${pageContext.request.contextPath}/resources/images/system/plants4.png'" alt="Plant Image" width="60" height="60">
                            </td>
                            <td>${plant.categoryId}</td>
                            <td>
                                <div class="action-icons">
                                    <button class="action-icon view" title="View" 
                                        onclick="window.location.href='productEdit?plantId=${plant.plantId}'">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="action-icon edit" title="Edit" 
                                        onclick="window.location.href='productEdit?plantId=${plant.plantId}'">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                      <button class="action-icon delete" title="Delete" 
            onclick="deletePlant(${plant.plantId})">
            <i class="fas fa-trash-alt"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
<br>
            <h2 class="section-title">User Table</h2>
            <table class="plant-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Address</th>
                        <th>Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.fullName}</td>
                            <td>${user.userName}</td>
                            <td>${user.userEmail}</td>
                            <td>${user.userPhoneNo}</td>
                            <td>${user.userRole}</td>
                            <td>${user.userAddress}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/resources/images/system/user/${user.image}" 
                                     onerror="this.src='${pageContext.request.contextPath}/resources/images/system/user_icon.png'" 
                                     alt="User Image" width="60" height="60">
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </div>

    <script>
        function editPlant(plantId) {
            window.location.href = 'editPlant?plantId=' + plantId;
        }
        
        function deletePlant(plantId) {
            if (confirm('Are you sure you want to delete this plant?')) {
                // Create a form dynamically
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'productEdit';
                
                // Add parameters
                const plantIdInput = document.createElement('input');
                plantIdInput.type = 'hidden';
                plantIdInput.name = 'plantId';
                plantIdInput.value = plantId;
                form.appendChild(plantIdInput);
                
                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'delete';
                form.appendChild(actionInput);
                
                
                
                document.body.appendChild(form);
                form.submit();
            }
        }
        
        function showPlantDetails(plantId) {
            window.location.href = 'productEdit?plantId=' + plantId;
        }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>