<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Crew List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
/* Sidebar Styles */
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

/* Main Content Styles */
.main-content {
	margin-left: 225px;
	padding: 20px;
	
}
.main-content h1 {
	color: #1d3557;
	text-align: center;
	margin-bottom: 20px;
}

.table-container {
	background-color: #457b9d;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	
}

/* Table Styling with Blur Effect */
.table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 5px; /* Rounded corners for the table */
    overflow: hidden;
    background-color: rgba(255, 255, 255, 0.2); /* Semi-transparent background to make blur visible */
    backdrop-filter: blur(10px); /* Blur effect */
    -webkit-backdrop-filter: blur(10px); /* For Safari compatibility */
    
}

.table th, 
.table td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2); /* Subtle white border */
    color: white;
}
</style>
</head>
<body>
	<!-- Sidebar Section -->
	<div class="sidebar">
		<div class="header-container">
			<img src="${pageContext.request.contextPath}/images/jata.png" alt="Logo" class="sidebar-logo">
			<div class="header-text">
				<h1>TV PSS</h1>
				<h6>
					Management <br> Information System
				</h6>
			</div>
		</div>
	<ul>
			<li><a href="/TVPSS/schools">School</a></li>
			<li><a href="/TVPSS/criteria/admin">School Version</a></li>
			<li><a href="/TVPSS/teachers">Teacher</a></li>
			<li><a href="/TVPSS/equipment">Equipment</a></li>
			<li><a href="/TVPSS/crew">Crew</a></li>
			<li><a href="/TVPSS/videos">Video</a></li>
			<li><a href="/TVPSS/news">News</a></li>
			<li><a href="/TVPSS/activities">Activity</a></li>
			<li><a href="/TVPSS/login/validate">Logout</a></li>
		</ul>
	</div>

	<!-- Main Content Section -->
	<div class="main-content">
	<h1>Crew List</h1>
		<div class="table-container">
			
			<a href="/TVPSS/crew/add" class="btn btn-primary mb-3">Add New Crew</a>
			<table class="table table-bordered table-striped">
				<thead class="table-dark">
					<tr>
						<th>Crew ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>School Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="crew" items="${crew}">
						<tr>
							<td>${crew.crewId}</td>
							<td>${crew.name}</td>
							<td>${crew.email}</td>
							<td>${crew.school.name}</td>
							<td>
								<a href="${pageContext.request.contextPath}/crew/edit/${crew.crewId}" class="btn btn-sm btn-warning">Edit</a>
								<a href="${pageContext.request.contextPath}/crew/delete/${crew.crewId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this crew?')">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
