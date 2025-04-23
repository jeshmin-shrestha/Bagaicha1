package com.bagaicha.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

//import com.bagaicha.service.DashboardService;

/**
 * Servlet implementation for handling dashboard-related HTTP requests.
 * 
 * This servlet manages interactions with the DashboardService to fetch student
 * information, handle updates, and manage student data. It forwards requests to
 * appropriate JSP pages or handles POST actions based on the request
 * parameters.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Instance of DashboardService for handling business logic
	//private DashboardService dashboardService;

	/**
	 * Default constructor initializes the DashboardService instance.
	 */
	public DashboardController() {
		//this.dashboardService = new DashboardService();
	}

	/**
	 * Handles HTTP GET requests by retrieving student information and forwarding
	 * the request to the dashboard JSP page.
	 * 
	 * @param request  The HttpServletRequest object containing the request data.
	 * @param response The HttpServletResponse object used to return the response.
	 * @throws ServletException If an error occurs during request processing.
	 * @throws IOException      If an input or output error occurs.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    
	    // ⚠️ Remove or comment these if not implemented yet
	    // request.setAttribute("plantList", dashboardService.getAllPlants());
	    // request.setAttribute("totalPlants", dashboardService.getTotalPlants());
	    // request.setAttribute("seasonalPlants", dashboardService.getPlantsBySeason("Spring"));
	    // request.setAttribute("sunlightPlants", dashboardService.getPlantsBySunlight("Full Sun"));

	    request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp").forward(request, response);
	}
}