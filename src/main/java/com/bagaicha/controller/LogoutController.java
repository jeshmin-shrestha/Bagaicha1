package com.bagaicha.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bagaicha.util.CookieUtil;
import com.bagaicha.util.SessionUtil;
/**
 * LogoutController handles user logout by invalidating the session,
 * removing cookies, and redirecting the user to the login page.
 *  @author Jeshmin Shrestha
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Handles GET requests for logout, typically from navigation links.
     *
     * @param request  the HttpServletRequest object
     * @param response the HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an input or output error is detected
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle GET requests (from links)
        performLogout(request, response);
    }
    /**
     * Handles POST requests for logout, typically from form submissions.
     *
     * @param request  the HttpServletRequest object
     * @param response the HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an input or output error is detected
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle POST requests (from forms)
        performLogout(request, response);
    }
    /**
     * Performs the logout logic by invalidating the session, clearing cookies,
     * and redirecting the user to the login page.
     *
     * @param request  the HttpServletRequest object
     * @param response the HttpServletResponse object
     * @throws IOException if redirection fails
     */
    private void performLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        // Clear session
        SessionUtil.invalidateSession(request);
        
        // Clear cookies
        CookieUtil.deleteCookie(response, "role");
        CookieUtil.deleteCookie(response, "username");
        
        // Redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
    }
}