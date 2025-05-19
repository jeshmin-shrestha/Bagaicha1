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
/**
 * Servlet implementation class UpdateUserProfileController
 * 
 * Handles POST requests to update the user profile information.
 * It validates input parameters from the request, constructs a UserModel object,
 * and calls the service layer to update the user data in the database.
 * Depending on success or failure, redirects to the profile page with appropriate status messages.
 * @author Jeshmin Shrestha
 * 
 */
@WebServlet("/userUpdate")
public class UpdateUserProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Handles HTTP POST request to update user profile.
	 * 
	 * Validates the input parameters from the form. If any validation fails, 
	 * redirects back to the profile page with an error message.
	 * If validation passes, creates a UserModel object and calls UpdateProfileService
	 * to update the user in the database.
	 * 
	 * @param request HttpServletRequest containing form data parameters
	 * @param response HttpServletResponse used to redirect to profile page with status
	 * @throws ServletException if servlet-specific error occurs
	 * @throws IOException if an I/O error occurs during request handling
	 */
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