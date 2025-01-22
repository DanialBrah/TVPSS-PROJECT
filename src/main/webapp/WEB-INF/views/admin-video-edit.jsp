<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Video</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	text-decoration: none;
}

.sidebar ul li a {
	text-decoration: none;
	color: inherit;
	display: block;
	width: 100%;
}

/* Main Content Styles */
.main-content {
	margin-left: 225px;
	padding: 20px;
}

.main-content h2 {
	color: #1d3557;
	text-align: center;
	margin-bottom: 20px;
}

.form-container {
	background-color: #457b9d;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.container {
	color: white;
}
</style>
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
        <h2>Edit Video</h2>
        <div class="form-container">
            <form action="../edit/${video.id}" method="post" class="container">
                <input type="hidden" name="id" value="${video.id}" />
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="activityName" value="${video.title}" required>
                </div>
                <div class="mb-3">
                    <label for="url" class="form-label">URL</label>
                    <input type="url" class="form-control" id="url" name="url" value="${videp.url}" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" required>${video.description}</textarea>
                </div>
                
                <div class="mb-3">
                    <label for="date" class="form-label">Date</label>
                    <input type="date" class="form-control" id="date" name="date" value="${videp.date}" required>
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="/TVPSS/video" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>

</body>
</html>
