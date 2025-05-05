package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.LoginService;
import com.bagaicha.service.PasswordResetService;
import com.bagaicha.service.UpdateProfileService;

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
        HttpSession session = request.getSession();

        UserModel currentUser = (UserModel) session.getAttribute("user");
        if (currentUser == null) {
            response.sendRedirect("login"); // Redirect to login if no user is logged in
            return;
        }

        UserModel updatedUser = new UserModel();
        updatedUser.setFullName(request.getParameter("fullName"));
        updatedUser.setUserName(request.getParameter("username"));
        updatedUser.setUserPhoneNo(request.getParameter("phone"));
        updatedUser.setUserEmail(currentUser.getUserEmail()); // assuming email is unique identifier
        updatedUser.setUserPassword(currentUser.getUserPassword()); // reuse password

        UpdateProfileService userService = new UpdateProfileService(); // Renamed to UserService for clarity
        boolean success = userService.updateUserInfo(updatedUser);

        if (success) {
            session.setAttribute("user", updatedUser); // update session
            response.sendRedirect("profile?updated=true"); // Redirect to profile page with success message
        } else {
            request.setAttribute("error", "Failed to update profile.");
            request.getRequestDispatcher("WEB-INF/pages/user_profile.jsp").forward(request, response); // Forward to the correct page
        }
        
        System.out.println("Received update request:");
        System.out.println("Full Name: " + request.getParameter("fullName"));
        System.out.println("Username: " + request.getParameter("username"));
        System.out.println("Email: " + request.getParameter("email"));
        System.out.println("Phone: " + request.getParameter("phone"));
        System.out.println("Address: " + request.getParameter("address"));
    }
}
