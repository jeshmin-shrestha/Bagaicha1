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

@WebServlet("/profile")
public class UserProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user"); // Get full user object
        
        if (user == null) {
            // If user not in session, try to get from DB using username
            String username = (String) session.getAttribute("userName");
            if (username != null) {
                LoginService loginService = new LoginService();
                user = loginService.getUserDetails(username);
            }
        }

        if (user != null) {
            request.setAttribute("user", user); // Make available to JSP
            System.out.println("DEBUG - User data: " + user); // Log for debugging
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

        PasswordResetService userService = new PasswordResetService(); // Renamed to UserService for clarity
        boolean success = userService.updateUser(updatedUser);

        if (success) {
            session.setAttribute("user", updatedUser); // update session
            response.sendRedirect("profile?updated=true"); // Redirect to profile page with success message
        } else {
            request.setAttribute("error", "Failed to update profile.");
            request.getRequestDispatcher("WEB-INF/pages/user_profile.jsp").forward(request, response); // Forward to the correct page
        }
    }
}
