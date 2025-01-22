<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty news.newsId ? 'Add New News' : 'Edit News'}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">${empty news.newsId ? 'Add New News' : 'Edit News'}</h2>
                </div>
                <div class="card-body">
                <p>${error}</p>
				<form:form action="${pageContext.request.contextPath}${empty news.newsId ? '/news/add' : '/news/edit/'.concat(news.newsId)}"
				           method="post" 
				           modelAttribute="news" 
				           enctype="multipart/form-data"
				           class="needs-validation"
				           novalidate="true">
                        
                        <c:if test="${not empty news.newsId}">
                            <form:hidden path="newsId"/>
                        </c:if>

                        <div class="mb-3">
                            <label for="title" class="form-label">Title</label>
                            <form:input path="title" class="form-control" required="true"/>
                            <form:errors path="title" class="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="content" class="form-label">Content</label>
                            <form:textarea path="content" class="form-control" rows="5" required="true"/>
                            <form:errors path="content" class="text-danger"/>
                        </div>

                        <div class="mb-3">
                            <label for="school" class="form-label">School</label>
                            <form:select path="school.id" class="form-select" required="true">
                                <option value="">-- Select School --</option>
                                <c:forEach items="${schools}" var="school">
                                    <option value="${school.id}" ${news.school.id == school.id ? 'selected' : ''}>
                                        ${school.name}
                                    </option>
                                </c:forEach>
                            </form:select>
                            <form:errors path="school" class="text-danger"/>
                        </div>

						<div class="mb-3">
						    <label for="imageFile" class="form-label">Image</label>
						    <input type="file" name="imageFile" class="form-control" accept="image/*"/>
						</div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">
                                ${empty news.newsId ? 'Add News' : 'Update News'}
                            </button>
                            <a href="${pageContext.request.contextPath}/news" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
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