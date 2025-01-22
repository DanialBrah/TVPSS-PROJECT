<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - School Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="animated-background">
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            
            
        </ul>
    </div>

    <div class="container">
        <div class="login-container" style="background-image: url('${pageContext.request.contextPath}/images/lib.png');">
        
            <h1 class="brand-title">TVPSS<br> Management Information System</h1>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            
            <form action="/TVPSS/login/validate" method="POST">
                <div class="mb-4">
                    <label for="username" class="form-label">
                        <i class="fas fa-user me-2"></i>Username
                    </label>
                    <div class="input-group">
                        <input type="text" 
                               class="form-control" 
                               id="username" 
                               name="username" 
                               required
                               autocomplete="username"
                               placeholder="Enter your username">
                        <span class="input-icon">
                            <i class="fas fa-check-circle text-success d-none" id="usernameValid"></i>
                        </span>
                    </div>
                    <div class="error-message" id="usernameError"></div>
                </div>
                
                <div class="mb-4">
                    <label for="password" class="form-label">
                        <i class="fas fa-lock me-2"></i>Password
                    </label>
                    <div class="input-group">
                        <input type="password" 
                               class="form-control" 
                               id="password" 
                               name="password" 
                               required
                               autocomplete="current-password"
                               placeholder="Enter your password">
                        
                    </div>
                    <div class="error-message" id="passwordError"></div>
                </div>
                
                
                
                <button type="submit" class="btn btn-primary btn-login w-100 mb-3">
                    <i class="fas fa-sign-in-alt me-2"></i>Sign In
                </button>
                
                <!-- New "Log in as Guest" button -->
                <a href="/TVPSS/student/dashboard" class="btn btn-primary btn-login w-100 mb-3" role="button">
                    <i class="fas fa-user-friends me-2"></i>Log in as Guest
                </a>
                
                
            </form>
        </div>
    </div>
</body>
</html>
