<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
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
    <!-- Sidebar Section -->
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
        <h2 id="formTitle">Add New Teacher</h2>

        <div class="form-container">
            <form action="add" method="post" id="teacherForm" class="container">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                </div>
                <div class="mb-3">
                    <label for="teachingExperience" class="form-label">Teaching Experience</label>
                    <input type="number" class="form-control" id="teachingExperience" name="teachingExperience" min="0">
                </div>
                <div class="mb-3">
                    <label for="school" class="form-label">School</label>
                    <select class="form-control" id="school" name="school.id" required>
                        <option value="">Select a school</option>
                        <c:forEach var="school" items="${schools}">
                            <option value="${school.id}" 
                                <c:if test="${teacher.school != null && teacher.school.id == school.id}">selected</c:if>>
                                ${school.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Save Teacher</button>
                <a href="${pageContext.request.contextPath}/teachers" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>
