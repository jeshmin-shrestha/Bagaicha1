<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard | Bagaicha</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin_dashboard.css" />

</head>
<body>
	<%
	String role = (String) session.getAttribute("role");
	if (role == null || !role.equals("admin")) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<!-- Header -->
	<jsp:include page="header.jsp" />
	<div class="header-space"></div>

	<!-- Welcome Section -->

	<div class="welcome-section container">
		<div class="welcome-content">
			<h1>Welcome Back, ${sessionScope.userName}!</h1>
			<p>Let's make your plants thrive!</p>
		</div>
		<img src="resources/images/system/robot_icon.png"
			alt="Plant Care Assistant" class="bot-icon">
	</div>

	<!-- Main Content -->
	<div class="container">
		<!-- Stats Section -->
		<section class="stats-section">
			<h2 class="section-title">Dashboard Overview</h2>
			<div class="stats-grid">
				<!-- Total Plants -->
				<div class="stat-card">
					<div class="stat-icon">
						<img src="resources/images/system/plants4.png" alt="Plants Icon">
					</div>
					<div class="stat-content">
						<h3>Total Plants</h3>
						<div class="value">${totalPlants}</div>
					</div>
				</div>

				<!-- Total Users -->
				<div class="stat-card">
					<div class="stat-icon">
						<img src="resources/images/system/newusers2.png" alt="Users Icon">
					</div>
					<div class="stat-content">
						<h3>Total Users</h3>
						<div class="value">${totalUsers}</div>
					</div>
				</div>



				<!-- Categories -->
				<div class="stat-card">
					<div class="stat-icon">
						<img src="resources/images/system/categoryplantss.png"
							alt="Categories Icon">
					</div>
					<div class="stat-content">
						<h3>Plant Categories</h3>
						<div class="value">${totalCategories}</div>
					</div>

				</div>
			</div>
		</section>

		<!-- Recent Activity Section -->
		<section class="recent-section">
			<h2 class="section-title">Recent Activity</h2>
			<div class="recent-grid">
				<!-- Recently Added Plants -->
				<div class="recent-card">
					<h3>New Plants Added</h3>
					<ul class="recent-list">
						<c:forEach var="plant" items="${recentPlants}">
							<c:if test="${empty recentPlants}">
								<p>No recent plants found.</p>
							</c:if>

							<li class="recent-item">
								<div class="recent-item-info">
									<h4>${plant}</h4>
								</div>
							</li>
						</c:forEach>
					</ul>
					<a href="${pageContext.request.contextPath}/adminProduct"
						class="action-btn">View All Plants</a>
				</div>

				<!-- New User Registrations -->
				<div class="recent-card">
					<h3>New User Signups</h3>
					<ul class="recent-list">
						<c:forEach var="user" items="${recentUsers}">
							<li class="recent-item">
								<div class="recent-item-info">
									<c:if test="${empty recentUsers}">
										<p>No recent users found.</p>
									</c:if>
									<h4>${user}</h4>
								</div>
							</li>
						</c:forEach>
					</ul>

					<a href="${pageContext.request.contextPath}/adminProduct"
						class="action-btn">View All User</a>
				</div>
				<!-- Top Categories Card -->
				<div class="recent-card">


					<h3>Top Categories</h3>
					<div class="category-list">
						<c:forEach var="category" items="${topCategories}">
							<div class="category-item">
								<span class="category-name">${category.name}</span> <span
									class="category-count">${category.count} plants</span>
							</div>
						</c:forEach>
						<c:if test="${empty topCategories}">
							<p>No category data available</p>
						</c:if>
					</div>

				</div>
			</div>

		</section>

	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

</body>
</html>