<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Equipment List</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">

</head>
<body>
	<div class="container mt-4">
		<h1>Equipment List</h1>

		<a href="/TVPSS/equipment/add" class="btn btn-primary mb-3">Add
			New Equipment</a>

		<table class="table table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>Equipment Id</th>
					<th>Equipment Name</th>
					<th>Quantity</th>
					<th>Last Maintenance Date</th>
					<th>School Name</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${equipmentList}" var="equipment">
					<tr>
						<td>${equipment.equipmentId}</td>
						<td>${equipment.equipmentName}</td>
						<td>${equipment.quantity}</td>
						<td>${equipment.lastMaintenanceDate}</td>

						<td>${equipment.school.name}</td>


						<td><a
							href="${pageContext.request.contextPath}/equipment/edit/${equipment.equipmentId}'/>"
							class="btn btn-sm btn-warning">Edit</a> <a
							href="${pageContext.request.contextPath}/equipment/delete/${equipment.equipmentId}'/>"
							class="btn btn-sm btn-danger"
							onclick="return confirm('Are you sure you want to delete this equipment?')">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>