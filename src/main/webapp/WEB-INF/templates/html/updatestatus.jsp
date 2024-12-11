<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Status</title>
<link rel="stylesheet" href="css/status.css">

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f6f9; /* Light background for better contrast */
}

.sidebar {
    width: 220px;
    background-color: #002a72;
    color: white;
    position: fixed;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;
}

.header-container {
    display: flex;
    align-items: center;
    gap: 10px;
}

.sidebar-logo {
    width: 100px;
    height: 70px;
    border-radius: 5px;
}

.header-text h1 {
    font-size: 20px;
    margin: 0;
}

.header-text h6 {
    font-size: 10px;
    margin: 0;
    line-height: 1.5;
    color: #e0e0e0;
}

.sidebar ul {
    list-style-type: none;
    padding: 70px 0 0 0;
    margin: 0;
}

.sidebar ul li {
    margin: 15px 0;
    padding: 10px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.sidebar ul li:hover {
    background-color: #0056b3;
    transform: translateX(5px);
    text-decoration: none;
}

.status-box {
    margin-left: 240px;
    padding: 30px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    border: 2px solid #002a72;
    width: calc(100% - 260px);
    box-sizing: border-box;
}

h2 {
    font-size: 28px;
    text-align: left;
    margin-bottom: 20px;
    color: #002a72;
    font-weight: bold;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: left;
    margin-bottom: 20px;
}

table td {
    padding: 15px 20px;
    font-size: 16px;
    vertical-align: middle;
    border-bottom: 1px solid #ddd;
    color: #333;
}

/* Toggle Switch Styling */
.toggle-switch {
    position: relative;
    width: 50px;
    height: 25px;
    display: inline-block;
}

.toggle-switch input {
    display: none;
}

.slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #f44336; /* Red */
    border-radius: 25px;
    transition: 0.4s;
}

.slider:before {
    position: absolute;
    content: "";
    height: 20px;
    width: 20px;
    border-radius: 50%;
    background-color: white;
    top: 2.5px;
    left: 3px;
    transition: 0.4s;
}

input:checked + .slider {
    background-color: #4caf50; /* Green */
}

input:checked + .slider:before {
    transform: translateX(25px);
}

/* Assistance Note Styling */
.assistance-note {
    margin-top: 20px;
    font-size: 16px;
    color: #002a72;
}

.assistance-note textarea {
    width: 100%;
    height: 120px;
    padding: 15px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 8px;
    resize: none;
    box-sizing: border-box;
    background-color: #f9f9f9;
    color: #333;
}

/* Submit Button Styling */
.submit-button {
    margin-top: 20px;
    padding: 12px 25px;
    background-color: #002a72;
    color: white;
    font-size: 18px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.submit-button:hover {
    background-color: #0056b3;
    transform: translateY(-3px);
}

@media screen and (max-width: 768px) {
    .sidebar {
        width: 180px;
    }

    .status-box {
        margin-left: 200px;
        width: calc(100% - 220px);
    }

    table td {
        font-size: 14px;
    }
}

@media screen and (max-width: 576px) {
    .sidebar {
        display: none;
    }

    .status-box {
        margin: 0;
        width: 100%;
        border: none;
        box-shadow: none;
    }

    h2 {
        text-align: center;
    }
}
</style>
</head>
<body>
    <div class="sidebar">
        <div class="header-container">
            <img src="images/jata.jpg" alt="Logo" class="sidebar-logo">
            <div class="header-text">
                <h1>TV PSS</h1>
                <h6>
                    Management <br> Information System
                </h6>
            </div>
        </div>
        <ul>
            <li>Contact</li>
            <li>Validation</li>
            <li>Content Library</li>
            <li>Timeline</li>
            <li>Notifications</li>
            <li>Status</li>
            <li>Log Out</li>
        </ul>
    </div>

    <main>
        <div class="status-box">
            <h2>
                School Status for <span style="text-transform: uppercase;">SEKOLAH KEBANGSAAN MAWAI</span>
            </h2>
            <table>
                <tr>
                    <td>Logo</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="logo-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Corner/Mini Studio/School PSS Studio</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="studio-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Recording in School</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="recording-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Upload in YouTube</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="upload-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Recording Inside/Outside the School</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="outside-recording-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Collaboration with External Agencies</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="collab-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>Use Green Screen Technology</td>
                    <td>
                        <label class="toggle-switch">
                            <input type="checkbox" id="greenscreen-status">
                            <span class="slider"></span>
                        </label>
                    </td>
                </tr>
            </table>
            <div class="assistance-note">
                <label for="assistance-note-text">Assistance Note:</label>
                <textarea id="assistance-note-text" placeholder="Write additional notes here..."></textarea>
            </div>
            <button class="submit-button" id="submit-button">Submit</button>
        </div>
    </main>

    <script>
        document.getElementById('submit-button').addEventListener('click', function () {
            const userConfirmed = confirm('Are you sure you want to submit this data?');
            if (userConfirmed) {
                alert('Data submitted successfully!');
                // Add your form submission or data handling logic here
            } else {
                alert('Submission canceled.');
            }
        });
    </script>
</body>
</html>
