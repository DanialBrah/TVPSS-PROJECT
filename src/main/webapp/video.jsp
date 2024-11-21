<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Content Upload</title>
<link rel="stylesheet" type="text/css" href="css/video.css">
</head>
<body>
	<!-- Sidebar -->
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
			<li><a href="info.jsp">Info</a></li>
			<li><a href="logo.jsp">Logo</a></li>
			<li><a href="#">GPM</a></li>
			<li><a href="video.jsp">Content</a></li>
			<li><a href="#">Logout</a></li>
		</ul>

	</div>

	<!-- Content -->
	<div class="content-container">
		<div class="content-box">
			<div class="tabs">
				<a href="video.jsp" class="tab-link active">YouTube Link</a>
				<a href="video2.jsp" class="tab-link">Video File</a>
			</div>
			<div class="form-container">
				<h2>*Upload Link</h2>
				<input type="text" placeholder="Enter link here"> <small>Provide
					a link to upload file</small><br>

				<h2>*Metadata</h2>
				<label for="title">Title</label> <input type="text" id="title"
					placeholder="Title"> <label for="tagline">Tagline</label> <input
					type="text" id="tagline" placeholder="Tagline"> <label
					for="description">Description</label> <input type="text"
					id="description" placeholder="Description"> <small>Please
					fill in all required fields</small>

				<button type="submit" class="submit-btn">Submit</button>
			</div>
		</div>
	</div>

</body>
</html>
