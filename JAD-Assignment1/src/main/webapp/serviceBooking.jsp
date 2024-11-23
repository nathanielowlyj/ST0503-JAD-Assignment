<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking</title>
</head>
<style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            margin-top: 128px;
            width: 60%;
            height: 60%;
            display: flex;
            background-color: #00000022;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 10px; /* Added padding */
        }
        .details {
            width: 70%;
            background-color: #d1e7dd;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .checkout {
            width: 30%;
            background-color: #f8d7da;
            display: flex;
            flex-direction: column; /* Stack items vertically */
            align-items: center;
            padding: 10px; /* Added padding for the checkout container */
        }
        .box {
            width: 100%;
            height: 500px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 10px; /* Spacing between the box and the button */
        }
        .button {
            width: 100%;
            height: 25px;
            background-color: #4285F4;
            color: white;
            border: none;
            cursor: pointer;
            text-align: center;
            line-height: 25px; /* Center text vertically */
            border-radius: 4px; /* Slightly rounded corners */
            font-size: 14px;
        }
        footer {
            width: 100%;
        }
</style>
</head>
<body>
    <div class="container">
        <div class="details">Details 70%</div>
        <div class="checkout">
            <div class="box"></div>
            <button class="button">Checkout</button>
        </div>
    </div>
</body>
<%@ include file="header/header.jsp" %>
<%@ include file="footer.html" %>
</html>
