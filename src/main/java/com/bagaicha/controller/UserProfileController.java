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

@WebServlet("/profile")
public class UserProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//this servlet only handles GET for profile display
    }
}