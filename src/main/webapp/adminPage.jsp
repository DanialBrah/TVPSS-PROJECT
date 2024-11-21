<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/validate.css">
    <title>Admin Dashboard - TV PSS Management Information System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .nav-links {
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        .nav-links li {
            margin: 15px 0;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            display: block;
            text-align: center;
            padding: 10px;
            background-color: #0056b3;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .nav-links a:hover {
            background-color: #007BFF;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 270px;
            padding: 20px;
        }

        .main-content h1 {
            color: black;
        }

        .main-content p {
            color: blue;
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: flex;
            gap: 20px;
        }

        .dashboard-card {
            flex: 1;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: transform 0.2s ease-in-out;
            text-decoration: none; /* Remove underline from links */
            color: inherit; /* Inherit text color */
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            background-color: #f5f5f5;
        }

        .dashboard-card h2 {
            font-size: 20px;
            color: #004A9F;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            font-size: 30px;
            color: #333;
            font-weight: bold;
        }
    </style>
</head>
<body>
  <div class="sidebar">
		<div class="header-container">
			<img src="images/jata.png" alt="Logo" class="sidebar-logo">
			<div class="header-text">
				<h1>TV PSS</h1>
				<h6>
					Management <br> Information System
				</h6>
			</div>
		</div>
		<ul>
			<li>Dashboard</li>
			<li>News</li>
			<li>Activity</li>
			<li>Profile</li>
			<li>Logout</li>
		</ul>
		<!-- <a href="#" style="color: white; text-decoration: none;">Logout</a> -->

	</div>
    <!-- Main Content -->
    <div class="main-content">
        <h1>Welcome, Admin!</h1>
        <p>Here's an overview of key information:</p>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <!-- Card 1: Schools -->
            <a href="viewstatus.jsp" class="dashboard-card">
                <h2>Schools</h2>
                <p>10</p> <!-- Replace '10' with dynamic data -->
            </a>

            <!-- Card 2: Students -->
            <a href="studentsList.jsp" class="dashboard-card">
                <h2>Students</h2>
                <p>500</p> <!-- Replace '500' with dynamic data -->
            </a>

            <!-- Card 3: Teachers -->
            <a href="teachersList.jsp" class="dashboard-card">
                <h2>Teachers</h2>
                <p>50</p> <!-- Replace '50' with dynamic data -->
            </a>
        </div>
    </div>
</body>
</html>
