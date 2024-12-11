<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit News</title>
    <link rel="stylesheet" type="text/css" href="css/userDashboard.css">
    <style>
        /* ... other styles ... */
        .edit-news-card { /* Styles for the card container */
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            margin: 20px auto;
        }

        /* Styles for form elements within the card */
        .edit-news-form label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block; /* Ensures labels are on their own line */
        }

        .edit-news-form input[type="text"],
        .edit-news-form input[type="date"],
        .edit-news-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .edit-news-form textarea {
            height: 200px;
            resize: vertical;
        }

        .edit-news-form img { /* Style for the current news image */
            max-width: 100%;
            height: auto;
            display: block;
            margin-bottom: 15px;
        }

        .edit-news-form button {
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
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
        <div class="edit-news-card">
            <h2>Edit News</h2>
            <form class="edit-news-form" action="updateNewsServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="newsId" value="${news.id}">

                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${news.title}" required><br><br>

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" value="${news.date}" required><br><br>

                <label for="image">Image:</label>
                <input type="file" id="image" name="image" accept="image/*"><br><br> 
                <img src="images/news1.jpg" alt="Current News Image"><br><br> 

                <label for="content">Content:</label>
                <textarea id="content" name="content" required>${news.content}</textarea><br><br>

                <button type="submit">Save Changes</button>
            </form>
        </div>
    </div>
</body>
</html>
