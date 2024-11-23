<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- Content will be dynamically updated -->
  </div>
</header>

<!-- Sidebar Navbar -->
<div class="navbar" id="navbar">
  <div class="nav-content">
    <a href="/JAD-Assignment1/landing.jsp">Home</a>
    <a href="#">About</a>
    <a href="/JAD-Assignment1/serviceCat.jsp">Services</a>
    <a href="#">Contact</a>
  </div>
  <!-- Settings Link -->
  <div class="settings">
    <a href="#">Settings</a>
  </div>
</div>
<%
    String userId = (String) session.getAttribute("id");
    String userRole = (String) session.getAttribute("role");

    // Set cookies with session data
    if (userId != null) {
        Cookie userIdCookie = new Cookie("userId", userId);
        userIdCookie.setMaxAge(60 * 60 * 24); // Cookie expires in 1 day
        response.addCookie(userIdCookie);
    }

    if (userRole != null) {
        Cookie userRoleCookie = new Cookie("userRole", userRole);
        userRoleCookie.setMaxAge(60 * 60 * 24);
        response.addCookie(userRoleCookie);
    }
%>
<script src="/JAD-Assignment1/header/header.js"></script>
</body>
</html>

