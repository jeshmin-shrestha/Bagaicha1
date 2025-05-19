package com.bagaicha.controller;

import com.bagaicha.service.LoginService;
import com.bagaicha.service.PasswordResetService;
import com.bagaicha.util.SessionUtil;
import com.bagaicha.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
/**
 * PasswordResetController handles requests related to password change.
 * It verifies the user's old password and applies validation rules
 * before updating to a new password.
 *  @author Jeshmin Shrestha
 */
@WebServlet("/passwordReset")
public class PasswordResetController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final PasswordResetService passwordResetService = new PasswordResetService();
    private final LoginService loginService = new LoginService();
    /**
     * Handles GET requests by forwarding to the password reset JSP.
     *
     * @param request  the HttpServletRequest object
     * @param response the HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the correct JSP page
        request.getRequestDispatcher("/WEB-INF/pages/password_reset.jsp").forward(request, response);
    }

    /**
     * Handles POST requests for password reset logic:
     * validates input, verifies current password, and updates it if valid.
     *
     * @param request  the HttpServletRequest object
     * @param response the HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
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
     // Validate new password format
        else if (!ValidationUtil.isValidPassword(newPassword)) {
            request.setAttribute("error", "weak_password");
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