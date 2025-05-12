package com.bagaicha.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.bagaicha.util.CookieUtil;
import com.bagaicha.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

	private static final String LOGIN = "/login";
	private static final String REGISTER = "/register";
	private static final String ROOT = "/";
	private static final String DASHBOARD = "/dashboard";
	private static final String USER_UPDATE = "/userUpdate";
	private static final String ADMIN_PRODUCT = "/adminProduct";
	private static final String ABOUT = "/about";
	private static final String PROFILE = "/profile";
	private static final String CONTACT = "/contact";
	private static final String PRODUCT_LIST = "/productList";
	private static final String PRODUCT_EDIT = "/productEdit";
	private static final String USER_HOME = "/userHome";
	private static final String RESET_PASSWORD = "/passwordReset";
	private static final String USER_VIEW_PRODUCT = "/productView";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization logic, if required
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		
		// Allow access to resources
		if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")|| uri.endsWith("/logout")) {
			chain.doFilter(request, response);
			return;
		}
		if (uri.endsWith(".jsp")) {
		    chain.doFilter(request, response);
		    return;
		}
		boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
		String userRole = CookieUtil.getCookie(req, "role") != null ? CookieUtil.getCookie(req, "role").getValue()
				: null;
		// In your doFilter method, add this condition:
		if (uri.endsWith("/logout"))
				{
		    chain.doFilter(request, response);
		    return;
		}
		if ("admin".equals(userRole)) {
			// Admin is logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			} else if (uri.endsWith(DASHBOARD) || uri.endsWith(USER_UPDATE)|| uri.endsWith(PROFILE)|| uri.endsWith(USER_UPDATE)|| uri.endsWith(RESET_PASSWORD)
					|| uri.endsWith(ADMIN_PRODUCT) || uri.endsWith(PRODUCT_EDIT)
					|| uri.endsWith(ABOUT)  || uri.endsWith(ROOT)|| uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(CONTACT)) {
				chain.doFilter(request, response);
			} else if (uri.endsWith(PRODUCT_LIST)) {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			} else {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			}
		} else if ("user".equals(userRole)) {
			// User is logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + USER_HOME);
			} else if (uri.endsWith(USER_HOME) || uri.endsWith(ROOT) || uri.endsWith(ABOUT) || uri.endsWith(PROFILE)|| uri.endsWith(RESET_PASSWORD)
					|| uri.endsWith(CONTACT) || uri.endsWith(PRODUCT_LIST)|| uri.endsWith(USER_UPDATE) || uri.endsWith(USER_VIEW_PRODUCT)) {
				chain.doFilter(request, response);
			} else if (uri.endsWith(DASHBOARD) )
					 {
				res.sendRedirect(req.getContextPath() + USER_HOME);
			} else {
				res.sendRedirect(req.getContextPath() + USER_HOME);
			}
		} else {
			// Not logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)|| uri.endsWith(ROOT)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + LOGIN);
			}
		}
	}

	
}