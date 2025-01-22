<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Equipment</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #002a72;
            --secondary-color: #0056b3;
            --background-color: #f8f9fa;
            --text-light: #ffffff;
            --text-dark: #1d3557;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
            color: var(--text-light);
            position: fixed;
            height: 100%;
            padding: 20px;
            box-sizing: border-box;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .header-container {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar-logo {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .header-text h1 {
            font-size: 24px;
            margin: 0;
            font-weight: bold;
        }

        .header-text h6 {
            font-size: 12px;
            margin: 5px 0 0;
            opacity: 0.8;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 30px 0 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 5px 0;
            padding: 10px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar ul li:hover {
            background-color: var(--secondary-color);
            transform: translateX(5px);
        }

        .sidebar ul li a {
            text-decoration: none;
            color: var(--text-light);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar ul li a i {
            width: 20px;
            text-align: center;
        }

        .container {
            margin-left: 270px;
            max-width: calc(100% - 290px);
            padding: 30px;
        }

        .page-header {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .page-header h1 {
            color: var(--text-dark);
            margin: 0;
            font-size: 28px;
            font-weight: bold;
        }

        .search-add-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-container {
            display: flex;
            gap: 10px;
            width: 50%;
        }

        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            background-color: var(--primary-color);
            color: var(--text-light);
            font-weight: 600;
            padding: 15px;
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
        }

        .equipment-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }

        .btn-action {
            padding: 5px 15px;
            margin: 0 5px;
        }

        .btn-add {
            padding: 8px 20px;
            font-weight: 500;
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
    
    <div class="container mt-4">
        <div class="page-header">
            <h1>Add New Equipment</h1>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/equipment/add" 
              method="post" 
              enctype="multipart/form-data"
              class="needs-validation" 
              novalidate>
            
            <!-- Equipment Image Upload -->
           <div class="mb-3">
                <label class="form-label">Equipment Image</label>
                <div class="image-upload-container">
                    <i class="fas fa-cloud-upload-alt upload-icon"></i>
                    <p>Drag and drop an image or click to select</p>
                    <img id="imagePreview" class="image-preview" alt="Preview">
                    <label for="imageInput" class="custom-file-upload">
                        <i class="fas fa-folder-open"></i> Choose File
                    </label>
                    <input type="file" 
                           id="imageInput" 
                           name="imageFile" 
                           accept="image/*"
                           onchange="previewImage(this);"
                           required>
                    <div id="imageNameDisplay" class="mt-2 text-muted"></div>
                    <div class="invalid-feedback">Please select an image file.</div>
                </div>
            </div>

            <!-- Equipment Name -->
            <div class="mb-3">
                <label for="equipmentName" class="form-label">Equipment Name</label>
                <input type="text" 
                       class="form-control" 
                       id="equipmentName" 
                       name="equipmentName" 
                       required>
                <div class="invalid-feedback">Please enter equipment name.</div>
            </div>

            <!-- Quantity -->
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" 
                       class="form-control" 
                       id="quantity" 
                       name="quantity" 
                       min="1" 
                       required>
                <div class="invalid-feedback">Please enter a valid quantity.</div>
            </div>

            <!-- Last Maintenance Date -->
            <div class="mb-3">
                <label for="lastMaintenanceDate" class="form-label">Last Maintenance Date</label>
                <input type="date" 
                       class="form-control" 
                       id="lastMaintenanceDate" 
                       name="lastMaintenanceDate" 
                       required>
                <div class="invalid-feedback">Please select a valid date.</div>
            </div>
            
            <!-- School Selection -->
            <div class="mb-3">
                <label for="school" class="form-label">School</label>
                <select class="form-control" id="school" name="school.id" required>
                    <option value="">Select a school</option>
                    <c:forEach var="school" items="${schools}">
                        <option value="${school.id}">${school.name}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Please select a school.</div>
            </div>

            <!-- Submit and Cancel buttons -->
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Equipment
                </button>
                <a href="${pageContext.request.contextPath}/equipment" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>

  

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()

        // Image preview functionality
        function previewImage(input) {
            const preview = document.getElementById('imagePreview');
            const nameDisplay = document.getElementById('imageNameDisplay');
            
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    nameDisplay.textContent = input.files[0].name;
                };
                
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Drag and drop functionality
        const uploadContainer = document.querySelector('.image-upload-container');
        
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            uploadContainer.addEventListener(eventName, preventDefaults, false);
        });

        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        ['dragenter', 'dragover'].forEach(eventName => {
            uploadContainer.addEventListener(eventName, highlight, false);
        });

        ['dragleave', 'drop'].forEach(eventName => {
            uploadContainer.addEventListener(eventName, unhighlight, false);
        });

        function highlight(e) {
            uploadContainer.style.border = '2px dashed #000';
        }

        function unhighlight(e) {
            uploadContainer.style.border = '2px dashed #ccc';
        }

        uploadContainer.addEventListener('drop', handleDrop, false);

        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;
            
            if (files && files[0]) {
                const input = document.getElementById('imageInput');
                input.files = files;
                previewImage(input);
            }
        }
    </script>
</body>
</html>