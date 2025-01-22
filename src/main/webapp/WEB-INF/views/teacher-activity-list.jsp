<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Activities Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/activity-list.css">
</head>
<body>
	<!-- Sidebar Section -->
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

	<!-- Main Content Section -->
	<div class="main-content">
		<h2>Activities List</h2>
		<!-- Add New Activity Button -->
		<a href="/TVPSS/activities/add2" class="btn btn-primary mb-3">Add
			New Activity</a>
		<!-- Activity Cards -->
		<c:forEach items="${activities}" var="activity">
			<div class="activity-card">


				<c:if test="${not empty activity.imageProof}">
					<img
						src="${pageContext.request.contextPath}/${activity.imageProof}"
						alt="Activity Image">
				</c:if>
				<c:if test="${empty activity.imageProof}">
					<img src="images/no-image.png" alt="No Image">
				</c:if>

				<div class="label">Activity Name: ${activity.activityName}</div>


				<div class="label">Description: ${activity.description}</div>


				<div class="label">Date: ${activity.date}</div>

				<br>


				<div class="btn-container">
					<a
						href="${pageContext.request.contextPath}/activities/edit2/${activity.id}"
						class="btn btn-warning">Edit</a> <a
						href="${pageContext.request.contextPath}/activities/delete2/${activity.id}"
						class="btn btn-danger"
						onclick="return confirm('Are you sure you want to delete this activity?')">Delete</a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
