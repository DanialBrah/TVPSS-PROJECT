<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Equipment</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">

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
	align-items: center;
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
	text-align: center;
}

.header-text h6 {
	font-size: 10px;
	margin: 0;
	line-height: 1.5;
	color: #e0e0e0;
}

.sidebar ul {
	list-style-type: none;
	padding: 70px 0 0;
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
}

.container {
	margin-left: 250px;
	max-width: 85%;
	padding: 20px;
}

.container h1 {
	color: #1d3557;
	margin-bottom: 20px;
	text-align: center;
}

.table {
	width: 100%;
	text-align: center;
}

.table th {
	background-color: #1d3557;
	color: white;
}

.table td, .table th {
	padding: 10px;
	vertical-align: middle;
}

.table-actions {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.table-actions a {
	text-decoration: none;
}

/* Additional styles for image upload */
        .image-upload-container {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }

        .image-preview {
            max-width: 200px;
            max-height: 200px;
            margin: 10px auto;
            display: none;
        }

        .upload-icon {
            font-size: 48px;
            color: #6c757d;
            margin-bottom: 10px;
        }

        #imageInput {
            display: none;
        }

        .custom-file-upload {
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .custom-file-upload:hover {
            background-color: #dde0e3;
        }
</style>
</head>
<body>

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
            <li><a href="/TVPSS/criteria/teacher">Version</a></li>
            <li><a href="/TVPSS/equipment/teacher">Equipment</a></li>
            <li><a href="/TVPSS/activities/teacher">Activity</a></li>
            <li><a href="/TVPSS/teachers/news">News</a></li>
            <li><a href="/TVPSS/teachers/video">Video</a></li>
            
            <li><a href="/TVPSS/teachers/profile">Profile</a></li>
            <li><a href="/TVPSS/teachers/logout">Logout</a></li>
        </ul>
	</div>

	<div class="container mt-4">
		<h2 class="text-center mb-4">Edit Equipment</h2>

		<!-- Display error message if any -->
		<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger">${errorMessage}</div>
		</c:if>

		<!-- Display success message if any -->
		<c:if test="${not empty successMessage}">
			<div class="alert alert-success">${successMessage}</div>
		</c:if>

		<form
			action="../edit2/${equipment.equipmentId}"
			method="post" class="border p-4 bg-light rounded"
			enctype="multipart/form-data">
			
			<input type="hidden" name="id" value="${equpiment.equipmentId}" />

		<!-- Equipment Image Upload -->
            <div class="mb-3">
					<label for="currentImage" class="form-label">Current Image</label><br>
					<c:if test="${not empty equipment.imageUrl}">
						<img
							src="${pageContext.request.contextPath}/${equipment.imageUrl}"
							alt="Current Image"
							style="max-width: 200px; max-height: 200px; border-radius: 5px;">
					</c:if>
					<c:if test="${empty equipment.imageUrl}">
						<span>No Image Available</span>
					</c:if>
				</div>
				
				<div class="mb-3">
					<label for="imageFile" class="form-label">Upload Proof
						(Image)</label> <input type="file" class="form-control" id="imageFile"
						name="imageFile" accept="image/*">
				</div>
				

			<!-- Equipment Name -->
			<div class="mb-3">
				<label for="equipmentName" class="form-label">Equipment Name</label>
				<input type="text" class="form-control" id="equipmentName"
					name="equipmentName" value="${equipment.equipmentName}" required>
			</div>

			<!-- Quantity -->
			<div class="mb-3">
				<label for="quantity" class="form-label">Quantity</label> <input
					type="number" class="form-control" id="quantity" name="quantity"
					value="${equipment.quantity}" min="0" required>
			</div>

			<!-- Last Maintenance Date -->
			<div class="mb-3">
				<label for="lastMaintenanceDate" class="form-label">Last
					Maintenance Date</label> <input type="date" class="form-control"
					id="lastMaintenanceDate" name="lastMaintenanceDate"
					value="${equipment.lastMaintenanceDate}" required>
			</div>

			

			<div class="d-flex gap-2">
				<button type="submit" class="btn btn-primary">Update
					Equipment</button>
				<a href="${pageContext.request.contextPath}/equipment/teacher"
					class="btn btn-secondary">Cancel</a>
			</div>
		</form>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

	
</body>
</html>