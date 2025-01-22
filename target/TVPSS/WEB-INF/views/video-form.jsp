<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${video.videoId == null ? 'Add New Video' : 'Edit Video'}</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-group {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
        .submit-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .cancel-button {
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
        .cancel-button:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${video.videoId == null ? 'Add New Video' : 'Edit Video'}</h1>
        
        <form action="<c:url value='/videos/${video.videoId == null ? "add" : "edit/".concat(video.videoId)}'/>" method="post">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${video.title}" required>
            </div>
            
            <div class="form-group">
                <label for="url">URL:</label>
                <input type="text" id="url" name="url" value="${video.url}" required>
            </div>
            
            <div class="form-group">
                <label for="school">School:</label>
                <select id="school" name="school.id" required>
                    <c:forEach items="${schools}" var="school">
                        <option value="${school.id}" ${video.school.id == school.id ? 'selected' : ''}>
                            ${school.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="button-group">
                <button type="submit" class="submit-button">
                    ${video.videoId == null ? 'Add Video' : 'Update Video'}
                </button>
                <a href="<c:url value='/videos'/>" class="cancel-button">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>