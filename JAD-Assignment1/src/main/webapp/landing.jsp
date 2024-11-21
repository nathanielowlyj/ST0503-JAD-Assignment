<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sessUserId = (String) session.getAttribute("id");
	String sessUserRole = (String) session.getAttribute("role");
    	System.out.println( "User ID: " + sessUserId + "\nUser Role: " + sessUserRole );
	%>
<%@ include file="header/header.html" %>
<%@ include file="footer.html" %>
</body>
</html>