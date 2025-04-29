package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.LoginService;
import com.bagaicha.service.PasswordResetService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/passwordReset")
public class PasswordResetController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private LoginService loginService;
    private PasswordResetService profileService;
    
    @Override
    public void init() throws ServletException {
        super.init();
        this.loginService = new LoginService();
        this.profileService = new PasswordResetService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/password_reset.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        UserModel user = (UserModel) session.getAttribute("user");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate inputs
        String error = validatePasswordInputs(newPassword, confirmPassword);
        if (error != null) {
            request.setAttribute("error", error);
            doGet(request, response);
            return;
        }
        
        // Verify current password
        if (!loginService.verifyPassword(user.getUserName(), currentPassword)) {
            request.setAttribute("error", "Current password is incorrect");
            doGet(request, response);
            return;
        }
        
        // Update password
        boolean success = profileService.updatePassword(user.getUserId(), newPassword);
        
        if (success) {
            session.setAttribute("success", "Password changed successfully");
            response.sendRedirect(request.getContextPath() + "/profile");
        } else {
            request.setAttribute("error", "Failed to update password. Please try again.");
            doGet(request, response);
        }
    }
    
    private String validatePasswordInputs(String newPassword, String confirmPassword) {
        if (newPassword == null || newPassword.trim().isEmpty()) {
            return "New password cannot be empty";
        }
        
        if (newPassword.length() < 8) {
            return "Password must be at least 8 characters";
        }
        
        if (!newPassword.equals(confirmPassword)) {
            return "New passwords don't match";
        }
        
        // Add more password complexity checks if needed
        // Example: if (!newPassword.matches(".*[A-Z].*")) {
        //     return "Password must contain at least one uppercase letter";
        // }
        
        return null;
    }
}