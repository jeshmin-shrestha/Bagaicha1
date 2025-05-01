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

                <%@ page import="java.util.List" %>
<%@ page import="com.bagaicha.model.PlantModel" %>

<%
    List<PlantModel> plantList = (List<PlantModel>) request.getAttribute("plantList");
    if (plantList != null) {
        for (PlantModel plant : plantList) {
%>
<tr>
    <td><%= plant.getPlantId() %></td>
    <td><%= plant.getPlantName() %></td>
    <td><%= plant.getScientificName() %></td>
    <td><%= plant.getSoilType() %></td>
    <td><%= plant.getFertilizerRequirement() %></td>
    <td><%= plant.getSunlightRequirement() %></td>
    <td><%= plant.getBloomingSeason() %></td>
    <td><%= plant.getWaterFrequency() %></td>
    <td><%= plant.getCareDescription() %></td>
    <td><%= plant.getPlantAddedDate() %></td>
    <td>
        <img src="<%= plant.getImageUrl() %>" alt="Plant Image" width="60" height="60">
    </td>
    <td><%= plant.getCategoryId() %></td>
    <td>
        <div class="action-icons">
<button class="action-icon view" title="View" 
        onclick="window.location.href='productEdit?plantId=<%= plant.getPlantId() %>'">
    <i class="fas fa-eye"></i>
</button>
            <button class="action-icon edit" title="Edit"><i class="fas fa-edit"></i></button>
            <button class="action-icon delete" title="Delete"><i class="fas fa-trash-alt"></i></button>
        </div>
    </td>
</tr>
<%
        }
    }
%>

            </table>
        </section>
    </div>

    <script>
       
        
        function editPlant(plantId) {
            window.location.href = 'editPlant?plantId=' + plantId;
        }
        
        function confirmDelete(plantId) {
            if (confirm('Are you sure you want to delete this plant?')) {
                window.location.href = 'deletePlant?plantId=' + plantId;
            }
        }
        function showPlantDetails(plantId) {
            window.location.href = 'productEdit';
        }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>