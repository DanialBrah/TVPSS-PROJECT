<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="css/validate.css">
    <title>Update Admin Profile - TV PSS Management Information System</title>
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

        .nav-links {
            list-style: none;
            padding: 0;
            margin-top: 20px;
            width: 100%;
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
            width: 100%;
        }

        .nav-links a:hover {
            background-color: #007BFF;
        }

        /* Main Content Area */
        .main-content {
            flex: 1;
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

        .form-container input, .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
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

        .profile-picture input {
            display: block;
            margin: 10px auto 0;
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
        <h1>Update Admin Profile</h1>
        <div class="form-container">
            <form action="adminProfile.jsp" method="post" enctype="multipart/form-data">
                <!-- Profile Picture -->
                <div class="profile-picture">
                    <img src="images/Tprof.jpg" alt="Profile Picture" id="profileImg"> <!-- Replace with dynamic src -->
                    <input type="file" name="profilePicture" accept="image/*" onchange="previewImage(event)">
                </div>

                <label for="teacherName">Name:</label>
                <input type="text" id="teacherName" name="teacherName" value="John Doe" required> <!-- Replace with dynamic data -->

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="johndoe@example.com" required> <!-- Replace with dynamic data -->

                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="0123456789" required> <!-- Replace with dynamic data -->

                <button type="submit">Update Profile</button>
            </form>
        </div>
    </div>

    <script>
        function previewImage(event) {
            const imgElement = document.getElementById('profileImg');
            imgElement.src = URL.createObjectURL(event.target.files[0]);
        }
    </script>
</body>
</html>
