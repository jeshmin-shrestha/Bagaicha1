package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.LoginService;
import com.bagaicha.service.UserProfileService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/change-password")
public class PasswordResetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/pages/password_reset.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate inputs
        if (newPassword == null || newPassword.length() < 8) {
            request.setAttribute("error", "Password must be at least 8 characters");
            doGet(request, response);
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New passwords don't match");
            doGet(request, response);
            return;
        }
        
        // Verify current password
        LoginService loginService = new LoginService();
        if (!loginService.verifyPassword(user.getUserName(), currentPassword)) {
            request.setAttribute("error", "Current password is incorrect");
            doGet(request, response);
            return;
        }
        
        // Update password
        UserProfileService profileService = new UserProfileService();
        boolean success = profileService.updatePassword(user.getUserId(), newPassword);
        
        if (success) {
            session.setAttribute("success", "Password changed successfully");
            response.sendRedirect("profile");
        } else {
            request.setAttribute("error", "Failed to update password. Please try again.");
            doGet(request, response);
        }
    }
}