<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add School</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
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

        .container {
            margin: 20px auto;
            max-width: 600px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn-primary {
            width: 100%;
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
			<li><a href="/TVPSS/teachers">Teacher</a></li>
			<li><a href="/TVPSS/crew">Crew</a></li>
			<li><a href="logo.jsp">Video</a></li>
			<li><a href="info.jsp">News</a></li>
			<li><a href="/TVPSS/activities">Activity</a></li>
			<li><a href="/TVPSS/login/validate">Logout</a></li>
		</ul>
	</div>

    <div class="container">
        <h1 class="text-center">Add New School</h1>
        <form action="${pageContext.request.contextPath}/schools/add" method="post">
		    <div class="form-group">
		        <label for="name">School Name</label>
		        <input type="text" id="name" name="name" class="form-control" required>
		    </div>
		    <div class="form-group">
		        <label for="address">Address</label>
		        <textarea id="address" name="address" class="form-control" required></textarea>
		    </div>
		    <div class="form-group">
		        <label for="contact">Contact</label>
		        <input type="text" id="contact" name="contact" class="form-control">
		    </div>
		    <div class="form-group">
		        <label for="version">Version</label>
		        <input type="text" id="version" name="version" class="form-control">
		    </div>
		    <button type="submit" class="btn btn-primary">Add School</button>
		</form>
		<a href="/schools" class="btn btn-secondary mt-3">Back to List</a>

    </div>
</body>
</html>
