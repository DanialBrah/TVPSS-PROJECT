<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TV PSS Version</title>
    <link rel="stylesheet" type="text/css" href="css/version.css">
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
            <li><a href="#">GPM</a></li>
            <li><a href="video.jsp">Content</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>
    <div class="main-content">
        <h1>TV PSS Version</h1>
        <div class="criteria-box">
            <table>
                <thead>
                    <tr>
                        <th>Criteria</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>There is a name (brand)</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Logo</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Corner / Mini Studio / TV Studio</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>In-School Recording</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Upload on YouTube</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Recording inside and outside the school</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Collaborate with external agencies</td>
                        <td>✔</td>
                    </tr>
                    <tr>
                        <td>Using Green Screen Technology</td>
                        <td>✘</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="version-update">
            <p>Version: <span>3</span></p>
            <button>Update</button>
        </div>
    </div>
</body>
</html>
