package com.bagaicha.controller;

import com.bagaicha.service.LoginService;
import com.bagaicha.service.PasswordResetService;
import com.bagaicha.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/passwordReset")
public class PasswordResetController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final PasswordResetService passwordResetService = new PasswordResetService();
    private final LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the correct JSP page
        request.getRequestDispatcher("/WEB-INF/pages/password_reset.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        String username = (String) SessionUtil.getAttribute(request, "userName");

        // Handle missing fields
        if (username == null || oldPassword == null || newPassword == null || confirmPassword == null) {
            request.setAttribute("error", "empty_password");
        }
        // Handle password mismatch
        else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "password_mismatch");
        }
        // Verify current password
        else if (!loginService.verifyPassword(username, oldPassword)) {
            request.setAttribute("error", "current_incorrect");
        }
        // Attempt to update password
        else if (!passwordResetService.updatePassword(username, newPassword)) {
            request.setAttribute("error", "update_failed");
        }
        // If everything is successful
        else {
            request.setAttribute("success", "Password changed successfully!");
        }

        // Forward to the password reset page with appropriate message
        request.getRequestDispatcher("/WEB-INF/pages/password_reset.jsp").forward(request, response);
    }
}