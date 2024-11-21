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
      display: flex;
      overflow-x: auto; /* Enable horizontal scrolling */
      scroll-snap-type: x mandatory; /* Snap to each news item */
    }

    .news-item {
      /* ... existing news-item styles ... */
      flex: 0 0 calc(33.33% - 20px); /* Each item takes 1/3 of the width - margins */
      margin: 0 10px; /* Add some space between items */
      scroll-snap-align: start; /* Snap to the start of each item */
      min-width: 200px; /* Minimum width of each news item for better appearance on smaller screens */
      
    }


  </style>
</head>
<body>
  <!-- ... sidebar and other content ... -->
  <div class="content">
    <!-- ... other content ... -->
    <div class="news-list">
      <div class="news-item">
        <img src="/api/placeholder/150/100" alt="News 1">
        <h4>Pertandingan Video Pendek 2022</h4>
        <button class="edit-btn">✎</button>
      </div>
      <div class="news-item">
        <img src="/api/placeholder/150/100" alt="News 2">
        <h4>Tiktok Merdeka Challenge 2022</h4>
        <button class="edit-btn">✎</button>
      </div>
      <div class="news-item">
        <img src="/api/placeholder/150/100" alt="News 3">
        <h4>Fotografi Lensa Budi</h4>
        <button class="edit-btn">✎</button>
      </div>
      <div class="news-item">  <!-- Example 4th news item -->
        <img src="/api/placeholder/150/100" alt="News 4">
        <h4>Karnival Irama Bentala Daksina 2022</h4>
        <button class="edit-btn">✎</button>
      </div>
      <div class="news-item">  <!-- Example 4th news item -->
        <img src="/api/placeholder/150/100" alt="News 4">
        <h4>Karnival Irama Bentala Daksina 2022</h4>
        <button class="edit-btn">✎</button>
      </div>
      <!-- Add more news items as needed -->
    </div>
    <!-- ... rest of content ... -->
  </div>
</body>
</html>
