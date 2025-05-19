package com.bagaicha.controller;



import java.io.IOException;
import java.sql.SQLException;

import com.bagaicha.model.UserModel;



import com.bagaicha.service.RegisterService;

import com.bagaicha.util.ImageUtil;

import com.bagaicha.util.PasswordUtil;

import com.bagaicha.util.ValidationUtil;



import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.Part;



/**

 * RegisterController handles user registration requests and processes form

 * submissions. It also manages file uploads and account creation.
 * @author Jeshmin Shrestha

 */

@WebServlet(asyncSupported = true, urlPatterns = { "/register", "/"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB

		maxFileSize = 1024 * 1024 * 10, // 10MB

		maxRequestSize = 1024 * 1024 * 50) // 50MB

public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;



	private final ImageUtil imageUtil = new ImageUtil();

	private final RegisterService registerService = new RegisterService();



	@Override

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET called");
		req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);

	}



	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   

		try {

			// Validate and extract student model

			String validationMessage = validateRegistrationForm(req);
			System.out.println(validationMessage);
			

			if (validationMessage != null) {

				handleError(req, resp, validationMessage);

				return;

			}

		    


			UserModel userModel = extractUserModel(req);
			

			Boolean isAdded = registerService.addUser(userModel);



			if (isAdded == null) {

				handleError(req, resp, "Our server is under maintenance. Please try again later!");

			} else if (isAdded) {

				try {

					if (uploadImage(req)) {

						handleSuccess(req, resp, "Your account is successfully created!", "/WEB-INF/pages/login.jsp");

					} else {

						handleError(req, resp, "Could not upload the image. Please try again later!");

					}

				} catch (IOException | ServletException e) {

					handleError(req, resp, "An error occurred while uploading the image. Please try again later!");

					e.printStackTrace(); // Log the exception

				}

			} else {

				handleError(req, resp, "Could not register your account. Please try again later!");

			}

		} catch (Exception e) {

			handleError(req, resp, "An unexpected error occurred. Please try again later!");

			e.printStackTrace(); // Log the exception

		}

	}



	private String validateRegistrationForm(HttpServletRequest req) {



		String fullName = req.getParameter("fullName");

        String username = req.getParameter("userName");

        String email = req.getParameter("userEmail");

        String phone = req.getParameter("userPhoneNo");

        String password = req.getParameter("userPassword");

        String retypePassword = req.getParameter("retypePassword");

        String address = req.getParameter("userAddress");



        // Empty field checks
        if (ValidationUtil.isNullOrEmpty(fullName)) return "fullName is required.";

        if (ValidationUtil.isNullOrEmpty(username)) return "Username is required.";
        try {
            if (registerService.isUsernameTaken(username)) {
                return "Username is already taken.";
            }
        } catch (SQLException e) {
            return "Error checking username availability.";
        }
        try {
            if (registerService.isEmailTaken(email)) {
                return "Email is already taken.";
            }
        } catch (SQLException e) {
            return "Error checking Email availability.";
        }
        if (ValidationUtil.isNullOrEmpty(email)) return "Email is required.";

        if (ValidationUtil.isNullOrEmpty(phone)) return "Phone number is required.";

        if (ValidationUtil.isNullOrEmpty(password)) return "Password is required.";

        if (ValidationUtil.isNullOrEmpty(retypePassword)) return "Retyped password is required.";

        if (ValidationUtil.isNullOrEmpty(address)) return "Address is required.";



        // Pattern/format checks

        if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) return "Username must start with a letter and contain only letters and numbers.";

        if (!ValidationUtil.isValidEmail(email)) return "Invalid email format.";

        if (!ValidationUtil.isValidPhoneNumber(phone)) return "Phone number must be 10 digits and start with 98.";

        if (!ValidationUtil.isValidPassword(password)) return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";

        if (!ValidationUtil.doPasswordsMatch(password, retypePassword)) return "Passwords do not match.";



        try {

            Part image = req.getPart("image");
//          String imageName = imageUtil.getFileName(image);
//         user.setUserImage(imageName);

            if (image == null || image.getSize() == 0) {

                return "Profile image is required";

            }

            if (!ValidationUtil.isValidImageExtension(image)) {

                return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";

            }

        } catch (Exception e) {

            return "Error processing image upload";

        }



        return null; // All validations passed

    }


	public String getFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    for (String content : contentDisp.split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(content.indexOf("=") + 2, content.length() - 1);
	        }
	    }
	    return null;
	}


	private UserModel extractUserModel(HttpServletRequest req) throws Exception {

	    String fullName = req.getParameter("fullName");
	    String userName = req.getParameter("userName");
	    String userEmail = req.getParameter("userEmail");
	    String userPhoneNo = req.getParameter("userPhoneNo");
	    String userPassword = req.getParameter("userPassword");
	    String userAddress = req.getParameter("userAddress");
	    Part imagePart = req.getPart("image");
	    // Encrypt password
	    userPassword = PasswordUtil.encrypt(userName, userPassword);
	 // Extract image filename
	    String imageName = imageUtil.getImageNameFromPart(imagePart);
	    UserModel user = new UserModel();
	
	    user.setFullName(fullName);
	    user.setUserName(userName);
	    user.setUserEmail(userEmail);
	    user.setUserPhoneNo(userPhoneNo);
	    user.setUserPassword(userPassword);  // Store encrypted password
	    user.setUserRole("customer"); // default role, can be changed later as needed
	    user.setUserAddress(userAddress);
	    user.setImage(imageName); // Set the image filename
	    return user;
	    
	   
	}



	



	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {

		Part image = req.getPart("image");

		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "user");

	}



	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)

			throws ServletException, IOException {

		req.getSession().setAttribute("success", "Registration successful! Please log in");

	    resp.sendRedirect(req.getContextPath() + "/login"); // Redirect to home page

	}



	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)

            throws ServletException, IOException {

        req.setAttribute("error", message);

        req.setAttribute("fullName", req.getParameter("fullName"));

        req.setAttribute("userName", req.getParameter("userName"));

        req.setAttribute("userEmail", req.getParameter("userEmail"));

        req.setAttribute("userPhoneNo", req.getParameter("userPhoneNo"));

        req.setAttribute("userAddress", req.getParameter("userAddress"));

        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);

        

    }

}