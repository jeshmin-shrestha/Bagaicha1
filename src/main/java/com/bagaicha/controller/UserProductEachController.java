package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.PlantModel;
import com.bagaicha.service.UserProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class UserProductEachController
 * 
 * Handles requests to view details of a single plant product.
 * 
 * URL pattern: /productView
 * 
 * @author Jeshmin Shrestha
 */
@WebServlet("/productView")
public class UserProductEachController extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private UserProductService productService;
/**
 * Initializes the UserProductService instance.
 * 
 * @throws ServletException if service initialization fails
 */
    @Override
    public void init() throws ServletException {
        productService = new UserProductService();
    }
    /**
     * Handles HTTP GET requests to show details of a specific plant product.
     * 
     * Expects a query parameter "id" representing the plant's unique identifier.
     * Attempts to retrieve the plant details from the service layer.
     * 
     * @param request HttpServletRequest object containing client request data
     * @param response HttpServletResponse object for sending response data
     * @throws ServletException if servlet-specific error occurs
     * @throws IOException if an I/O error occurs during request handling
     */
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