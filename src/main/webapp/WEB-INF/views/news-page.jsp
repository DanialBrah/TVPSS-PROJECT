<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>News Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
body { :root { --primary-color:#002a72;
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

font-family
:
 
'
Poppins
'
,
sans-serif
;

            
background-color
:
 
#f9fafc
;

            
color
:
 
#333
;

        
}
.container {
	margin: 20px auto;
	max-width: 800px;
}

.add-button {
	display: inline-block;
	margin-bottom: 20px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.add-button:hover {
	background-color: #0056b3;
}

.news-card {
	background-color: white;
	border: none;
	border-radius: 10px;
	margin-bottom: 20px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	gap: 20px;
	align-items: center;
	height: 150px;
	overflow: hidden;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.news-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.news-title {
	font-size: 20px;
	font-weight: bold;
	color: #343a40;
	margin-bottom: 10px;
}

.news-content {
	font-size: 14px;
	color: #6c757d;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.news-image {
	width: 150px;
	height: 100%;
	object-fit: cover;
	border-radius: 10px;
}

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
</style>
</head>
<body>
<div class="sidebar">
        <div class="header-container">
			<img src="${pageContext.request.contextPath}/images/jata.png" alt="Logo" class="sidebar-logo">
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
	<div class="container">
		<h1 class="text-center">News List</h1>
		<a href="${pageContext.request.contextPath}/news/add"
			class="add-button">Add News</a>
		<div class="news-list">
			<c:forEach items="${newsList}" var="news">
				<c:if test="${news.status == 'Approved'}">
					<div class="news-card">
						<img src="${pageContext.request.contextPath}${news.image}"
							alt="News Image" class="news-image">
						<div>
							<div class="news-title">${news.title}</div>
							<div class="news-content">
								<c:choose>
									<c:when test="${fn:length(news.content) > 100}">
                                        ${fn:substring(news.content, 0, 100)}...
                                    </c:when>
									<c:otherwise>
                                        ${news.content}
                                    </c:otherwise>
								</c:choose>
							</div>
							<button class="btn btn-primary btn-sm mt-2"
								data-bs-toggle="modal" data-bs-target="#newsModal${news.newsId}">
								View Details</button>
						</div>
						<a
							href="${pageContext.request.contextPath}/news/edit/${news.newsId}"
							class="btn btn-warning btn-sm">Edit</a> <a
							href="${pageContext.request.contextPath}/news/delete/${news.newsId}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('Are you sure you want to delete this news?');">Delete</a>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="newsModal${news.newsId}" tabindex="-1"
						aria-labelledby="newsModalLabel${news.newsId}" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="newsModalLabel${news.newsId}">${news.title}</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<img src="${pageContext.request.contextPath}${news.image}"
										alt="News Image" class="news-image">
									<p>${news.content}</p>
									<small><strong>Posted By:</strong>
										${news.postedBy.username}</small><br> <small><strong>Posted
											At:</strong> ${news.postedAt}</small>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
