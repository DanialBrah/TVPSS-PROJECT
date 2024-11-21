<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="css/validate.css">
    <title>View Teacher Profile - TV PSS Management Information System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        /* Main Content */
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

        .profile-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }

        .profile-container label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .profile-container .profile-detail {
            margin-bottom: 15px;
        }

        .profile-picture {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .profile-picture img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .update-button-container {
            text-align: center;
            margin-top: 20px;
        }

        .update-button-container button {
            background-color: #004A9F;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .update-button-container button:hover {
            background-color: #007BFF;
        }
    </style>

</head>
<body>
	<div class="sidebar">
		<div class="header-container">
			<img src="image/jata negara.png" alt="Logo" class="sidebar-logo">
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
        <h1>Teacher Profile</h1>
        <div class="profile-container">
            <!-- Profile Picture -->
            <div class="profile-picture">
                <img src="image/Tprof.png" alt="Profile Picture"> <!-- Replace with dynamic src -->
            </div>

            <!-- Profile Details -->
            <div class="profile-detail">
                <label>Name:</label>
                <p>John Doe</p> <!-- Replace with dynamic data -->
            </div>
            <div class="profile-detail">
                <label>Staff ID:</label>
                <p>T12345</p> <!-- Replace with dynamic data -->
            </div>
            <div class="profile-detail">
    <label for="teachingExperience">Teaching Experience:</label>
    <textarea id="teachingExperience" name="teachingExperience" rows="4" cols="50"
        placeholder="Describe your teaching experience...">5 years</textarea>
</div>

            <div class="profile-detail">
                <label>Email:</label>
                <p>johndoe@example.com</p> <!-- Replace with dynamic data -->
            </div>
            <div class="profile-detail">
                <label>Phone Number:</label>
                <p>0123456789</p> <!-- Replace with dynamic data -->
            </div>

            <!-- Update Button -->
            <div class="update-button-container">
                <form action="updateTeacher.jsp" method="get">
                    <button type="submit">Update Profile</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
