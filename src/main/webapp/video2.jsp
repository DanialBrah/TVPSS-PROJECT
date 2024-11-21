<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Content Upload</title>
    <link rel="stylesheet" type="text/css" href="css/video.css">
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
            <li><a href="info.jsp">Info</a></li>
            <li><a href="logo.jsp">Logo</a></li>
            <li><a href="#">GPM</a></li>
            <li><a href="video.jsp">Content</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content-container">
        <div class="content-box">
            <!-- Tabs -->
            <div class="tabs">
                <a href="video.jsp" class="tab-link">YouTube Link</a>
                <a href="video2.jsp" class="tab-link active">Video File</a>
            </div>
            
            <!-- Upload Section -->
            <div class="upload-container">
                <div class="upload-area">
                    <p>Choose a file or drag and drop it here</p>
                    <button class="browse-btn">Browse File</button>
                </div>
            </div>

            <!-- Metadata Section -->
            <h2 class="metadata-title">*Metadata</h2>
            <form action="upload_process.jsp" method="post" class="form-container">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" placeholder="Title">
                    
                </div>
                <div class="form-group">
                    <label for="tagline">Tagline</label>
                    <input type="text" id="tagline" name="tagline" placeholder="Tagline">
                    
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" id="description" name="description" placeholder="Description">
                    
                </div>
                <p class="form-note">Please fill in all required fields</p>
                <button type="submit" class="submit-btn">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
