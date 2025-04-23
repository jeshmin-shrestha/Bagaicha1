package com.bagaicha.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Jeshmin Shrestha
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/userHome"})
public class UserHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    String userName = (String) request.getSession().getAttribute("userName");
	    if (userName == null) {
	        userName = (String) request.getSession().getAttribute("username"); // fix typo if needed
	    }
	    request.setAttribute("userName", userName);

	    request.getRequestDispatcher("/WEB-INF/pages/user_homepage.jsp").forward(request, response);
	}

}