package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.PlantModel;
import com.bagaicha.service.UserProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productView")
public class UserProductEachController extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private UserProductService productService;
    
    @Override
    public void init() throws ServletException {
        productService = new UserProductService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int plantId = Integer.parseInt(request.getParameter("id"));
            PlantModel plant = productService.getPlantById(plantId);
            
            if (plant != null) {
                request.setAttribute("plant", plant);
                request.getRequestDispatcher("/WEB-INF/pages/user_product.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Plant not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
