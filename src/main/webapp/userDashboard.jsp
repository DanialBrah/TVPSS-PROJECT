<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Program Details Summary</title>
  <link rel="stylesheet" type="text/css" href="css/userDashboard.css">
  <style>
    .stats-container {
      display: flex;
      justify-content: space-around; /* Distribute space evenly around items */
      margin-bottom: 20px; /* Add some bottom margin for spacing */
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
    <h2>Program Details Summary</h2>
    
    <div class="stats-container">
      <div class="stat-box yellow">
        <h3>18,089</h3>
        <p>Students</p>
      </div>
      <div class="stat-box green">
        <h3>234</h3>
        <p>Teachers</p>
      </div>
      <div class="stat-box red">
        <h3>56</h3>
        <p>Schools</p>
      </div>
    </div>

    <h3>News Overview</h3>
        <div class="news-overview">
            <div class="news-card">
                <img src="images/news1.jpg" alt="News 1"> 
                <h4>New Educational Resources Available</h4>
                <p>...</p>
                <small>December 12, 2024</small>
            </div>

            <div class="news-card">
                <img src="images/news2.jpg" alt="News 2"> 
                <h4>Upcoming Teacher Training Workshop</h4>
                <p>...</p>
                <small>December 5, 2024</small>
            </div>

            <div class="news-card">
                <img src="images/news3.jpg" alt="News 3">
                <h4>School Performance Report Released</h4>
                <p>...</p>
                <small>November 28, 2024</small>
            </div>
        </div>


    <h3>Recent Activities</h3>
    <div class="activity-slider">
      <div class="activity-card">
        <img src="images/2.jpeg" alt="Activity 1">
        <p>Workshop on Digital Learning</p>
        <small>November 15, 2024</small>
      </div>
      <div class="activity-card">
        <img src="images/3.jpg" alt="Activity 2">
        <p>Teacher Training Program</p>
        <small>October 22, 2024</small>
      </div>
      <div class="activity-card">
        <img src="images/4.jpg" alt="Activity 3">
        <p>Student Innovation Expo</p>
        <small>September 5, 2024</small>
      </div>
      <div class="activity-card">
        <img src="images/5.jpg" alt="Activity 4">
        <p>Community Outreach Program</p>
        <small>August 18, 2024</small>
      </div>
    </div>

    <p style="text-align: center; margin-top: 20px;">
      <a href="#" style="color: #002a72; text-decoration: none; font-weight: bold;">
        Request Additional Information
      </a>
    </p>
  </div>
</body>
</html>
