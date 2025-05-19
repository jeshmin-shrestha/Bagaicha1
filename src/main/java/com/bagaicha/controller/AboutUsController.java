package com.bagaicha.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class AboutUsController
 * Handles GET requests for the About Us page and forwards the user to the corresponding JSP view.
 *  @author Jeshmin Shrestha
 */
@WebServlet("/about")
public class AboutUsController extends HttpServlet {
	/**
     * Handles GET requests by forwarding the user to the About Us JSP page.
     *
     * @param request  the HttpServletRequest object that contains the request the client made to the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs during request forwarding
     */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/about_us.jsp").forward(request, response);
    }
}