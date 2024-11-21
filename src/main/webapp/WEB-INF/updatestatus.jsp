<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Status</title>
<link rel="stylesheet" href="css/status.css">

<style>

</style>
</head>
<body>
    <div class="sidebar">
        <div class="header-container">
            <img src="images/jata.png" alt="Logo" class="sidebar-logo">
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
