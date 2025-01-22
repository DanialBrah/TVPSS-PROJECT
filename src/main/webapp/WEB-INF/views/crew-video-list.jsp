<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Video Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/activity-list.css">
</head>
<style>
    .custom-link {
        color: white;
        text-decoration: none;
    }
    .custom-link:hover {
        color: black;
        text-decoration: underline;
    }
</style>
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
			<li><a href="/TVPSS/activities/crew">Activity</a></li>
			<li><a href="/TVPSS/videos/crew">Video</a></li>
			<li><a href="/TVPSS/news/crew">News</a></li>
			<li><a href="/TVPSS/login/validate">Logout</a></li>
		</ul>
	</div>

	<div class="main-content">
		<h2>Videos List</h2>
		<!-- Activity Cards -->
		<a href="/TVPSS/videos/add2" class="btn btn-primary mb-3">Add New
			Video</a>
		<c:forEach items="${video}" var="video">
			<div class="activity-card">
				<!-- Image Section -->


				<!-- Activity Details -->
				<div class="label">Title: ${video.title}</div>
				<div class="label">
					URL: <a href="${video.url}" target="_blank"
						style="color: black; text-decoration: none;">${video.url}</a>
				</div>

				<div class="label">Description: ${video.description}</div>
				<div class="label">Date: ${video.date}</div>
				<div class="btn-container">
					<a
						href="${pageContext.request.contextPath}/videos/edit2/${video.id}"
						class="btn btn-warning">Edit</a> <a
						href="${pageContext.request.contextPath}/videos/delete2/${video.id}"
						class="btn btn-danger"
						onclick="return confirm('Are you sure you want to delete this video?')">Delete</a>
				</div>
			</div>
			
		</c:forEach>
	</div>
	
</body>
</html>