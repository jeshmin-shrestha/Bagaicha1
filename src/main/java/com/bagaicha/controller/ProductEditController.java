package com.bagaicha.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;



import com.bagaicha.model.PlantModel;
import com.bagaicha.service.AdminProductService;
import com.bagaicha.util.ImageUtil;
import com.bagaicha.util.ValidationUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/productEdit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                maxFileSize = 1024 * 1024 * 10,      // 10MB
                maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private final ImageUtil imageUtil = new ImageUtil();

    private AdminProductService plantService;

    public ProductEditController() {
        this.plantService = new AdminProductService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String plantIdParam = request.getParameter("plantId");
        
        // Clear previous messages
        request.removeAttribute("error");
        request.removeAttribute("success");
        
        // Handle success/error messages from redirects
        if (request.getParameter("success") != null) {
            request.setAttribute("success", request.getParameter("success"));
        }
        if (request.getParameter("error") != null) {
            request.setAttribute("error", request.getParameter("error"));
        }
        
        if (plantIdParam != null && !plantIdParam.isEmpty()) {
            try {
            	   int plantId = Integer.parseInt(plantIdParam);
                   AdminProductService plantService = new AdminProductService();
                   PlantModel plant = plantService.getPlantById(plantId);
                   
                
                if (plant != null) {
                    request.setAttribute("plant", plant);
                } else {
                    request.setAttribute("error", "Plant not found with ID: " + plantId);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid plant ID format");
            } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/product_edit.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter is required");
            return;
        }
        
        try {
            switch (action) {
                case "update":
                    handleUpdate(request, response);
                    break;
                case "add":
                    handleAdd(request, response);
                    break;
                case "delete":
                    handleDelete(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Database driver not found: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Database error: " + e.getMessage());
        }
    }
    
    
    
    private void handleUpdate(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        AdminProductService plantService = new AdminProductService();
        PlantModel plant = createPlantFromRequest(request);
        
        boolean success = plantService.updatePlant(plant);
        HttpSession session = request.getSession();
        if (success) {
        	session.setAttribute("popupMessage", "Plant updated successfully!");
            session.setAttribute("popupType", "success");
            response.sendRedirect("productEdit?plantId=" + plant.getPlantId() + "&success=true");
        } else {
        	session.setAttribute("popupMessage", "Failed to update plant");
            session.setAttribute("popupType", "error");
            response.sendRedirect("productEdit?plantId=" + plant.getPlantId() + "&error=update_failed");
        }
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        AdminProductService plantService = new AdminProductService();
        PlantModel plant = createPlantFromRequest(request);
        
        boolean success = plantService.addPlant(plant);
        HttpSession session = request.getSession();
        
        if (success) {
            session.setAttribute("popupMessage", "Plant added successfully!");
            session.setAttribute("popupType", "success");
            response.sendRedirect("adminProduct");
        } else {
            session.setAttribute("popupMessage", "Failed to add plant");
            session.setAttribute("popupType", "error");
            response.sendRedirect("productEdit");
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        int plantId = Integer.parseInt(request.getParameter("plantId"));
        AdminProductService plantService = new AdminProductService();
        
        boolean success = plantService.deletePlant(plantId);
        HttpSession session = request.getSession();
        if (success) {
        	session.setAttribute("popupMessage", "Plant deleted successfully!");
            session.setAttribute("popupType", "success");
            response.sendRedirect("productList?success=delete_success");
        } else {
        	session.setAttribute("popupMessage", "Failed to delete plant");
            session.setAttribute("popupType", "error");
            response.sendRedirect("productEdit?plantId=" + plantId + "&error=delete_failed");
        }
    }
    private PlantModel createPlantFromRequest(HttpServletRequest request) throws IOException, ServletException {
        PlantModel plant = new PlantModel();
        
        if (request.getParameter("plantId") != null && !request.getParameter("plantId").isEmpty()) {
            plant.setPlantId(Integer.parseInt(request.getParameter("plantId")));
        }
        
        Part imagePart = request.getPart("image");
        String existingImage = request.getParameter("existingImage"); // Get existing image from hidden field
//        String imageName = imageUtil.getImageNameFromPart(imagePart);
     // Only process new image if one was actually uploaded
        if (imagePart != null && imagePart.getSize() > 0) {
            String imageName = imageUtil.getImageNameFromPart(imagePart);
            if (imageName != null && !imageName.isEmpty()) {
                plant.setImageUrl("plants/" + imageName);
                imageUtil.uploadImage(imagePart, request.getServletContext().getRealPath("/"), "plants");
                System.out.println("New image uploaded: " + plant.getImageUrl());
            }
        } 
        // If no new image but existing image exists, keep the existing one
        else if (existingImage != null && !existingImage.isEmpty()) {
            plant.setImageUrl(existingImage);
            System.out.println("Keeping existing image: " + existingImage);
        }
        plant.setPlantName(request.getParameter("plantName"));
        plant.setScientificName(request.getParameter("scientificName"));
        plant.setSoilType(request.getParameter("soilType"));
        plant.setFertilizerRequirement(request.getParameter("fertilizer"));
        plant.setSunlightRequirement(request.getParameter("sunlight"));
        plant.setBloomingSeason(request.getParameter("season"));
        plant.setWaterFrequency(request.getParameter("water"));
        plant.setCareDescription(request.getParameter("description"));
        
        if (request.getParameter("plantCategory") != null && !request.getParameter("plantCategory").isEmpty()) {
            plant.setCategoryId(Integer.parseInt(request.getParameter("plantCategory")));
        }
        
        // Handle image upload if needed
        return plant;
    }
    
    private String validatePlantForm(HttpServletRequest request) {
        String plantName = request.getParameter("plantName");
        String scientificName = request.getParameter("scientificName");
        String soilType = request.getParameter("soilType");
        String fertilizer = request.getParameter("fertilizer");
        String sunlight = request.getParameter("sunlight");
        String season = request.getParameter("season");
        String water = request.getParameter("water");
        String description = request.getParameter("description");
        String category = request.getParameter("plantCategory");

        if (ValidationUtil.isNullOrEmpty(plantName)) {
            return "Plant name is required";
        }
        if (ValidationUtil.isNullOrEmpty(scientificName)) {
            return "Scientific name is required";
        }
        if (ValidationUtil.isNullOrEmpty(soilType)) {
            return "Soil type is required";
        }
        if (ValidationUtil.isNullOrEmpty(category)) {
            return "Category is required";
        }
        if (plantName.length() > 100) {
            return "Plant name must be less than 100 characters";
        }

        try {
            Part image = request.getPart("image");
            // Only validate image if it's a new plant (no plantId)
            if (request.getParameter("plantId") == null) {
                if (image == null || image.getSize() == 0) {
                    return "Plant image is required for new plants";
                }
                if (!ValidationUtil.isValidImageExtension(image)) {
                    return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
                }
            } else if (image != null && image.getSize() > 0) {
                // For updates, only validate if a new image was actually uploaded
                if (!ValidationUtil.isValidImageExtension(image)) {
                    return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
                }
            }
        } catch (Exception e) {
            return "Error processing image upload";
        }

        return null;

    }

}