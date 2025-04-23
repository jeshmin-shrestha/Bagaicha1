package com.bagaicha.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bagaicha.util.CookieUtil;
import com.bagaicha.util.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle GET requests (from links)
        performLogout(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle POST requests (from forms)
        performLogout(request, response);
    }

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