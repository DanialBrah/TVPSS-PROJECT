<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TV PSS - School Resource Centre TV Management System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            height: 100vh;
            background-color: #ffffff; /* Background color remains white */
            position: relative;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            background-color: #003366;
            color: white;
            position: fixed;
            height: 100%;
            padding: 20px;
            box-sizing: border-box;
        }

        .sidebar h1 {
            margin: 20;
            font-size: 30px;
            writing-mode: vertical-rl;
            text-orientation: mixed;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative; /* Allows proper positioning of the image */
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header-img {
            width: 100px;
            height: auto;
            display: block;
            margin: 0 auto 10px;
        }

        .header h1 {
            font-size: 24px;
            color: #333;
        }

        /* Content Image */
        .content img {
            position: absolute;
            bottom: 0px; /* Adjust to move image closer to the bottom */
            left: 250px; /* Adjust to move image closer to the left */
            max-width: 300px;
            height: auto;
            opacity: 0.8; /* Slightly transparent for a cleaner look */
            z-index: -1; /* Pushes the image behind other content */
        }

        /* Login Box */
        .login-box {
            background: linear-gradient(145deg, #ffffff, #f0f0f0);
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 95%;
            max-width: 400px;
            text-align: center;
            margin-left: 50px;
        }

        .login-box form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        .login-box input[type="text"]:focus,
        .login-box input[type="password"]:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .login-box input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .login-box input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .guest-link {
            margin-top: 10px;
        }

        .guest-link a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }

        .guest-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar">
        <h1>TV PSS Management Information System</h1>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <img src="images/jata.png" alt="Logo" class="header-img">
            <h1>TV PSS - School Resource Centre TV Management Information System</h1>
        </div>
        <div class="content">
            <img src="images/content.png" alt="Content Image">
        </div>
        <!-- Login Box -->
        <div class="login-box">
            <form method="post" action="version.jsp">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="submit" value="Login">
            </form>

            <!-- Continue as Guest Link -->
            <div class="guest-link">
                <a href="version.jsp">Continue as Guest</a>
            </div>
        </div>
    </div>
</body>
</html>
