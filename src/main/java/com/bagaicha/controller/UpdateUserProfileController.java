package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.UpdateProfileService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/userUpdate")
public class UpdateUserProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve updated user data from the request
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        // Assume logged-in user is available in session
        UserModel loggedInUser = (UserModel) request.getSession().getAttribute("loggedInUser");

        // Update the user model with new values
        loggedInUser.setFullName(fullName);
        loggedInUser.setUserEmail(email);
        loggedInUser.setUserName(username);
        loggedInUser.setUserAddress(address);
        loggedInUser.setUserPhoneNo(phone);

        // Call the service to update user profile
        UpdateProfileService userProfileService = new UpdateProfileService();
        boolean success = userProfileService.updateUserInfo(loggedInUser);

        // Redirect to profile page with success/failure feedback
        if (success) {
            response.sendRedirect("profile?success=true");
        } else {
            response.sendRedirect("profile?success=false");
        }
    }
}
