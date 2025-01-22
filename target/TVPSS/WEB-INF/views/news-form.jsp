<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${news.newsId == null ? 'Add News' : 'Edit News'}</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], 
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: inherit;
        }
        textarea {
            min-height: 150px;
            resize: vertical;
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
            font-size: 16px;
        }
        .cancel-button {
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
        .cancel-button:hover {
            background-color: #5a6268;
        }
        .form-header {
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h1>${news.newsId == null ? 'Add News' : 'Edit News'}</h1>
        </div>
        
        <form action="<c:url value='/news/${news.newsId == null ? "add" : "edit/".concat(news.newsId)}'/>" method="post">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${news.title}" required maxlength="100">
            </div>
            
            <div class="form-group">
                <label for="content">Content:</label>
                <textarea id="content" name="content" required>${news.content}</textarea>
            </div>
            
            <div class="form-group">
                <label for="image">Image File Name:</label>
                <input type="text" id="image" name="image" value="${news.image}" placeholder="Enter image file name (e.g., image.jpg)" required>
            </div>
            
            <div class="button-group">
                <button type="submit" class="submit-button">
                    ${news.newsId == null ? 'Publish News' : 'Update News'}
                </button>
                <a href="<c:url value='/news'/>" class="cancel-button">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
