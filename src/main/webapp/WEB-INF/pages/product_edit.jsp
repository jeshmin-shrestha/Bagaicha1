<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${not empty plant.plantId ? 'View/Edit Plant' : 'Add New Plant'} | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product_edit.css" />
    <script>
        function toggleEditMode() {
            const form = document.querySelector('.edit-body');
            const inputs = form.querySelectorAll('input, select, textarea');
            const isViewMode = form.classList.contains('view-mode');
            
            if (isViewMode) {
                // Switch to edit mode
                form.classList.remove('view-mode');
                inputs.forEach(input => {
                    input.disabled = false;
                    if (input.type === 'file') {
                        input.style.display = 'block';
                    }
                });
                document.querySelector('.btn-edit').style.display = 'none';
                document.querySelector('.action-buttons').style.display = 'flex';
            }
        }
        
        function initEditMode() {
            <c:choose>
                <c:when test="${empty plant.plantId}">
                    // New plant - always in edit mode
                    document.querySelector('.edit-body').classList.remove('view-mode');
                </c:when>
                <c:otherwise>
                    // Existing plant - start in view mode
                    document.querySelector('.edit-body').classList.add('view-mode');
                    const inputs = document.querySelectorAll('.edit-body input, .edit-body select, .edit-body textarea');
                    inputs.forEach(input => {
                        input.disabled = true;
                        if (input.type === 'file') {
                            input.style.display = 'none';
                        }
                    });
                    document.querySelector('.action-buttons').style.display = 'none';
                </c:otherwise>
            </c:choose>
        }
        
        window.onload = initEditMode;
    </script>
</head>
<body>
    <!-- Header Include -->
    <jsp:include page="header.jsp" />

    <!-- Welcome Section -->
    <div class="welcome-section container">
        <div class="welcome-content">
            <h1>Welcome Back, Plant Lover!</h1>
            <p>Let's make your plants thrive!</p>
        </div>
        <img src="resources/images/system/robot_icon.png" alt="Plant Care Assistant" class="bot-icon">
    </div>

    <div class="main-container">
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <c:if test="${not empty info}">
            <div class="alert alert-info">${info}</div>
        </c:if>
        
        <div class="edit-card">
            <div class="edit-header">
                <h3>${not empty plant.plantId ? 'Plant Details' : 'Add New Plant'}</h3>
                <c:if test="${not empty plant.plantId}">
                    <button class="btn btn-edit" onclick="toggleEditMode()">Edit Plant</button>
                </c:if>
            </div>

            <form method="post" action="productEdit" enctype="multipart/form-data" class="edit-body">
                <input type="hidden" name="plantId" value="${plant.plantId}">
                
                <!-- Image Section -->
                <div class="image-section">
                    <c:if test="${not empty plant.imageUrl}">
                        <img src="${plant.imageUrl}" alt="Plant Image" class="plant-image">
                    </c:if>
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="form-image">Image</label>
                            <input type="file" id="form-image" name="image" accept="image/*" ${empty plant.plantId ? 'required' : ''}>
                        </div>
                    </div>
                    <div class="image-actions">
                        <button type="button" class="btn btn-sm btn-replace">Replace</button>
                        <button type="button" class="btn btn-sm btn-remove">Remove</button>
                    </div>
                </div>

                <!-- Form Fields -->
                <div class="form-grid">
                    <div class="form-group">
                        <label for="plantName">Plant Name</label>
                        <input type="text" name="plantName" id="plantName" value="${plant.plantName}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="scientificName">Scientific Name</label>
                        <input type="text" name="scientificName" id="scientificName" value="${plant.scientificName}" required>
                    </div>
                    
                    <!-- Plant Category -->
                    <div class="form-group">
                        <label for="plantCategory">Plant Category</label>
                        <select name="plantCategory" id="plantCategory" required>
                            <option value="">Select Category</option>
                            <option value="1" ${plant.categoryId == 1 ? 'selected' : ''}>Succulent</option>
                            <option value="2" ${plant.categoryId == 2 ? 'selected' : ''}>Flowering</option>
                            <option value="3" ${plant.categoryId == 3 ? 'selected' : ''}>Herb</option>
                            <option value="4" ${plant.categoryId == 4 ? 'selected' : ''}>Shrub</option>
                            <option value="5" ${plant.categoryId == 5 ? 'selected' : ''}>Tree</option>
                        </select>
                    </div>

                    <!-- Soil Type -->
                    <div class="form-group">
                        <label for="soilType">Soil Type</label>
                        <select name="soilType" id="soilType" required>
                            <option value="">Select Soil</option>
                            <option value="Sandy" ${plant.soilType == 'Sandy' ? 'selected' : ''}>Sandy</option>
                            <option value="Loamy" ${plant.soilType == 'Loamy' ? 'selected' : ''}>Loamy</option>
                            <option value="Clay" ${plant.soilType == 'Clay' ? 'selected' : ''}>Clay</option>
                            <option value="Peaty" ${plant.soilType == 'Peaty' ? 'selected' : ''}>Peaty</option>
                            <option value="Chalky" ${plant.soilType == 'Chalky' ? 'selected' : ''}>Chalky</option>
                            <option value="Silty" ${plant.soilType == 'Silty' ? 'selected' : ''}>Silty</option>
                            <option value="Well-drained" ${plant.soilType == 'Well-drained' ? 'selected' : ''}>Well-drained</option>
                        </select>
                    </div>

                    <!-- Fertilizer Requirement -->
                    <div class="form-group">
                        <label for="fertilizer">Fertilizer Requirement</label>
                        <select name="fertilizer" id="fertilizer" required>
                            <option value="">Select Fertilizer</option>
                            <option value="Monthly organic fertilizer" ${plant.fertilizerRequirement == 'Monthly organic fertilizer' ? 'selected' : ''}>Monthly organic fertilizer</option>
                            <option value="Bi-weekly fertilizer" ${plant.fertilizerRequirement == 'Bi-weekly fertilizer' ? 'selected' : ''}>Bi-weekly fertilizer</option>
                            <option value="Weekly fertilizer" ${plant.fertilizerRequirement == 'Weekly fertilizer' ? 'selected' : ''}>Weekly fertilizer</option>
                        </select>
                    </div>

                    <!-- Sunlight Requirement -->
                    <div class="form-group">
                        <label for="sunlight">Sunlight Requirement</label>
                        <select name="sunlight" id="sunlight" required>
                            <option value="">Select Sunlight</option>
                            <option value="Full sun" ${plant.sunlightRequirement == 'Full Sun' ? 'selected' : ''}>Full sun</option>
                            <option value="Partial sun" ${plant.sunlightRequirement == 'Partial Sun' ? 'selected' : ''}>Partial sun</option>
                            <option value="Shade" ${plant.sunlightRequirement == 'Shade' ? 'selected' : ''}>Shade</option>
                        </select>
                    </div>

                    <!-- Water Frequency -->
                    <div class="form-group">
                        <label for="water">Water Frequency</label>
                        <select name="water" id="water" required>
                            <option value="">Select Frequency</option>
                            <option value="Daily" ${plant.waterFrequency == 'Daily' ? 'selected' : ''}>Daily</option>
                            <option value="2 times a week" ${plant.waterFrequency == '2 times a week' ? 'selected' : ''}>2 times a week</option>
                            <option value="Weekly" ${plant.waterFrequency == 'Weekly' ? 'selected' : ''}>Weekly</option>
                            <option value="Bi-weekly" ${plant.waterFrequency == 'Bi-weekly' ? 'selected' : ''}>Bi-weekly</option>
                            <option value="Every 2-3 days" ${plant.waterFrequency == 'Every 2-3 days' ? 'selected' : ''}>Every 2-3 days</option>
                        </select>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="description">Care Description</label>
                        <textarea name="description" id="description">${plant.careDescription}</textarea>
                    </div>
                </div>

                <!-- Action Buttons (Hidden in view mode) -->
                <div class="action-buttons">
                    <button type="button" class="btn btn-cancel" onclick="window.history.back()">Cancel</button>
                    <c:if test="${not empty plant.plantId}">
                        <button type="submit" class="btn btn-delete" name="action" value="delete">Delete Plant</button>
                        <button type="submit" class="btn btn-update" name="action" value="update">Update Plant</button>
                    </c:if>
                    <button type="submit" class="btn btn-add" name="action" value="add">Add New Plant</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer Include -->
    <jsp:include page="footer.jsp" />
</body>
</html>