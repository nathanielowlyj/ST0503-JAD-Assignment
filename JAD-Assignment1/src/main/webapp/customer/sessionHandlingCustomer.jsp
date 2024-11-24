<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userID = (String) session.getAttribute("id");
	String userRole = (String) session.getAttribute("role");
    if (userID == null || !userRole.equals("customer")) {
%>
    <script>
        alert("You are not authorized to access this page. Redirecting to login...");
        window.location.href = "../login.jsp"; 
    </script>
<%
        return; 
    }
%>
