<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TV PSS - News</title>
    <link rel="stylesheet" type="text/css" href="css/userDashboard.css">
    <style>
        /* ... other styles ... */
        .news-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            grid-gap: 20px;
        }

        .news-card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .news-card img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
            border-radius: 5px; /* Rounded corners for the image */
        }

        .news-card .news-date-location { /* Style for date and location */
            font-size: 0.9em;
            color: #777; /* A slightly lighter color */
            margin-top: 5px;
        }

        .news-card .news-description {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="header-container">
            <img src="images/jata.png" alt="Logo" class="sidebar-logo">
            <div class="header-text">
                <h1>TV PSS</h1>
                <h6>Management Information System</h6>
            </div>
        </div>
        <ul>
            <li>Contact</li>
            <li>Validation</li>
            <li>Content Library</li>
            <li>Timeline</li>
            <li>Notifications</li>
            <li>Log Out</li>
        </ul>
    </div>

    <div class="content">
        <div class="news-header">
            <h2>News</h2>
            <div class="language-switcher">
                <span>BM</span> | <span>Eng</span>
            </div>
        </div>

        <div class="search-container">
            <input type="text" placeholder="Search News">
            <button type="button">🔍</button>
        </div>

        <div class="news-list">
            <div class="news-card">
                <img src="images/news1.jpg" alt="News 1">
                <h4>New Educational Resources</h4>
                <p class="news-description">New digital resources for various subjects and grade levels are now available. Explore interactive lessons, videos, and more to enhance learning.</p>
                <div class="news-date-location">
                    <span><b>Date:</b> 2024-12-15</span> |
                    <span><b>Location:</b> Online</span>
                </div>
                <button class="edit-btn" onclick="location.href='editNews.jsp?id=1'">Edit</button>

            </div>
            <div class="news-card">
                <img src="images/news2.jpg" alt="News 2">
                <h4>Teacher Training Workshop</h4>
                <p class="news-description">Enhance your teaching skills with our upcoming workshop on integrating technology into the classroom. Learn practical strategies and best practices.</p>
                <div class="news-date-location">
                    <span><b>Date:</b> 2025-01-20</span> |
                    <span><b>Location:</b> School Auditorium</span>
                </div>
                <button class="edit-btn" onclick="location.href='editNews.jsp?id=2'">Edit</button>

            </div>
            <div class="news-card">
                <img src="images/news3.jpg" alt="News 3">
                <h4>School Performance Report</h4>
                <p class="news-description">The annual school performance report has been released, providing insights into student achievements, areas for improvement, and key initiatives.</p>
                <div class="news-date-location">
                    <span><b>Date:</b> 2024-11-29</span> |
                    <span><b>Location:</b> District Office</span>
                </div>
                <button class="edit-btn" onclick="location.href='editNews.jsp?id=3'">Edit</button> 

            </div>
        </div>

        <div class="year-selector">
            </div>
    </div>
    </div>
</body>
</html>
