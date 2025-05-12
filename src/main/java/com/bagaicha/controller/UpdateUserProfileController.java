package com.bagaicha.controller;

import java.io.IOException;
import java.util.Enumeration;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.UpdateProfileService;
import com.bagaicha.util.ValidationUtil;

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

		System.out.println("\n===== UPDATE PROFILE CONTROLLER START =====");
		System.out.println("Request parameters received:");
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String param = params.nextElement();
			System.out.println(param + ": " + request.getParameter(param));
		}

	
		// Get form parameters
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    String fullName = request.getParameter("fullName");
	    String userName = request.getParameter("username");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
		// === VALIDATION ===
	    if (ValidationUtil.isNullOrEmpty(fullName) || !ValidationUtil.isValidName(fullName)) {
	        response.sendRedirect("profile?error=invalid_fullname");
	        return;
	    }

	    if (ValidationUtil.isNullOrEmpty(userName) || !ValidationUtil.isAlphanumericStartingWithLetter(userName)) {
	        response.sendRedirect("profile?error=invalid_username");
	        return;
	    }

	    if (!ValidationUtil.isValidEmail(email)) {
	        response.sendRedirect("profile?error=invalid_email");
	        return;
	    }

	    if (!ValidationUtil.isValidPhoneNumber(phone)) {
	        response.sendRedirect("profile?error=invalid_phone");
	        return;
	    }

	    if (!ValidationUtil.isValidAddress(address)) {
	        response.sendRedirect("profile?error=invalid_address");
	        return;
	    }



		UserModel updatedUser = new UserModel();
		updatedUser.setUserId(userId); // from form, not session
		updatedUser.setFullName(request.getParameter("fullName"));
		updatedUser.setUserName(request.getParameter("username"));
		updatedUser.setUserEmail(request.getParameter("email"));
		updatedUser.setUserPhoneNo(request.getParameter("phone"));
		updatedUser.setUserAddress(request.getParameter("address"));
		

		System.out.println("\nUpdated user object:");
		System.out.println(updatedUser); // Make sure UserModel has toString()

		// Update in database
		UpdateProfileService userProfileService = new UpdateProfileService();
		boolean success = userProfileService.updateUserInfo(updatedUser);

		// Add this after successful update to ensure session is properly updated
		if (success) {
			System.out.println("SUCCESS: User updated in database");
			// Refresh all user data from database to ensure consistency
			response.sendRedirect("profile?success=true");

		} else {
			System.out.println("ERROR: Failed to update user in database");
			response.sendRedirect("profile?error=update_failed");
		}
		System.out.println("===== UPDATE PROFILE CONTROLLER ENDD =====\n");
	}
}