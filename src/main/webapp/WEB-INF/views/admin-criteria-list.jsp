<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin - School Criteria List</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
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
	align-items: left;
	gap: 10px;
}

.sidebar-logo {
	width: 100px;
	height: 70px;
	border-radius: 5px;
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
	color: #e0e0e0;
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
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.sidebar ul li:hover {
	background-color: #0056b3;
	transform: translateX(5px);
}

.sidebar ul li a {
	text-decoration: none;
	color: inherit;
	display: block;
	width: 100%;
}

.main-content {
	margin-left: 240px;
	padding: 20px;
}

.criteria-table {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

.table-responsive {
	overflow-x: auto;
}

.version-badge {
	font-size: 1.1em;
	font-weight: bold;
	padding: 5px 12px;
	border-radius: 8px;
	background-color: #002a72;
	color: white;
}

.criteria-header {
	background-color: #f8f9fa;
	padding: 15px;
	border-radius: 8px 8px 0 0;
	border-bottom: 2px solid #dee2e6;
}

.checkbox-cell {
	text-align: center;
}

.checkbox-icon {
	color: #28a745;
	font-size: 1.2em;
}

.school-name {
	font-weight: bold;
	color: #002a72;
}

.table th {
	background-color: #f8f9fa;
	font-weight: 600;
}

.status-pending {
	color: #ffc107;
}

.status-approved {
	color: #28a745;
}

.status-disapproved {
	color: #dc3545;
}

.stats-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	margin-bottom: 30px;
}

.stat-card {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
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

	<div class="stats-container">
		<div class="stat-card">
			<h3>${criteriaList.size()}</h3>
			<p>Total Versions</p>
		</div>
		<div class="stat-card">
			<h3>${criteriaList.stream().filter(c -> c.getStatus() == 'Approved').count()}</h3>
			<p>Approved Versions</p>
		</div>
		<div class="stat-card">
			<h3>${criteriaList.stream().filter(c -> c.getStatus() == 'Pending').count()}</h3>
			<p>Pending Versions</p>
		</div>
		<div class="stat-card">
			<h3>${criteriaList.stream().filter(c -> c.getStatus() == 'Disapproved').count()}</h3>
			<p>Disapproved Versions</p>
		</div>
	</div>

	<div class="table-container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>School</th>
					<th>Version</th>
					<th>Status</th>
					<th>Criteria Details</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${criteriaList}" var="criteria">
					<tr>
						<td>${criteria.school.name}</td>
						<td>${criteria.version}</td>
						<td><span class="status-${criteria.status.toLowerCase()}">${criteria.status}</span>
						</td>
						<td>
							<ul class="list-unstyled">
								<li><i
									class="fas ${criteria.hasName ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									Name</li>
								<li><i
									class="fas ${criteria.hasLogo ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									Logo</li>
								<li><i
									class="fas ${criteria.hasStudio ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									Studio</li>
								<li><i
									class="fas ${criteria.hasInSchoolRecording ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									In-School Recording</li>
								<li><i
									class="fas ${criteria.hasYoutubeUpload ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									YouTube Upload</li>
								<li><i
									class="fas ${criteria.hasOutsideRecording ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									Outside Recording</li>
								<li><i
									class="fas ${criteria.hasExternalCollaboration ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									External Collaboration</li>
								<li><i
									class="fas ${criteria.hasGreenScreen ? 'fa-check text-success' : 'fa-times text-danger'}"></i>
									Green Screen</li>
							</ul>
						</td>
						<td>
							<form
								action="${pageContext.request.contextPath}/criteria/approve/${criteria.id}"
								method="post" style="display: inline;">
								<button type="submit" class="btn btn-success btn-sm">
									<i class="fas fa-check"></i> Approve
								</button>
							</form>
							<form
								action="${pageContext.request.contextPath}/criteria/disapprove/${criteria.id}"
								method="post" style="display: inline;">
								<button type="submit" class="btn btn-danger btn-sm">
									<i class="fas fa-times"></i> Disapprove
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>