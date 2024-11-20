<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Categories</title>
<style>
	.grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 10px;
        margin: 20px;
    }
    .card {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
        background-color: #f9f9f9;
    }
    .error {
        color: red;
        font-weight: bold;
        margin: 20px;
    }
</style>
</head>
<body>
<%@ include file="header/header.html" %>

<h1>Service Categories</h1>

<div class="grid">
    <%
        // Database connection details for PostgreSQL
        String dbURL = "jdbc:postgresql://ep-wild-feather-a1euu27g.ap-southeast-1.aws.neon.tech/cleaningServices?user=cleaningServices_owner&password=mh0zgxauP6HJ&sslmode=require";
        String dbUser = "cleaningServices_owner";
        String dbPassword = "mh0zgxauP6HJ";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the PostgreSQL driver
            Class.forName("org.postgresql.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Query to retrieve service categories
            String sql = "SELECT id, name, description FROM service_category";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            // Display the service categories dynamically
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String categoryName = resultSet.getString("name");
                String description = resultSet.getString("description");
    %>
                <div class="card">
                    <h3><%= categoryName %></h3>
                    <p><%= description %></p>
                    <form action="serviceDetails.jsp" method="GET">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit">View Details</button>
                    </form>
                </div>
    <%
            }
        } catch (Exception e) {
            // Log the error for server-side debugging
            application.log("Error fetching service categories: " + e.getMessage());
    %>
        <div class="error">
            An error occurred while loading the service categories. Please try again later.
        </div>
    <%
        } finally {
            // Clean up resources
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
    %>
</div>

</body>
</html>

