package com.bagaicha.controller;

import java.io.IOException;

import com.bagaicha.model.UserModel;
import com.bagaicha.service.LoginService;
import com.bagaicha.util.CookieUtil;
import com.bagaicha.util.SessionUtil;
import com.bagaicha.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * LoginController is responsible for handling login requests.
 * It interacts with the LoginService to authenticate users and manages session/cookie logic.
 *  @author Jeshmin Shrestha
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginService loginService;
	/**
	 * Constructor initializes the LoginService.
	 */
	public LoginController() {
		this.loginService = new LoginService();
	}

	/**
	 * Handles GET requests to load the login page.
	 *
	 * @param request  the HttpServletRequest object containing the client request
	 * @param response the HttpServletResponse object for the servlet's response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an input or output error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for authenticating the user.
	 * Validates input, checks credentials, sets session attributes and cookies.
	 *
	 * @param req  the HttpServletRequest object containing login data
	 * @param resp the HttpServletResponse object for redirection
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an input or output error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String userName = req.getParameter("username");
	    String userPassword = req.getParameter("password");

	    if (!ValidationUtil.isNullOrEmpty(userName) && !ValidationUtil.isNullOrEmpty(userPassword)) {
	        UserModel userModel = new UserModel(userName, userPassword);
	        Boolean loginStatus = loginService.loginUser(userModel);

	        if (loginStatus != null && loginStatus) {
	            SessionUtil.setAttribute(req, "userName", userName);
	            if (userName.equals("admin")) {
	                SessionUtil.setAttribute(req, "role", "admin");
	                CookieUtil.addCookie(resp, "role", "admin", 30 * 30);//30 minutes
	                resp.sendRedirect(req.getContextPath() + "/dashboard");
	            } else {
	                SessionUtil.setAttribute(req, "role", "user");
	                CookieUtil.addCookie(resp, "role", "user", 30 * 30);
	                resp.sendRedirect(req.getContextPath() + "/userHome");
	            }
	        } else {
	            handleLoginFailure(req, resp, loginStatus);
	        }
	    } else {
	        handleLoginFailure(req, resp, false); // Handle missing credentials
	    }
	}


	/**
	 * Handles failed login attempts by setting error messages and forwarding back to login page.
	 *
	 * @param req         the HttpServletRequest object
	 * @param resp        the HttpServletResponse object
	 * @param loginStatus Boolean indicating login success or server issue (null)
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an input or output error occurs
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}

}