package com.bagaicha.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bagaicha.service.DashboardService;

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
    private DashboardService dashboardService;

    public DashboardController() {
        this.dashboardService = new DashboardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int totalUsers = dashboardService.getTotalUsers();
        int totalPlants = dashboardService.getTotalPlants();
        int totalCategories = dashboardService.getTotalCategories();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalPlants", totalPlants);
        request.setAttribute("totalCategories", totalCategories);
        request.setAttribute("recentPlants", dashboardService.getRecentPlants());
        request.setAttribute("recentUsers", dashboardService.getRecentUsers());
        request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp").forward(request, response);
    }
}