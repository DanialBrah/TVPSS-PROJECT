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
			<li><a href="/TVPSS/activities/guest">Activity</a></li>
			<li><a href="/TVPSS/videos/guest">Video</a></li>
			<li><a href="info.jsp">News</a></li>
			<li><a href="/TVPSS/login/validate">Logout</a></li>
		</ul>
	</div>

	<!-- Main Content Section -->
	<div class="main-content">
		<h2>Videos List</h2>
		<!-- Activity Cards -->
		<c:forEach items="${videos}" var="video">
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
			</div>
		</c:forEach>
	</div>
</body>
</html>
