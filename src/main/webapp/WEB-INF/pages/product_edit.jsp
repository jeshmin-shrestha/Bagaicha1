<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Plant | Bagaicha</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
                   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product_edit.css" />
    
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

    <!-- Main Content -->
    <div class="main-container">
        <div class="edit-card">
            <div class="edit-header">
                <h3>Plant </h3>
            </div>

            <form method="post" action="PlantController" enctype="multipart/form-data" class="edit-body">
                <!-- Image Section -->
                <div class="image-section">
                    
				<!-- Image Upload Row -->
				<div class="form-row">
					<div class="form-group full-width">
						<label for="form-image"> Image</label>
						<input type="file" id="form-image" name="image" accept="image/*" required>
					</div>
				</div>
                    <div class="image-actions">
                        <button type="button" class="btn btn-sm btn-replace">
                            
                            Replace
                        </button>
                        <button type="button" class="btn btn-sm btn-remove">
                            
                            Remove
                        </button>
                    </div>
                </div>

                <!-- Form Fields -->
                <div class="form-grid">
                    <div class="form-group">
                        <label for="plantName">Plant Name</label>
                        <input type="text" name="plantName" id="plantName" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="scientificName">Scientific Name</label>
                        <input type="text" name="scientificName" id="scientificName"required>
                    </div>
                    
                    <div class="form-group">
                        <label for="plantCategory">Plant Category</label>
                        <select name="plantCategory" id="plantCategory" required>
                            <option value="">Select Category</option>
                            <option value="succulent" >Succulent</option>
                            <option value="flowering">Flowering</option>
                            <option value="herb">Herb</option>
                            <option value="shrub">Shrub</option>
                            <option value="tree">Tree</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="soilType">Soil Type</label>
                        <select name="soilType" id="soilType" required>
                            <option value="">Select Soil</option>
                            <option value="sandy" >Sandy</option>
                            <option value="loamy">Loamy</option>
                            <option value="clay">Clay</option>
                            <option value="peaty">Peaty</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="fertilizer">Fertilizer Requirement</label>
                        <select name="fertilizer" id="fertilizer" required>
                            <option value="">Select Fertilizer</option>
                            <option value="low" >Low</option>
                            <option value="medium">Medium</option>
                            <option value="high">High</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="sunlight">Sunlight Requirement</label>
                        <select name="sunlight" id="sunlight" required>
                            <option value="">Select Sunlight</option>
                            <option value="full" >Full Sun</option>
                            <option value="partial">Partial Sun</option>
                            <option value="shade">Shade</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="season">Blooming Season</label>
                        <select name="season" id="season">
                            <option value="">Select Season</option>
                            <option value="summer">Summer</option>
                            <option value="winter">Winter</option>
                            <option value="spring">Spring</option>
                            <option value="fall">Fall</option>
                            <option value="none" >Doesn't Bloom</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="water">Water Frequency</label>
                        <select name="water" id="water" required>
                            <option value="">Select Frequency</option>
                            <option value="rare" >Rarely</option>
                            <option value="weekly">Weekly</option>
                            <option value="biweekly">Bi-weekly</option>
                            <option value="daily">Daily</option>
                        </select>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="description">Care Description</label>
                        <textarea name="description" id="description" placeholder="Provide detailed care instructions for this plant..."></textarea>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="action-buttons">
                    <button type="button" class="btn btn-cancel">Cancel</button>
                    <button type="submit" class="btn btn-delete" name="action" value="delete">Delete Plant</button>
                    <button type="submit" class="btn btn-update" name="action" value="update">Update Plant</button>
                    <button type="submit" class="btn btn-add" name="action" value="add">Add New Plant</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer Include -->
    <jsp:include page="footer.jsp" />
</body>
</html>