package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/**
 * Servlet implementation class UserProfileController
 * 
 * Handles displaying the user's profile page.
 * 
 * URL pattern: /profile
 *
 * @author Jeshmin Shrestha
 * 
 */
@WebServlet("/profile")
public class UserProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    /**
     * Handles HTTP GET requests to display the user's profile page.
     * 
     * Retrieves user information from the session or database if not found in session.
     * Processes optional "success" and "error" parameters for feedback messages.
     * Forwards request to the user_profile.jsp page.
     * 
     * @param request  HttpServletRequest containing client request data
     * @param response HttpServletResponse used to send response to client
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // Update the doGet method to handle both success parameters
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");
        
        if (user == null) {
            String username = (String) session.getAttribute("userName");
            if (username != null) {
                LoginService loginService = new LoginService();
                user = loginService.getUserDetails(username);
            }
        }

        // Handle success/error messages
        if (request.getParameter("success") != null || request.getParameter("updated") != null) {
            request.setAttribute("success", "Profile updated successfully!");
        }
        if (request.getParameter("error") != null) {
            request.setAttribute("error", "Failed to update profile");
        }

        if (user != null) {
            request.setAttribute("user", user);
            System.out.println("DEBUG - User data: " + user);
        } else {
            request.setAttribute("error", "No user logged in!");
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/user_profile.jsp").forward(request, response);
    }
    
    /**
     * Handles HTTP POST requests.
     * 
     * This servlet currently does not support POST requests as it only handles
     * displaying the user profile. POST requests should be handled by appropriate
     * controllers for profile updates or other user actions.
     * 
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//this servlet only handles GET for profile display
    }
}