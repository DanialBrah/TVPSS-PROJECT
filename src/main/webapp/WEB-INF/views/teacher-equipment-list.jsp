<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Equipment Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
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

.container {
	margin-left: 270px;
	max-width: calc(100% - 290px);
	padding: 30px;
}

.page-header {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
}

.page-header h1 {
	color: var(--text-dark);
	margin: 0;
	font-size: 28px;
	font-weight: bold;
}

.search-add-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.search-container {
	display: flex;
	gap: 10px;
	width: 50%;
}

.table-container {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.table {
	margin-bottom: 0;
}

.table th {
	background-color: var(--primary-color);
	color: var(--text-light);
	font-weight: 600;
	padding: 15px;
}

.table td {
	padding: 15px;
	vertical-align: middle;
}

.equipment-image {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 5px;
}

.btn-action {
	padding: 5px 15px;
	margin: 0 5px;
}

.btn-add {
	padding: 8px 20px;
	font-weight: 500;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="header-container">
			<img src="${pageContext.request.contextPath}/images/jata.png" alt="Logo" class="sidebar-logo">
			<div class="header-text">
				<h1>TV PSS</h1>
				<h6>
					Management<br>Information System
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

	<div class="container">
		<div class="page-header">
			<h1>Equipment Management</h1>
		</div>

		<div class="search-add-container">
			<div class="search-container">
				<input type="text" id="searchInput" class="form-control"
					placeholder="Search equipment...">
				<button class="btn btn-primary" onclick="searchEquipment()">
					<i class="fas fa-search"></i> Search
				</button>
			</div>
			<a href="/TVPSS/equipment/add2" class="btn btn-primary btn-add">
				<i class="fas fa-plus"></i> Add New Equipment
			</a>
		</div>

		<div class="table-container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Equipment Id</th>
						<th>Equipment Name</th>
						<th>Quantity</th>
						<th>Last Maintenance</th>
						<th>School Name</th>
						<th>Proof</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${equipmentList}" var="equipment">
						<tr>
							<td>${equipment.equipmentId}</td>
							<td>${equipment.equipmentName}</td>
							<td>${equipment.quantity}</td>
							<td>${equipment.lastMaintenanceDate}</td>
							<td>${equipment.school.name}</td>
							<td><img
								src="${pageContext.request.contextPath}/${equipment.imageUrl}"
								alt="Equipment" class="equipment-image"
								style="max-width: 100px; max-height: 100px;"></td>
							<td><a
								href="${pageContext.request.contextPath}/equipment/edit2/${equipment.equipmentId}"
								class="btn btn-warning btn-action"> <i class="fas fa-edit"></i>
									Edit
							</a> <a
								href="${pageContext.request.contextPath}/equipment/delete2/${equipment.equipmentId}"
								class="btn btn-danger btn-action"
								onclick="return confirm('Are you sure you want to delete this equipment?')">
									<i class="fas fa-trash"></i> Delete
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
        function searchEquipment() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr');
            
            rows.forEach(row => {
                const equipmentName = row.children[2].textContent.toLowerCase();
                row.style.display = equipmentName.includes(input) ? '' : 'none';
            });
        }
    </script>
</body>
</html>