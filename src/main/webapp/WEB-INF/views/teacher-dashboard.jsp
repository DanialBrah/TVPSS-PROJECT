<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TV PSS Version</title>
<link rel="stylesheet" type="text/css" href="css/version.css">
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.sidebar {
	width: 220px;
	background-color: #002a72;
	color: white;
	position: fixed;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.header-container {
	display: flex;
	align-items: left; /* Vertically aligns the image and text */
	gap: 10px; /* Adds space between the image and text */
}

.sidebar-logo {
	width: 100px; /* Adjust the width of the logo */
	height: 70px; /* Adjust the height of the logo */
	border-radius: 5px; /* Optional: rounds the corners of the image */
}

.header-text h1 {
	font-size: 20px;
	margin: 0;
	text-align: centre;
}

.header-text h6 {
	font-size: 10px;
	margin: 0;
	text-align: left;
	line-height: 1.5;
	color: #e0e0e0; /* Optional: lighter color for better contrast */
}

.sidebar ul {
	list-style-type: none;
	padding: 70px 0 0 0;
	margin: 0;
}

.sidebar ul li {
	margin: 15px 0;
	padding: 10px;
	cursor: pointer;
	border-radius: 5px; /* Adds a slight rounding to the edges */
	transition: background-color 0.3s ease, transform 0.2s ease;
	/* Smooth hover effect */
}

.sidebar ul li:hover {
	background-color: #0056b3; /* Changes background color on hover */
	transform: translateX(5px); /* Slightly moves the item to the right */
	text-decoration: none; /* Ensures no underline on hover */
}

.sidebar ul li a {
	text-decoration: none; /* Removes underline for links */
	color: inherit;
	/* Ensures links take the same color as the list item */
	display: block;
	width: 100%;
}

.header-container {
	display: flex;
	align-items: left; /* Vertically aligns the image and text */
	gap: 10px; /* Adds space between the image and text */
}

.sidebar-logo {
	width: 100px; /* Adjust the width of the logo */
	height: 70px; /* Adjust the height of the logo */
	border-radius: 5px; /* Optional: rounds the corners of the image */
}

.main-content {
	margin-left: 270px;
	padding: 20px;
}

.main-content h1 {
	color: #1d3557;
	margin-bottom: 20px;
	width: 85%;
	text-align: center;
}

.criteria-box {
	background-color: #457b9d;
	padding: 20px;
	border-radius: 8px;
	color: white;
	width: 85%;
}

.criteria-box table {
	width: 100%;
	border-collapse: collapse;
}

.criteria-box table th, .criteria-box table td {
	text-align: left;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

.criteria-box table th {
	font-size: 18px;
	background-color: #1d3557;
	text-align: centre;
}

.criteria-box table td {
	font-size: 16px;
	text-align: centre;
}

.criteria-box table td:last-child {
	text-align: centre;
}

.version-update {
	margin-top: 20px;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	text-align: center;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 85%;
}

.version-update p {
	font-size: 18px;
}

.version-update span {
	font-weight: bold;
}

.version-update button {
	background-color: #1d3557;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

.version-update button:hover {
	background-color: #457b9d;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="header-container">
			<img src="${pageContext.request.contextPath}/images/jata.png"
				alt="Logo" class="sidebar-logo">
			<div class="header-text">
				<h1>TV PSS</h1>
				<h6>
					Management <br> Information System
				</h6>
			</div>
		</div>
		<ul>
			<li><a href="/TVPSS/criteria/teacher2">Version</a></li>
			<li><a href="/TVPSS/equipment/teacher">Equipment</a></li>
			<li><a href="/TVPSS/teachers/activity">Activity</a></li>
			<li><a href="/TVPSS/teachers/news">News</a></li>
			<li><a href="/TVPSS/teachers/video">Video</a></li>
			
			<li><a href="/TVPSS/teachers/profile">Profile</a></li>
			<li><a href="/TVPSS/teachers/logout">Logout</a></li>
		</ul>
	</div>
	<div class="main-content">
		<h1>TV PSS Version</h1>
		<div class="criteria-box">
			<table>
				<thead>
					<tr>
						<th>Criteria</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>There is a name (brand)</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>Logo</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>Corner / Mini Studio / TV Studio</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>In-School Recording</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>Upload on YouTube</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>Recording inside and outside the school</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>Collaborate with external agencies</td>
						<td>✔</td>
					</tr>
					<tr>
						<td>Using Green Screen Technology</td>
						<td>✘</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="version-update">
			<p>
				Version: <span>3</span>
			</p>
			<button>Update</button>
		</div>
	</div>
</body>
</html>
