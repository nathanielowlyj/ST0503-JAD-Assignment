<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Services and Categories</title>
    <style>
	    body {
	        font-family: Arial, sans-serif;
	        text-align: center; /* Centers text elements on the page */
	    }
	
	    table {
	        width: 80%;
	        border-collapse: collapse;
	        margin: 20px auto; /* Centers the table horizontally */
	    }
	
	    table th, table td {
	        border: 1px solid #ddd;
	        padding: 10px;
	        text-align: left;
	    }
	
	    table th {
	        background-color: #f4f4f4;
	    }
	
	    .pagination {
	        margin: 20px 0;
	        display: flex;
	        justify-content: center; 
	        gap: 10px; 
	    }
	
	    .pagination a {
	        padding: 5px 10px;
	        border: 1px solid #ddd;
	        text-decoration: none;
	        color: #007bff;
	    }
	
	    .pagination a.active {
	        font-weight: bold;
	        background-color: #f4f4f4;
	    }
	
	    .pagination a:hover {
	        background-color: #007bff;
	        color: white;
	    }
	
	    h1 {
	        text-align: center; /* Centers the headings */
	    }
	
	    .services {
	        text-align: center; /* Centers the pagination below the services table */
	    }
	</style>

</head>
<body>
<%@ include file="../header/header.jsp" %>
<h1 style="margin-top:80px">Manage Services and Categories</h1>

<%
    int servicePage = request.getParameter("servicePage") != null ? Integer.parseInt(request.getParameter("servicePage")) : 1;
    int categoryPage = request.getParameter("categoryPage") != null ? Integer.parseInt(request.getParameter("categoryPage")) : 1;
    int pageSize = 5; // Number of rows per page, can be changed
    int serviceOffset = (servicePage - 1) * pageSize;
    int categoryOffset = (categoryPage - 1) * pageSize;

    // Database connection details for PostgreSQL
    String dbURL = "jdbc:postgresql://ep-wild-feather-a1euu27g.ap-southeast-1.aws.neon.tech/cleaningServices?sslmode=require";
    String dbUser = "cleaningServices_owner";
    String dbPassword = "mh0zgxauP6HJ";

    Connection connection = null;
    Statement serviceStmt = null;
    Statement categoryStmt = null;
    ResultSet serviceResultSet = null;
    ResultSet categoryResultSet = null;

    try {
        // Open a single connection for both services and categories
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Query for services with pagination
        String serviceSql = "SELECT * FROM service LIMIT " + pageSize + " OFFSET " + serviceOffset;
        serviceStmt = connection.createStatement();
        serviceResultSet = serviceStmt.executeQuery(serviceSql);
%>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            while (serviceResultSet.next()) {
                int id = serviceResultSet.getInt("id");
                String name = serviceResultSet.getString("name");
                String description = serviceResultSet.getString("description");
                double price = serviceResultSet.getDouble("price");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= description %></td>
            <td><%= price %></td>
            <td>
                <form action="editServices.jsp" method="GET" style="display:inline;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Edit</button>
                </form>
                <form action="deleteServices.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<div style="margin: 20px;">
    <form action="addService.jsp" method="GET" style="display:inline;">
        <button type="submit" style="padding: 10px 20px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
            Create New Service
        </button>
    </form>
</div>

<div class="pagination">
    <%
        // Pagination for services
        serviceResultSet = serviceStmt.executeQuery("SELECT COUNT(*) AS total FROM service");
        serviceResultSet.next();
        int totalServices = serviceResultSet.getInt("total");
        int totalServicePages = (int) Math.ceil((double) totalServices / pageSize);

        for (int i = 1; i <= totalServicePages; i++) {
    %>
        <a href="?servicePage=<%= i %>&categoryPage=<%= categoryPage %>" class="<%= (i == servicePage) ? "active" : "" %>"><%= i %></a>
    <%
        }
    %>
</div>
<%
        String categorySql = "SELECT * FROM service_category LIMIT " + pageSize + " OFFSET " + categoryOffset;
        categoryStmt = connection.createStatement();
        categoryResultSet = categoryStmt.executeQuery(categorySql);
%>

<h1>Service Categories</h1>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            while (categoryResultSet.next()) {
                int id = categoryResultSet.getInt("id");
                String name = categoryResultSet.getString("name");
                String description = categoryResultSet.getString("description");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= description %></td>
            <td>
                <form action="editCategory.jsp" method="GET" style="display:inline;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Edit</button>
                </form>
                <form action="deleteCategory.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<%= id %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<div style="margin: 20px;">
    <form action="addCategory.jsp" method="GET" style="display:inline;">
        <button type="submit" style="padding: 10px 20px; background-color: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer;">
            Create New Category
        </button>
    </form>
</div>

<div class="pagination">
    <%
        // Pagination for categories
        categoryResultSet = categoryStmt.executeQuery("SELECT COUNT(*) AS total FROM service_category");
        categoryResultSet.next();
        int totalCategories = categoryResultSet.getInt("total");
        int totalCategoryPages = (int) Math.ceil((double) totalCategories / pageSize);

        for (int i = 1; i <= totalCategoryPages; i++) {
    %>
        <a href="?servicePage=<%= servicePage %>&categoryPage=<%= i %>" class="<%= (i == categoryPage) ? "active" : "" %>"><%= i %></a>
    <%
        }
    %>
</div>

<%
    } catch (Exception e) {
        application.log("Error: " + e.getMessage());
%>
<p style="color:red;">An error occurred while fetching the data.</p>
<%
    } finally {
        // Close all resources
        if (serviceResultSet != null) try { serviceResultSet.close(); } catch (SQLException ignore) {}
        if (categoryResultSet != null) try { categoryResultSet.close(); } catch (SQLException ignore) {}
        if (serviceStmt != null) try { serviceStmt.close(); } catch (SQLException ignore) {}
        if (categoryStmt != null) try { categoryStmt.close(); } catch (SQLException ignore) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
    }
%>
<%@ include file="../footer.html" %>
</body>
</html>
