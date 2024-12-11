<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Teacher Profile - TV PSS Management Information
	System</title>
<link rel="stylesheet" type="text/css" href="css/gpm.css">
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
			<li><a href="version.jsp">Version / Level</a></li>
			<li><a href="equipment.jsp">Equipment</a></li>
			<li><a href="activity.jsp">Activity</a></li>
			<li><a href="info.jsp" class="active-link">Info</a></li>
			<li><a href="logo.jsp">Logo</a></li>
			<li><a href="gpm.jsp">GPM</a></li>
			<li><a href="video.jsp">Content</a></li>
			<li><a href="login.jsp">Logout</a></li>
		</ul>
		<!-- <a href="#" style="color: white; text-decoration: none;">Logout</a> -->

	</div>

	<!-- Main Content -->
	<div class="main-content">
		<h1>Teacher Profile</h1>
		<div class="profile-container">
			<!-- Profile Picture -->
			<div class="profile-picture">
				<img src="images/Tprof.png" alt="Profile Picture">
				<!-- Replace with dynamic src -->
			</div>

			<!-- Profile Details -->
			<div class="profile-detail">
				<label>Name:</label>
				<p>John Doe</p>
				<!-- Replace with dynamic data -->
			</div>
			<div class="profile-detail">
				<label>Staff ID:</label>
				<p>T12345</p>
				<!-- Replace with dynamic data -->
			</div>
			<div class="profile-detail">
				<label for="teachingExperience">Teaching Experience:</label>
				<textarea id="teachingExperience" name="teachingExperience" rows="4"
					cols="50" placeholder="Describe your teaching experience...">5 years</textarea>
			</div>

			<div class="profile-detail">
				<label>Email:</label>
				<p>johndoe@example.com</p>
				<!-- Replace with dynamic data -->
			</div>
			<div class="profile-detail">
				<label>Phone Number:</label>
				<p>0123456789</p>
				<!-- Replace with dynamic data -->
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
