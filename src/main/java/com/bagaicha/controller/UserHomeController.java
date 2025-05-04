package com.bagaicha.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.bagaicha.model.PlantModel;
import com.bagaicha.service.UserProductService;

@WebServlet(asyncSupported = true, urlPatterns = {"/userHome"})
public class UserHomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserProductService productService;
    
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            productService = new UserProductService();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserProductService", e);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Check user session
            String userName = (String) request.getSession().getAttribute("userName");
            if (userName == null) {
                userName = (String) request.getSession().getAttribute("username");
            }
            request.setAttribute("userName", userName);
            
            // Get featured plants
            List<PlantModel> plants = productService.getFeaturedPlants();
            request.setAttribute("plants", plants);
            
            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/user_homepage.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                "Error processing request: " + e.getMessage());
        }
    }
}