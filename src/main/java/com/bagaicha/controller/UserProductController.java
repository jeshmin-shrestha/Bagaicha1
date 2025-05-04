package com.bagaicha.controller;

import java.io.IOException;
import java.util.List;

import com.bagaicha.model.PlantModel;
import com.bagaicha.service.UserProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productList")
public class UserProductController extends HttpServlet {
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
	            String searchTerm = request.getParameter("search");
	            List<PlantModel> plants;
	            
	            if (searchTerm != null && !searchTerm.isEmpty()) {
	                plants = productService.searchPlants(searchTerm);
	            } else {
	                // Use getAllPlants() instead of getFeaturedPlants()
	                plants = productService.getAllPlants();
	            }
	            
	            request.setAttribute("plants", plants);
	            request.setAttribute("showBrowseAll", false); // Hide "Browse All" link
	            request.getRequestDispatcher("/WEB-INF/pages/user_product_list.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	    }
	}