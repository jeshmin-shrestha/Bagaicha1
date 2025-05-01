package com.bagaicha.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.bagaicha.model.PlantModel;
import com.bagaicha.service.AdminProductService;

@WebServlet("/productEdit")
public class ProductEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String plantIdParam = request.getParameter("plantId");
        
        // Clear any previous messages
        request.removeAttribute("error");
        request.removeAttribute("info");
        
        if (plantIdParam != null && !plantIdParam.isEmpty()) {
            try {
                int plantId = Integer.parseInt(plantIdParam);
                AdminProductService plantService = new AdminProductService();
                PlantModel plant = plantService.getPlantById(plantId);
                
                if (plant != null) {
                    request.setAttribute("plant", plant);
                    System.out.println("DEBUG: Found plant - " + plant.getPlantName());
                } else {
                    request.setAttribute("error", "Plant with ID " + plantId + " not found");
                    System.out.println("DEBUG: Plant not found for ID " + plantId);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid plant ID format");
                System.out.println("DEBUG: Invalid plant ID format - " + plantIdParam);
            } catch (Exception e) {
                request.setAttribute("error", "Error retrieving plant: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            request.setAttribute("info", "Creating new plant entry");
            System.out.println("DEBUG: No plant ID - creating new entry");
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/product_edit.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Handle form submission for create/update/delete
        String action = request.getParameter("action");
        AdminProductService plantService = new AdminProductService();
        boolean success = false;
        
        try {
            if ("update".equals(action)) {
                PlantModel plant = createPlantFromRequest(request);
                success = plantService.updatePlant(plant);
          
            }
            
            if (success) {
                response.sendRedirect("productEdit?plantId=" + request.getParameter("plantId") + "&success=true");
            } else {
                response.sendRedirect("productEdit?plantId=" + request.getParameter("plantId") + "&error=update_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("productEdit?error=server_error");
        }
    }
    
    private PlantModel createPlantFromRequest(HttpServletRequest request) {
        PlantModel plant = new PlantModel();
        // Set all plant properties from request parameters
        if (request.getParameter("plantId") != null && !request.getParameter("plantId").isEmpty()) {
            plant.setPlantId(Integer.parseInt(request.getParameter("plantId")));
        }
        plant.setPlantName(request.getParameter("plantName"));
        plant.setScientificName(request.getParameter("scientificName"));
        plant.setSoilType(request.getParameter("soilType"));
        plant.setFertilizerRequirement(request.getParameter("fertilizer"));
        plant.setSunlightRequirement(request.getParameter("sunlight"));
        plant.setBloomingSeason(request.getParameter("season"));
        plant.setWaterFrequency(request.getParameter("water"));
        plant.setCareDescription(request.getParameter("description"));
        plant.setCategoryId(Integer.parseInt(request.getParameter("plantCategory")));
        // Handle image upload separately
        return plant;
    }
}