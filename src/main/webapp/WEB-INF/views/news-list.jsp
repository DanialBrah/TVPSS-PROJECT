<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>News List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
        
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
        
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            margin: 20px auto;
            max-width: 1200px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        .add-button {
            margin-bottom: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }

        .add-button:hover {
            background-color: #0056b3;
            text-decoration: none;
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .action-buttons a {
            margin: 0 5px;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
        }

        .edit-btn {
            background-color: #ffc107;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .approve-btn {
            background-color: #28a745;
        }

        .disapprove-btn {
            background-color: #dc3545;
        }

        .status-label {
            font-weight: bold;
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
    <div class="container">
        <h1>News List</h1>
        <a href="${pageContext.request.contextPath}/news/add" class="add-button">Add News</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Posted By</th>
                    <th>School ID</th>
                    <th>Posted At</th>
                    <th>Status</th>
                    <th>Actions</th>
                    <th>Approval</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="news" items="${newsList}">
                    <tr>
                        <td>${news.newsId}</td>
                        <td>${news.title}</td>
                        <td>${news.postedBy.username}</td>
                        <td>${news.school.name}</td>
                        <td>${news.postedAt}</td>
                        <td class="status-label">${news.status}</td>
                        <td class="action-buttons">
                            <a href="${pageContext.request.contextPath}/news/edit1/${news.newsId}" class="edit-btn">Edit</a>
                            <a href="${pageContext.request.contextPath}/news/delete/${news.newsId}" class="delete-btn"
                               onclick="return confirm('Are you sure you want to delete this news?');">Delete</a>
                        </td>
                        <td class="action-buttons">
                            <form action="${pageContext.request.contextPath}/news/approve/${news.newsId}" method="POST" class="action-form">
                                <button type="submit" class="approve-btn">Approve</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/news/disapprove/${news.newsId}" method="POST" class="action-form">
                                <button type="submit" class="disapprove-btn">Disapprove</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>