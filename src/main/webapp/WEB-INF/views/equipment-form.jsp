<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Equipment</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-4">
		<h2 class="text-center mb-4">Add New Equipment</h2>
		<form action="add" method="post">
			<!-- Equipment ID -->
			<div class="mb-3">
				<label for="equipmentId" class="form-label">Equipment ID</label> <input
					type="number" class="form-control" id="equipmentId"
					name="equipmentId" required>
			</div>

			<!-- Equipment Name -->
			<div class="mb-3">
				<label for="equipmentName" class="form-label">Equipment Name</label>
				<input type="text" class="form-control" id="equipmentName"
					name="equipmentName" required>
			</div>


			<!-- Quantity -->
			<div class="mb-3">
				<label for="quantity" class="form-label">Quantity</label> <input
					type="number" class="form-control" id="quantity" name="quantity"
					min="0" required>
			</div>

			<!-- Last Maintenance Date -->
			<div class="mb-3">
				<label for="lastMaintenanceDate" class="form-label">Last
					Maintenance Date</label> <input type="date" class="form-control"
					id="lastMaintenanceDate" name="lastMaintenanceDate" required>
			</div>

			<div class="mb-3">
				<label for="school" class="form-label">School</label> <select
					class="form-control" id="school" name="school.id" required>
					<option value="">Select a school</option>
					<c:forEach var="school" items="${schools}">
						<option value="${school.id}">${school.name}</option>
					</c:forEach>
				</select>
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-primary">Save Equipment</button>
			<a href="${pageContext.request.contextPath}/equipment"
				class="btn btn-secondary">Cancel</a>
		</form>
	</div>

	<script>
// Load schools for dropdown
   async function loadSchools() {
       try {
           const response = await fetch('/api/schools');
           const schools = await response.json();
           
           const schoolSelect = document.getElementById('school');
           schools.forEach(school => {
               const option = new Option(school.name, school.id);
               schoolSelect.add(option);
           });
       } catch (error) {
           console.error('Error loading schools:', error);
           alert('Error loading schools. Please try again.');
       }
   }
   </script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>