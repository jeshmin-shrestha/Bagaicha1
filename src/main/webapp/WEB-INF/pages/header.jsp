<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%><!DOCTYPE html>
<%
    String role = null;
    if (request.getCookies() != null) {
        for (jakarta.servlet.http.Cookie cookie : request.getCookies()) {
            if ("role".equals(cookie.getName())) {
                role = cookie.getValue();
                break;
            }
        }
    }
%><%
    request.setAttribute("role", role);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
           <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    

</head>
<body>
    <header>
        <a href="#"><img src="resources/images/system/logo1.png" class="header-logo" alt="logo"></a>
        <div class="hamburger" onclick="toggleMenu()">
    <div class="bar"></div>
    <div class="bar"></div>
    <div class="bar"></div>
</div>
        
        <nav class="navigation">
   <a href="/Bagaicha/home">Home</a>
<c:choose>
    <c:when test="${role == 'admin'}">
        <a href="${pageContext.request.contextPath}/adminProduct">Plant</a>
    </c:when>
    <c:when test="${role == 'user'}">
        <a href="${pageContext.request.contextPath}/productList">Plant</a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/home">Plant</a>
    </c:otherwise>
</c:choose><a href="/Bagaicha/about">About Us</a>
  <!-- Changed link -->
<a href="/Bagaicha/contact">Contact Us</a>
<a href="${pageContext.request.contextPath}/profile"><img src="resources/images/system/user_icon.png" class="nav-icon" alt="Profile"></a>
    
<a href="${pageContext.request.contextPath}/logout"
   onclick="return confirm('Do you really want to logout?');">
    <img src="resources/images/system/logout_icon.png" class="nav-icon" alt="logout">
</a>
        </nav>
    </header>
    
    <!-- Your page content here -->
    <script>
    function toggleMenu() {
        const nav = document.querySelector('.navigation');
        nav.classList.toggle('show');
    }
</script>
    
</body>
</html>