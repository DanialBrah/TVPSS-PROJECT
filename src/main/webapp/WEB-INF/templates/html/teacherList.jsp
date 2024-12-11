<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" type="text/css" href="css/validate.css">
    <title>Teacher List - TV PSS Management Information System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Main Content */
        .main-content {
            margin-left: 270px;
            padding: 20px;
        }

        .main-content h1 {
            color: black;
            margin-bottom: 20px;
        }

        /* Table Styling */
        .teacher-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .teacher-table th, .teacher-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .teacher-table th {
            background-color: #0056b3;
            color: white;
            font-weight: bold;
        }

        .teacher-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .teacher-table tr:hover {
            background-color: #f1f1f1;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .view-button {
            background-color: #007BFF;
            color: white;
        }

        .view-button:hover {
            background-color: #0056b3;
        }

        .delete-button {
            background-color: #FF4D4D;
            color: white;
        }

        .delete-button:hover {
            background-color: #D93636;
        }

        /* Add Button */
        .add-button {
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .add-button:hover {
            background-color: #0056b3;
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
			<li>Version</li>
			<li>Equipment</li>
			<li>Activity</li>
			<li>Info</li>
			<li>Logo</li>
			<li>GPM</li>
			<li>Logout</li>
		</ul>
		<!-- <a href="#" style="color: white; text-decoration: none;">Logout</a> -->

	</div>
    <!-- Main Content -->
    <div class="main-content">
        <h1>Teacher List</h1>
        <!-- Add New Teacher Button -->
        <button class="add-button" onclick="window.location.href='addTeacher.jsp'">Add New Teacher</button>

        <!-- Teacher List Table -->
        <table class="teacher-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>School</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dummy Data -->
                <tr>
                    <td>John Doe</td>
                    <td>ABC High School</td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-button view-button" onclick="window.location.href='viewTeacher.jsp?id=1'">View</button>
                            <button class="action-button delete-button">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Jane Smith</td>
                    <td>XYZ Primary School</td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-button view-button" onclick="window.location.href='viewTeacher.jsp?id=2'">View</button>
                            <button class="action-button delete-button">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Ali Ahmad</td>
                    <td>PQR International School</td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-button view-button" onclick="window.location.href='viewTeacher.jsp?id=3'">View</button>
                            <button class="action-button delete-button">Delete</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
