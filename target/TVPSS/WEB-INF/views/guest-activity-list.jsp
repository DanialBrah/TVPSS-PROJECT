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

.main-content h2 {
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

/* Table Styling */
.table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 5px; /* Rounded corners for the table */
    overflow: hidden;
    background-color: rgba(255, 255, 255, 0.2);
    /* Semi-transparent background */
    backdrop-filter: blur(10px); /* Blur effect */
    -webkit-backdrop-filter: blur(10px); /* Safari compatibility */
}

.table th, .table td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    /* Subtle white border */
}
</style>
</head>
<body>
    <!-- Sidebar Section -->
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
            <li><a href="/TVPSS/activities/guest">Activity</a></li>
            <li><a href="/TVPSS/video/guest">Video</a></li>
            <li><a href="/TVPSS/news/guest">News</a></li>
            <li><a href="/TVPSS/login/validate">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content Section -->
    <div class="main-content">
        <h2>Activities List</h2>
        <div class="table-container">
            <!-- Filters Section -->
            <form action="/TVPSS/activities/filter" method="get" class="mb-3">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="school" class="form-label">Filter by School</label> 
                        <select class="form-select" id="school" name="school.id">
                            <option value="">All Schools</option>
                            <c:forEach var="school" items="${schools}">
                                <option value="${school.id}">${school.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="date" class="form-label">Filter by Date</label> 
                        <input type="date" class="form-control" id="date" name="date">
                    </div>
                    <div class="col-md-4 d-flex align-items-end">
                        <button type="submit" class="btn btn-primary">Filter</button>
                    </div>
                </div>
            </form>

            <!-- Table Section -->
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Activity Name</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>School Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${activities}" var="activity">
                        <tr>
                            <td>${activity.id}</td>
                            <td>${activity.activityName}</td>
                            <td>${activity.description}</td>
                            <td>${activity.date}</td>
                            <td>${activity.school.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
