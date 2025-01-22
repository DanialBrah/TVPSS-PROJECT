<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>School Criteria List</title>
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
</style>
</head>
<body>
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
		<div class="container-fluid">
			<div
				class="criteria-header d-flex justify-content-between align-items-center mb-4">
				<h2>School Criteria Overview</h2>
			</div>

			<div class="criteria-table">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>School</th>
								<th>Version</th>
								<th>Name/Brand</th>
								<th>Logo</th>
								<th>Studio</th>
								<th>In-School Recording</th>
								<th>YouTube Upload</th>
								<th>Outside Recording</th>
								<th>External Collaboration</th>
								<th>Green Screen</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${criteriaList}" var="criteria">
								<tr>
									<td class="school-name">${criteria.school.name}</td>
									<td><span class="version-badge">V${criteria.version}</span>
									</td>
									<td class="checkbox-cell"><c:if test="${criteria.hasName}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if test="${criteria.hasLogo}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if
											test="${criteria.hasStudio}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if
											test="${criteria.hasInSchoolRecording}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if
											test="${criteria.hasYoutubeUpload}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if
											test="${criteria.hasOutsideRecording}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if
											test="${criteria.hasExternalCollaboration}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>
									<td class="checkbox-cell"><c:if
											test="${criteria.hasGreenScreen}">
											<i class="fas fa-check checkbox-icon"></i>
										</c:if></td>

									<td><a
										href="${pageContext.request.contextPath}/criteria/edit/${criteria.id}"
										class="btn btn-warning btn-action"> <i class="fas fa-edit"></i>
											Edit
									</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
