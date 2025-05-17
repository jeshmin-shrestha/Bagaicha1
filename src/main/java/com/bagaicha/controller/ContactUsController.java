package com.bagaicha.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contact")
public class ContactUsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get query params and pass them as request attributes
        String success = request.getParameter("success");
        String subscribed = request.getParameter("subscribed");

        request.setAttribute("success", success);
        request.setAttribute("subscribed", subscribed);

        // Forward to the actual JSP
        request.getRequestDispatcher("/WEB-INF/pages/contactUs.jsp").forward(request, response);
    }

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
