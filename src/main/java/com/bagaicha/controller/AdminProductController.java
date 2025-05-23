package com.bagaicha.controller;

import com.bagaicha.service.AdminProductService;
import com.bagaicha.model.PlantModel;
import com.bagaicha.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
/**
 * AdminProductController handles HTTP GET requests for the admin product management page.
 * It retrieves a list of all users and either all plants or searched plants based on a query,
 * and forwards the data to the JSP for rendering.
 *  @author Jeshmin Shrestha
 */
@WebServlet("/adminProduct")
public class AdminProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Handles GET requests by retrieving user and plant data for the admin product management page.
     * If a search term is provided via query parameter, it filters the plant list accordingly.
     *
     * @param request  the HttpServletRequest object containing the client's request
     * @param response the HttpServletResponse object used to respond to the client
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs during request forwarding
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("[DEBUG] AdminProductController - doGet() called");
        
        AdminProductService plantService = new AdminProductService();
        List<PlantModel> plantList;
        List<UserModel> userList = null;
       
        try {
            // Always load users first
            userList = plantService.getAllUsers();
            System.out.println("[DEBUG] Loaded " + (userList != null ? userList.size() : 0) + " users");
            
            // Then handle plants based on search
            String searchTerm = request.getParameter("search");
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                plantList = plantService.searchPlants(searchTerm.trim());
                request.setAttribute("searchTerm", searchTerm.trim());
            } else {
                plantList = plantService.getAllPlants();
            }
            
            request.setAttribute("plantList", plantList);
            request.setAttribute("userList", userList);
            
        } catch (Exception e) {
            System.err.println("[ERROR] in AdminProductController: " + e.getMessage());
            request.setAttribute("error", "Error loading data: " + e.getMessage());
            e.printStackTrace();
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/admin_product1.jsp").forward(request, response);
    }
}