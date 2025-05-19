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
/**
 * Servlet implementation class UserHomeController
 * 
 * Handles GET requests for the user homepage.
 * 
 * Responsibilities:
 * - Retrieves the username from the current user session.
 * - Retrieves a list of featured plants using UserProductService.
 * - Forwards the request along with userName and plants attributes to the user homepage JSP.
 * 
 * This servlet supports asynchronous operations and is mapped to the "/userHome" URL.
 * 
 * @author Jeshmin Shrestha
 *
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/userHome"})
public class UserHomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserProductService productService;
    /**
     * Initializes the servlet and the UserProductService.
     * 
     * @throws ServletException if UserProductService initialization fails
     */
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            productService = new UserProductService();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserProductService", e);
        }
    }
    /**
     * Handles HTTP GET requests to display the user homepage.
     * 
     * Retrieves the username from the HTTP session, obtains featured plants
     * from the service layer, sets them as request attributes, and forwards
     * to the JSP page for rendering.
     * 
     * If any exception occurs, sends a 500 Internal Server Error response.
     * 
     * @param request HttpServletRequest object containing client request data
     * @param response HttpServletResponse object for sending response data
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs during request handling
     */ 
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