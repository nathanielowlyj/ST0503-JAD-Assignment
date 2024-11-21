<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Details</title>
<style>
    .grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Adjusts column width based on screen size */
        gap: 20px;
        justify-content: center;
        margin: 20px;
    }

    .card {
        position: relative;
        width: 100%; /* Full width of grid column */
        padding-bottom: 133.33%; /* Enforces 3:4 aspect ratio */
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        overflow: hidden;
        background-size: cover; /* Ensures background image fills card */
        background-position: center; /* Centers background image */
    }
    
    .card::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5); /* Semi-transparent black overlay */
        z-index: 0;
    }
    
    .card h3, .card p {
        position: absolute;
        z-index: 1;
        color: white;
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.7); /* Enhances text readability */
        text-align: center;
        width: 100%;
    }
    
    .card h3 {
        top: 30%;
        font-size: 24px;
    }
    
    .card p {
        bottom: 40%;
        font-size: 16px;
    }
    
    .card .button-wrapper {
        position: absolute;
        bottom: 20%;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100px; /* Fixed width for the wrapper */
        height: 40px; /* Fixed height for the wrapper */
    }
    
    .card button {
        width: 100%; /* Full width of the wrapper */
        height: 100%; /* Full height of the wrapper */
        padding: 10px 30px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        text-transform: uppercase;
        z-index: 1;
    }
    
    .card button:hover {
        background-color: #0056b3;
        transform: scale(1.1);
    }

    .error {
        color: red;
        font-weight: bold;
        margin: 20px;
    }
    
    .popup-button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #28a745;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        text-transform: uppercase;
    }
    
    .popup-button:hover {
        background-color: #218838;
        transform: scale(1.1);
    }
    
    /* Dark background overlay for popup */
    .pop-up-container {
        display: none; /* Hidden by default */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7); /* Dark background with transparency */
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }
    
    /* Dark background overlay for popup */
    .pop-up-container {
        display: none; /* Hidden by default */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7); /* Dark background with transparency */
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }

    /* Popup content style */
    .pop-up-content {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        text-align: center;
        width: 50%;
        box-sizing: border-box;
        position: relative; /* Ensures content is relative for positioning inside */
        z-index: 1010; /* Ensure this content appears above the background overlay */
    }

    /* Close button style inside the popup */
    .pop-up-close {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 24px;
        color: #000;
        cursor: pointer;
        z-index: 1020; /* Ensure it's above other content */
    }

    /* Booking button */
    .booking-button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: white;
        font-size: 16px;
        cursor: pointer;
        text-transform: uppercase;
        margin-top: 20px;
    }

    .booking-button:hover {
        background-color: #0056b3;
    }

</style>
</head>
<body>
<%@ include file="header/header.html" %>
<div class="grid" style="margin-top: 40px;">
    <%
        String serviceId = request.getParameter("id");
        String dbURL = "jdbc:postgresql://ep-wild-feather-a1euu27g.ap-southeast-1.aws.neon.tech/cleaningServices?sslmode=require";
        String dbUser = "cleaningServices_owner";
        String dbPassword = "mh0zgxauP6HJ";

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String sql = "SELECT * FROM service WHERE category_id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(serviceId)); 
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String serviceName = resultSet.getString("name");
                String description = resultSet.getString("description");
                String imagePath = resultSet.getString("img_path");
                double price = resultSet.getDouble("price");
    %>
            <div class="card" style="background-image: url('<%= imagePath %>');">
                <h3><%= serviceName %></h3>
                <p>Price: $<%= price %></p>
                <div class="hidden-description" style="display: none;"><%= description %></div>
                <div class="button-wrapper">
                    <form action="serviceDetails.jsp" method="GET">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="popup-button">View Details</button>
                    </form>
                </div>
            </div>
    <%
            }
        } catch (Exception e) {
            // Display user-friendly error and log server-side issues
            application.log("Error fetching services: " + e.getMessage());
    %>
        <div class="error">
            An error occurred while loading the services. Please try again later.
        </div>
    <%
        } finally {
            // Ensure database resources are released
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
            if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
    %>
</div>

<!-- Popup -->
<div id="popup" class="pop-up-container">
    <div class="pop-up-content">
        <span class="pop-up-close" onclick="closePopup()">&times;</span>
        <h3 id="popup-name">Service Name</h3>
        <p id="popup-description">Description of the service goes here.</p>
        <p>Price: $<span id="popup-price"></span></p>
        <button class="booking-button" onclick="bookService()">Book Now</button>
    </div>
</div>

<script>
    // Function to show the popup
    function showPopup(serviceName, description, price) {
        // Fill the popup with the specific data
        document.getElementById('popup-name').textContent = serviceName;
        document.getElementById('popup-description').textContent = description;
        document.getElementById('popup-price').textContent = price;

        // Show the popup
        document.getElementById("popup").style.display = "flex";
    }

    // Function to close the popup
    function closePopup() {
        document.getElementById("popup").style.display = "none"; // Hide popup
    }

    // Example of triggering the popup from a button
    document.querySelectorAll('.popup-button').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            // Get the values from the specific card
            const serviceName = button.closest('.card').querySelector('h3').textContent;
            const description = button.closest('.card').querySelector('.hidden-description').textContent; 
            const price = button.closest('.card').querySelector('p').textContent.split('$')[1];
            
            // Call showPopup function with values
            showPopup(serviceName, description, price);
        });
    });

    function bookService() {
        // Placeholder for booking logic
        alert('Service booked!');
    }
</script>
</body>
</html>
