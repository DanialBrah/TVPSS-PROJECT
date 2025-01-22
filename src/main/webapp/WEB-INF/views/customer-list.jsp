w<%-- customer-list.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Customer List</h2>
        <a href="/TVPSS/customers/add" class="btn btn-primary mb-3">Add New Customer</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach items="${customers}" var="customer">
					<tr>
						<td>${customer.id}</td>
						<td>${customer.name}</td>
						<td>${customer.email}</td>
						<td>${customer.contactNum}</td>
						<td>${customer.address}</td>
						<td><a href="${pageContext.request.contextPath}/customers/edit/${customer.id}"
							class="btn btn-sm btn-warning">Edit</a> <a
							href="${pageContext.request.contextPath}/customers/delete/${customer.id}"
							class="btn btn-sm btn-danger"onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>

						</td>
					</tr>
				</c:forEach>
			</tbody>
        </table>
    </div>
</body>
</html>