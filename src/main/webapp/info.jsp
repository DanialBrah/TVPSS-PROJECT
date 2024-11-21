<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Info</title>
    <link rel="stylesheet" type="text/css" href="css/info.css">
</head>
<body>
    <!-- Sidebar -->
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
            <li><a href="info.jsp" class="active-link">Info</a></li>
            <li><a href="logo.jsp">Logo</a></li>
            <li><a href="#">GPM</a></li>
            <li><a href="video.jsp">Content</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Info</h1>
        <div class="search-container">
            <input type="text" placeholder="Search">
        </div>
        <div class="content-container">
            <img src="images/salam.jpg" alt="Activity Image" class="activity-image">
            <table class="criteria-box">
                <tr>
                    <th>Activity Name</th>
                    <td>Majlis Perpisahan Encik Norazlan</td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td>20 April 2024</td>
                </tr>
                <tr>
                    <th>Tujuan</th>
                    <td>Meraikan dan memberikan sumbangan dan pencapaian Encik Norazlan bin Ahmad</td>
                </tr>
            </table>
        </div>
        <div class="version-update">
            <button>Edit</button>
        </div>
    </div>
    
</body>
</html>
