<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('img/kitchen-background.jpg') no-repeat center center;
            background-size: cover;
            backdrop-filter: blur(3px);
        }
        .register-container {
            width: 300px;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(20px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.4);
            border-radius: 8px;
            text-align: center;
            position: relative;
        }
        .register-container h2 {
            color: #fefefe;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .register-button {
            width: 100%;
            padding: 10px;
            background-color: #4285F4;
            border: none;
            color: white;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .register-button:hover {
            background-color: #357ae8;
        }
        .login-link {
            padding-top: 10px;
            width: 100%;
            text-align: left;
            margin: 0 auto;
            display: block;
            color: #00BFFF;
            text-decoration: none;
        }
        .login-link:hover {
            text-decoration: underline;
        }
        .back-button {
            position: absolute; 
            top: 17px; 
            left: 17px; 
            color: #000000ee;
            text-decoration: none;
            font-size: 12px;
            cursor: pointer;
            transition: transform 0.1s ease; 
        }
        .back-button:hover {
            transform: scale(1.075); 
        }
    </style>
</head>
<body>
    <div class="register-container">
        <a href="landing.jsp" class="back-button">&lt; Back</a> 
        <h2>Register</h2>
        <form action="RegisterServlet" method="post">
            <input type="text" name="username" class="input-field" placeholder="Username" required><br>
            <input type="email" name="email" class="input-field" placeholder="Email" required><br>
            <input type="password" name="password" class="input-field" placeholder="Password" required><br>
            <button type="submit" class="register-button">Register</button>
            <a href="login.jsp" class="login-link">login</a>
        </form>
    </div>
</body>
</html>
