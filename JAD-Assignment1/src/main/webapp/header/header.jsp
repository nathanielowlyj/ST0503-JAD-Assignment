<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sidebar Navbar</title>
<link rel="stylesheet" href="/JAD-Assignment1/header/header.css">
</head>
<body>

<header>
<!-- Hamburger Menu Toggle -->
<div class="menu-toggle" id="menuToggle">
    <span></span><span></span><span></span>
</div>
<h1><img src="/JAD-Assignment1/img/logo.png" alt="Logo" style="width: 30px; height: 30px; padding-right: 10px; vertical-align: middle;">Bright Space</h1>
<!-- User Actions: Login/Register or Profile -->
<div class="user-actions" id="userActions">
<%
    // Check if user is logged in via session
    String userId = (String) session.getAttribute("id");
    String userRole = (String) session.getAttribute("role");
        
    if (userId != null && userRole != null) {
%>
        <a href="/JAD-Assignment1/profile.jsp">Profile</a>
        <a href="?action=logout" id="logout">Logout</a>
<%
    } else {
%>
        <a href="/JAD-Assignment1/login.jsp">Login</a>
        <a href="/JAD-Assignment1/register.jsp">Register</a>
<%
    }
%>
</div>
</header>

<!-- Sidebar Navbar -->
<div class="navbar" id="navbar">
	<div class="nav-content" id="nav-content">
	    <a href="/JAD-Assignment1/landing.jsp">Home</a>
	    <a href="/JAD-Assignment1/serviceCat.jsp">Services</a>
	    <%
	        if ("admin".equals(userRole)) {
	    %>
	            <a href='/JAD-Assignment1/adminServices.jsp'>Services (Admin)</a>
	            <a href='/JAD-Assignment1/adminBookingReports.jsp'>Booking Reports</a>
	    <%
	        } else if ("user".equals(userRole)) {
	    %>
	            <a href='/JAD-Assignment1/serviceBooking.jsp'>Bookings</a>
	    <%
	        }
	    %>
	</div>
	<div class="settings">
	    <a href="#">Settings</a>
	</div>
</div>
<%
    String action = request.getParameter("action");
    if ("logout".equals(action)) {
        if (session != null) {
            session.invalidate(); // Invalidate session
        }
        response.sendRedirect("/JAD-Assignment1/landing.jsp"); // Redirect to landing page
    }
%>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const menuToggle = document.getElementById('menuToggle');
        const navbar = document.getElementById('navbar');
        menuToggle.addEventListener('click', function () {
            navbar.classList.toggle('active');
        });
    });
</script>

</body>
</html>
