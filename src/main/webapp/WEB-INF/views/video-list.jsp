<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Video List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f5f5f5;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .button {
            padding: 5px 10px;
            text-decoration: none;
            color: white;
            border-radius: 3px;
        }
        .add-button {
            background-color: #28a745;
            padding: 10px 20px;
            margin-bottom: 20px;
            display: inline-block;
        }
        .edit-button {
            background-color: #007bff;
        }
        .delete-button {
            background-color: #dc3545;
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Video List</h1>
        
        <a href="<c:url value='/videos/add'/>" class="button add-button">Add New Video</a>
        
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>School</th>
                    <th>URL</th>
                    <th>Uploaded By</th>
                    <th>Upload Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${videos}" var="video">
                    <tr>
                        <td>${video.title}</td>
                        <td>${video.school.name}</td>
                        <td>${video.url}</td>
                        <td>${video.uploadedBy.username}</td>
                        <td>
                            <fmt:parseDate value="${video.uploadedAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                            <fmt:formatDate value="${parsedDate}" pattern="MM/dd/yyyy HH:mm" />
                        </td>
                        <td class="actions">
                            <a href="<c:url value='/videos/edit/${video.videoId}'/>" class="button edit-button">Edit</a>
                            <a href="<c:url value='/videos/delete/${video.videoId}'/>" 
                               class="button delete-button" 
                               onclick="return confirm('Are you sure you want to delete this video?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>