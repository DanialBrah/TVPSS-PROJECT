<!DOCTYPE html>
<html>
<head>
<title>TV PSS Version</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	margin: 0;
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	color: #212529;
}

.sidebar {
	width: 250px;
	background-color: #002a72;
	color: white;
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
	margin-bottom: 20px;
}

.sidebar-logo {
	width: 80px;
	height: auto;
	border-radius: 8px;
}

.header-text h1 {
	font-size: 1.5rem;
	margin: 0;
}

.header-text h6 {
	font-size: 0.85rem;
	color: #e0e0e0;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	margin: 10px 0;
}

.sidebar ul li a {
	text-decoration: none;
	color: white;
	display: block;
	padding: 10px 15px;
	border-radius: 5px;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.sidebar ul li a:hover {
	background-color: #0056b3;
	transform: translateX(5px);
}

.main-content {
	margin-left: 270px;
	padding: 30px;
}

.main-content h1 {
	color: #1d3557;
	margin-bottom: 30px;
	text-align: center;
	font-size: 2rem;
}

.criteria-box {
	background-color: #f8f9fa;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 850px;
	margin: 0 auto;
}

.criteria-box h2 {
	color: #495057;
	margin-bottom: 20px;
}

.criteria-box table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.criteria-box table th, .criteria-box table td {
	padding: 15px;
	text-align: left;
}

.criteria-box table td:first-child {
	font-weight: bold;
}

.toggle-switch {
	position: relative;
	display: inline-block;
	width: 50px;
	height: 25px;
}

.toggle-switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #dc3545;
	transition: 0.4s;
	border-radius: 25px;
}

.slider:before {
	position: absolute;
	content: '';
	height: 18px;
	width: 18px;
	left: 4px;
	bottom: 3px;
	background-color: white;
	transition: 0.4s;
	border-radius: 50%;
}

input:checked+.slider {
	background-color: #28a745;
}

input:checked+.slider:before {
	transform: translateX(25px);
}

.version-display {
	text-align: center;
	font-size: 1.2rem;
	padding: 15px;
	background: #e9ecef;
	border-radius: 5px;
	margin-bottom: 20px;
}

.save-button {
	display: inline-block;
	background-color: #1d3557;
	color: white;
	padding: 10px 30px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	transition: background-color 0.3s;
}

.save-button:hover {
	background-color: #152c48;
}

.status-message {
	text-align: center;
	font-size: 1rem;
	margin-top: 20px;
	padding: 10px;
	border-radius: 5px;
}

.alert-success {
	background-color: #d4edda;
	color: #155724;
}

.alert-danger {
	background-color: #f8d7da;
	color: #721c24;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="header-container">
			<img src="${pageContext.request.contextPath}/images/jata.png" alt="Logo" class="sidebar-logo">
				alt="Logo" class="sidebar-logo">
			<div class="header-text">
				<h1>TV PSS</h1>
				<h6>
					Management <br> Information System
				</h6>
			</div>
		</div>
		<ul>
			<li><a href="/TVPSS/criteria/teacher2">Version</a></li>
			<li><a href="/TVPSS/equipment/teacher">Equipment</a></li>
			<li><a href="/TVPSS/teachers/activity">Activity</a></li>
			<li><a href="/TVPSS/teachers/news">News</a></li>
			<li><a href="/TVPSS/teachers/video">Video</a></li>
			
			<li><a href="/TVPSS/teachers/profile">Profile</a></li>
			<li><a href="/TVPSS/teachers/logout">Logout</a></li>
		</ul>
	</div>


	<div class="main-content">
		<h1>TV PSS Version</h1>
		<div class="criteria-box">
			<h2>Criteria</h2>
			<form id="criteriaForm">
				<input type="hidden" id="criteriaId" value="${criteria.id}">
				<table>
					<!-- Toggle rows dynamically -->
					<tr>
						<td>There is a name (brand)</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasName" name="hasName"
								${criteria.hasName ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>

					<tr>
						<td>Logo</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasLogo" name="hasLogo"
								${criteria.hasLogo ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>
					<tr>

						<td>Corner/Mini Studio/TV Studio</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasStudio" name="hasStudio"
								${criteria.hasStudio ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>
					<tr>
						<td>In-School Recording</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasInSchoolRecording"
								name="hasInSchoolRecording"
								${criteria.hasInSchoolRecording ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>
					<tr>
						<td>Upload on YouTube</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id=" hasYoutubeUpload" name="hasYoutubeUpload"
								${criteria.hasYoutubeUpload ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>
					<tr>
						<td>Recording inside and outside the school</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasOutsideRecording"
								name="hasOutsideRecording"
								${criteria.hasOutsideRecording ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>
					<tr>
						<td>Collaborate with external agencies</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasExternalCollaboration"
								name="hasExternalCollaboration"
								${criteria.hasExternalCollaboration ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>
					<tr>
						<td>Using Green Screen Technology</td>
						<td><label class="toggle-switch"> <input
								type="checkbox" id="hasExternalCollaboration"
								name="hasGreenScreen"
								${criteria.hasGreenScreen ? 'checked' : ''}
								onchange="handleToggleChange()"> <span class="slider"></span>
						</label></td>
					</tr>


				</table>


				<div class="version-display">
					Version: <span id="versionNumber">${criteria.version}</span>
				</div>
				<button type="button" class="save-button" onclick="saveCriteria()">Save
					Changes</button>
				<div id="statusMessage"></div>
			</form>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
    function handleToggleChange() {
        const form = document.getElementById('criteriaForm');
        const inputs = form.querySelectorAll('input[type="checkbox"]');
        let version = 0;
        
        // Calculate version based on criteria
        if (form.querySelector('[name="hasGreenScreen"]').checked) {
            version = 4;
        } else if (form.querySelector('[name="hasExternalCollaboration"]').checked) {
            version = 3;
        } else if (form.querySelector('[name="hasOutsideRecording"]').checked && 
                   form.querySelector('[name="hasYoutubeUpload"]').checked) {
            version = 2;
        } else if (form.querySelector('[name="hasName"]').checked && 
                   form.querySelector('[name="hasLogo"]').checked && 
                   form.querySelector('[name="hasStudio"]').checked && 
                   form.querySelector('[name="hasInSchoolRecording"]').checked) {
            version = 1;
        }
        
        document.getElementById('versionNumber').textContent = version;
    }

    // Initialize toggle states on page load
    document.addEventListener('DOMContentLoaded', function() {
        handleToggleChange();
        
        // Add change event listeners to all checkboxes
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', handleToggleChange);
        });
    });

    function saveCriteria() {
        const form = document.getElementById('criteriaForm');
        const formData = new URLSearchParams();

        // Add criteriaId
        formData.append('criteriaId', document.getElementById('criteriaId').value);
        
        // Add all checkbox values
        const checkboxes = form.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            formData.append(checkbox.name, checkbox.checked);
        });
        
        // Add version
        formData.append('version', document.getElementById('versionNumber').textContent);

        // Send the request
        fetch('/TVPSS/criteria/save', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: formData.toString()
        })
        .then(response => response.json())
        .then(data => {
            // Create or get message element
            let messageBox = document.getElementById('statusMessage');
            if (!messageBox) {
                messageBox = document.createElement('div');
                messageBox.id = 'statusMessage';
                document.querySelector('.save-button').insertAdjacentElement('afterend', messageBox);
            }
            
            // Update message
            messageBox.className = 'alert ' + (data.success ? 'alert-success' : 'alert-danger');
            messageBox.textContent = data.message;
            messageBox.style.marginTop = '20px';
            
            // Remove message after 3 seconds
            setTimeout(() => {
                messageBox.remove();
            }, 3000);
        })
        
    }
    
    function saveToLocalStorage(toggleStates) {
        localStorage.setItem('toggleStates', JSON.stringify(toggleStates));
    }

    // Call this function whenever toggle states are updated
    saveToLocalStorage(toggleStates);

    document.addEventListener('DOMContentLoaded', () => {
        const savedStates = JSON.parse(localStorage.getItem('toggleStates')) || {};
        for (const key in savedStates) {
            const toggle = document.querySelector(`#${key}`);
            if (toggle) {
                toggle.checked = savedStates[key];
            }
        }
    });


    </script>
</body>
</html>