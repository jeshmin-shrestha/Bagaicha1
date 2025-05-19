package com.bagaicha.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * ContactUsController handles GET and POST requests for the Contact Us page.
 * 
 * GET requests load the contact page with optional success or subscription status.
 * POST requests handle either message form submissions or email subscriptions.
 *  @author Jeshmin Shrestha
 */

@WebServlet("/contact")
public class ContactUsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Handles GET requests by forwarding the request to the contact_us.jsp page.
     * Optionally includes query parameters for success messages.
     *
     * @param request  the HttpServletRequest object that contains the request the client made to the servlet
     * @param response the HttpServletResponse object that contains the response the servlet sends to the client
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs during request forwarding
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get query params and pass them as request attributes
        String success = request.getParameter("success");
        String subscribed = request.getParameter("subscribed");

        request.setAttribute("success", success);
        request.setAttribute("subscribed", subscribed);

        // Forward to the actual JSP
        request.getRequestDispatcher("/WEB-INF/pages/contact_us.jsp").forward(request, response);
    }
    /**
     * Handles POST requests for form submissions on the contact page.
     * Determines if the submission is a message or a subscription based on the formType parameter.
     *
     * @param request  the HttpServletRequest object that contains the form data submitted by the client
     * @param response the HttpServletResponse object used to redirect the client based on form type
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs during redirection
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String formType = request.getParameter("formType");

        if ("message".equals(formType)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String message = request.getParameter("message");

            // TODO: Save to DB or send email
            System.out.println("Message received from: " + name + ", " + email + ", " + phone);
            System.out.println("Message: " + message);

            response.sendRedirect(request.getContextPath() + "/contact?success=1");

        } else if ("subscribe".equals(formType)) {
            String email = request.getParameter("email");

            // TODO: Save to subscriber DB
            System.out.println("Subscribed: " + email);

            response.sendRedirect(request.getContextPath() + "/contact?subscribed=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/contact");
        }
    }
}
