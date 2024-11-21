<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Status</title>
<link rel="stylesheet" type="text/css" href="css/activity.css">
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
			<li><a href="version.jsp">Version / Level</a></li>
			<li><a href="equipment.jsp">Equipment</a></li>
			<li><a href="activity.jsp">Activity</a></li>
			<li><a href="info.jsp">Info</a></li>
			<li><a href="logo.jsp">Logo</a></li>
			<li><a href="gpm.jsp">GPM</a></li>
			<li><a href="video.jsp">Content</a></li>
			<li><a href="login.jsp">Logout</a></li>
		</ul>
	</div>

	<main id="activity-page">
		<h1>Activity</h1>
		<div class="activity-container">

			<div class="search-bar">
				<input type="text" placeholder="Search" id="search-input">
			</div><br>
			<div class="activity-grid">
				<div class="activity-item">
					<img src="images/salam.jpg" alt="Activity 1">
					<p>Majlis Perpisahan Encik Norazlan Bin Ahmad</p>
				</div>
				<div class="activity-item">
					<img src="images/5.jpg" alt="Activity 2">
					<p>Transisi Tahun 1 2024/2025</p>
				</div>
				<div class="activity-item">
					<img src="images/3.jpg" alt="Activity 3">
					<p>Anugerah Nilam Daerah Johor Bahru 2024/2025 Kategori Bahasa
						Melayu</p>
				</div>
				<div class="activity-item">
					<img src="images/4.jpg" alt="Activity 4">
					<p>Anugerah Nilam Daerah Johor Bahru 2024/2025 Kategori Bahasa
						Inggeris</p>
				</div>
				<div class="activity-item">
					<img src="images/5.jpg" alt="Activity 5">
					<p>Anugerah Video Pembaca Berita Daerah Johor Bahru 2024/2025
						Kategori Bahasa Inggeris</p>
				</div>
				<div class="activity-item">
					<img src="images/6.jpeg" alt="Activity 6">
					<p>Anugerah Video Pembaca Berita Daerah Johor Bahru 2024/2025
						Kategori Bahasa Melayu</p>
				</div>
			</div>
		</div>
	</main>

</body>