package com.bagaicha.controller;

import com.bagaicha.service.AdminProductService;
import com.bagaicha.model.PlantModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminProduct")
public class AdminProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("[DEBUG] AdminProductController - doGet() called");
        
        AdminProductService plantService = new AdminProductService();
        List<PlantModel> plantList = plantService.getAllPlants();
        
        // Debug output
        System.out.println("[DEBUG] Retrieved " + (plantList != null ? plantList.size() : "null") + " plants");
        if (plantList != null && !plantList.isEmpty()) {
            System.out.println("[DEBUG] First plant: " + plantList.get(0).getPlantName());
        }
        
        request.setAttribute("plantList", plantList);
        request.getRequestDispatcher("/WEB-INF/pages/admin_product1.jsp").forward(request, response);
    }
}