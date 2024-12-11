<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/validate.css">
    <title>Add Teacher - TV PSS Management Information System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .main-content {
            flex: 1;
            margin-left: 270px;
            padding: 20px;
            overflow-y: auto;
        }

        .main-content h1 {
            color: black;
            margin-bottom: 20px;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }

        .form-container label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container .link-container {
            margin-bottom: 15px;
        }

        .form-container .link-container a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            transition: color 0.3s;
            cursor: pointer;
        }

        .form-container .link-container a:hover {
            color: #004A9F;
        }

        .form-container button {
            background-color: #004A9F;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-container button:hover {
            background-color: #007BFF;
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
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Add New Teacher</h1>
        <div class="form-container">
            <form action="addTeacherHandler.jsp" method="post">
                <label for="teacherName">Name:</label>
                <input type="text" id="teacherName" name="teacherName" required>

                <label for="schoolName">School Name:</label>
                <input type="text" id="schoolName" name="schoolName" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required>

                <label for="temporaryPassword">Temporary Password:</label>
                <input type="text" id="temporaryPassword" name="temporaryPassword" value="temp1234" readonly>

                <button type="submit">Add Teacher</button>
            </form>
        </div>
    </div>

</body>
</html>
