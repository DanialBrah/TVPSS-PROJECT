<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>${empty news.newsId ? 'Add New News' : 'Edit News'}</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
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
	background: linear-gradient(to bottom, var(--primary-color),
		var(--secondary-color));
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
</style>
</head>
<body class="container mt-5">
	<div class="sidebar">
		<div class="header-container">
			<img src="${pageContext.request.contextPath}/images/jata.png"
				alt="Logo" class="sidebar-logo">
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
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">
					<h2 class="text-center">${empty news.newsId ? 'Add New News' : 'Edit News'}</h2>
				</div>
				<div class="card-body">
					<form:form
						action="${pageContext.request.contextPath}${empty news.newsId ? '/news/add' : '/news/edit/'.concat(news.newsId)}"
						method="post" modelAttribute="news" enctype="multipart/form-data"
						class="needs-validation" novalidate="true">

						<c:if test="${not empty news.newsId}">
							<form:hidden path="newsId" />
						</c:if>

						<div class="mb-3">
							<label for="title" class="form-label">Title</label>
							<form:input path="title" class="form-control" required="true" />
							<form:errors path="title" class="text-danger" />
						</div>

						<div class="mb-3">
							<label for="content" class="form-label">Content</label>
							<form:textarea path="content" class="form-control" rows="5"
								required="true" />
							<form:errors path="content" class="text-danger" />
						</div>

						<div class="mb-3">
							<label for="school" class="form-label">School</label>
							<form:select path="school.id" class="form-select" required="true">
								<option value="">-- Select School --</option>
								<c:forEach items="${schools}" var="school">
									<option value="${school.id}"
										${news.school.id == school.id ? 'selected' : ''}>
										${school.name}</option>
								</c:forEach>
							</form:select>
							<form:errors path="school" class="text-danger" />
						</div>

						<div class="mb-3">
							<label for="imageFile" class="form-label">Image</label> <input
								type="file" name="imageFile" class="form-control"
								accept="image/*" />
						</div>

						<div class="d-grid gap-2">
							<button type="submit" class="btn btn-primary">${empty news.newsId ? 'Add News' : 'Update News'}
							</button>
							<a href="${pageContext.request.contextPath}/teachers/news"
								class="btn btn-secondary">Cancel</a>
						</div>
						<form:hidden path="status" />
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script>
		// Form validation
		(function() {
			'use strict'
			var forms = document.querySelectorAll('.needs-validation')
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}
					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>
</body>
</html>