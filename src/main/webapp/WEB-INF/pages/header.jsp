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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
           font-family: 'Poppins', sans-serif;
        }
        
        body {
            padding-top: 100px; /* Add space for fixed header */
            background-color: #f5f5f5;
        }
        
        header {
            position: fixed;
            top: 0;
             
            left: 0;
            right: 0;
            height: 120px;
            margin: 10px;
            padding: 0 20px;
            background: #C3CDB2;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 30px;
            z-index: 1000;
        }
        
        .header-logo {
    margin-left: 6px;
    padding: 0;
    border-radius: 24px;
    height: 150px;
    width: auto;
}
        
        .navigation {
            display: flex;
            align-items: center;
            gap: 20px;
           
        }
        
        .navigation a {
            position: relative;
            font-size: 25px;
            color: black;
            font-weight: 400;
            text-decoration: none;
            color:#2c6e49;
            font-family: ''Roboto Slab', serif;
            
        }
        .navigation a :hover {
    color: #ffc107; /* Gold color on hover */
      transform: scale(1.15);}
        .navigation a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 100%;
            height: 3px;
            background: #6c593d;
            border-radius: 5px;
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }
        
        
        .logout {
            width: 120px;
            height: 50px;
            background: transparent;
            border: 2px solid #6c593d;
            outline: none;
            border-radius: 6px;
            font-size: 1em;
            color: #6c593d;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .logout:hover {
            background: #6c593d;
            color: white;
        }
        
       
        
        
        
        .hamburger {
    display: none;
    flex-direction: column;
    cursor: pointer;
    gap: 5px;
}

.hamburger .bar {
    width: 25px;
    height: 3px;
    background-color: #2c6e49;
    transition: all 0.3s ease;
    border-radius: 2px;
}
.nav-icon {
    width: 45px;
    height: 45px;
    transition: transform 0.3s ease;
    
}

.nav-icon:hover {
   transform: scale(1.2);
}

/* Mobile view styles */
@media (max-width: 992px) {
    .hamburger {
        display: flex;
    }

    .navigation {
        position: absolute;
        top: 120px; /* Adjusted to match header height */
        right: 20px;
        background-color: #D9D9D9;
        flex-direction: column;
        align-items: center; /* Changed from flex-start to center */
        padding: 20px;
        border-radius: 10px;
        gap: 15px;
        display: none;
        z-index: 999;
        width: 150px; /* Fixed width for better appearance */
        box-shadow: 0 5px 15px rgba(0,0,0,0.1); /* Added shadow for better visibility */
    }

    .navigation.show {
        display: flex;
    }

    .navigation a {
        font-size: 18px; /* Slightly smaller font for mobile */
        width: 100%;
        text-align: center; /* Center align text */
        padding: 8px 0; /* Add some vertical padding */
    }

    .logout {
        width: 100%;
        justify-content: center; /* Center the logout button */
        height: 45px; /* Slightly smaller height */
        font-size: 0.9em;
    }

    .nav-icon {
        width: 40px; /* Slightly smaller icons for mobile */
        height: 40px;
    }
}

    </style>
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