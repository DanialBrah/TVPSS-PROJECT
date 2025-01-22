<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Teacher Profile - TV PSS Management Information System</title>
<link rel="stylesheet" type="text/css" href="css/gpm.css">
<style>
/* General Body Styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    height: 100vh;
    overflow: hidden;
    background-color: #f4f4f4;
}
/* Sidebar Styling */
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
}
.header-text h6 {
    font-size: 10px;
    margin: 0;
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
/* Main Content */
.main-content {
    flex: 1;
    margin-left: 270px;
    padding: 20px;
    overflow-y: auto;
}
.main-content h1 {
    color: black;
    margin-bottom: 20px;
    text-align: center;
}
/* Profile Container */
.profile-container {
    background-color: #457b9d;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    max-width: 700px;
    margin: 30px auto;
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
}
/* Profile Picture */
.profile-picture {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}
.profile-picture img {
    width: 140px;
    height: 140px;
    border-radius: 50%;
    object-fit: cover;
    border: 5px solid #457b9d;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
/* Profile Detail Section */
.profile-detail {
    margin-bottom: 20px;
}
.profile-detail label {
    font-weight: bold;
    font-size: 16px;
    color: #fff;
    display: block;
    margin-bottom: 5px;
}
.profile-detail input, .profile-detail textarea {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    color: #555;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
    resize: none;
    outline: none;
    transition: border-color 0.3s ease;
}
.profile-detail input:focus, .profile-detail textarea:focus {
    border-color: #457b9d;
    box-shadow: 0 0 5px rgba(69, 123, 157, 0.5);
}
/* Update Button */
.update-button-container {
    text-align: center;
    margin-top: 20px;
}
.update-button-container button {
    background-color: #004A9F;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}
.update-button-container button:hover {
    background-color: #007BFF;
}
</style>
</head>
<body>
<div class="sidebar">
    <div class="header-container">
        <img src="${pageContext.request.contextPath}/images/jata.png" alt="Logo" class="sidebar-logo">
        <div class="header-text">
            <h1>TV PSS</h1>
            <h6>Management <br> Information System</h6>
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
<!-- Main Content -->
<div class="main-content">
    <h1>Teacher Profile</h1>
    <div class="profile-container">
        <form action="/TVPSS/teachers/edit2/${teacher.staffId}" method="get">
           
            <div class="profile-detail">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${teacher.name}" readonly>
            </div>
            <div class="profile-detail">
                <label for="staffId">Staff ID:</label>
                <input type="text" id="staffId" name="staffId" value="${teacher.staffId}" readonly>
            </div>
            <div class="profile-detail">
                <label for="teachingExperience">Teaching Experience:</label>
                <textarea id="teachingExperience" name="teachingExperience" rows="4" cols="50" readonly>${teacher.teachingExperience}</textarea>
            </div>
            <div class="profile-detail">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${teacher.email}" readonly>
            </div>
            <div class="profile-detail">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="${teacher.phoneNumber}" readonly>
            </div>
            <div class="update-button-container">
                <button type="submit">Edit Profile</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
