<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/validate.css">
    <title>Update Teacher Profile - TV PSS Management Information System</title>
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

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .modal-content h2 {
            margin-top: 0;
            font-size: 20px;
        }

        .modal-content input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .modal-content button {
            background-color: #004A9F;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #007BFF;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 16px;
            font-weight: bold;
            color: #999;
            cursor: pointer;
            float: right;
        }

        .modal-close:hover {
            color: #555;
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
        <h1>Update Teacher Profile</h1>
        <div class="form-container">
            <form action="teacherProfile.jsp" method="post" enctype="multipart/form-data">
                <!-- Profile Picture -->
                <div class="profile-picture">
                    <img src="images/Tprof.png" alt="Profile Picture" id="profileImg">
                    <input type="file" name="profilePicture" accept="image/*" onchange="previewImage(event)">
                </div>

                <label for="teacherName">Name:</label>
                <input type="text" id="teacherName" name="teacherName" value="John Doe" required>

                <label for="staffId">Staff ID:</label>
                <input type="text" id="staffId" name="staffId" value="T12345" readonly>

                <label for="teachingExperience">Teaching Experience (years):</label>
                <input type="number" id="teachingExperience" name="teachingExperience" value="5" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="johndoe@example.com" required>

                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="0123456789" required>

                <!-- Reset Password -->
                <div class="link-container">
                    <a onclick="openModal()">Reset Password</a>
                </div>

                <button type="submit">Update Profile</button>
            </form>
        </div>
    </div>

    <!-- Modal -->
    <div id="resetPasswordModal" class="modal">
        <div class="modal-content">
            <button class="modal-close" onclick="closeModal()">×</button>
            <h2>Reset Password</h2>
            <form action="resetPasswordHandler.jsp" method="post">
                <label for="newPassword">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" required>
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <button type="submit">Reset Password</button>
            </form>
        </div>
    </div>

    <script>
        function previewImage(event) {
            const imgElement = document.getElementById('profileImg');
            imgElement.src = URL.createObjectURL(event.target.files[0]);
        }

        function openModal() {
            document.getElementById('resetPasswordModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('resetPasswordModal').style.display = 'none';
        }
    </script>
</body>
</html>
