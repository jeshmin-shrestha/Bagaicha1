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
/**
 * Servlet implementation class UserProductController
 * 
 * Handles requests to display a list of plants to users.
 * 
 * Supports searching plants by a search term and displays either
 * the search results or all plants when no search term is provided.
 * 
 * URL pattern: /productList
 * @author Jeshmin Shrestha
 */
@WebServlet("/productList")
public class UserProductController extends HttpServlet {
	
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
	     * Handles HTTP GET requests for the plant product list.
	     * 
	     * Retrieves the optional 'search' query parameter. If present and not empty,
	     * performs a search for plants matching the search term. Otherwise,
	     * fetches all plants from the database.
	     * @param request HttpServletRequest object containing client request data
	     * @param response HttpServletResponse object for sending response data
	     * @throws ServletException if servlet-specific error occurs
	     * @throws IOException if an I/O error occurs during request handling
	     */
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