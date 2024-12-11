<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="header-container">
            <img src="images/jata.jpg" alt="Logo" class="sidebar-logo">
            <div class="header-text">
                <h1>TV PSS</h1>
                <h6>Management <br> Information System</h6>
            </div>
        </div>
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Activity</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <main>
        <div class="status-box">
            <h1>Dashboard</h1>
            <div class="search-container">
                <input type="text" class="search-bar" placeholder="Search for schools..." />
                <div class="action-buttons">
                    <button>Add New</button>
                    <button>Filter</button>
                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>School</th>
                        <th>Status</th>
                        <th>Studio Level</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><span class="school-link" data-equipment='["Camera", "Smartphone", "Green Screen", "Tripod", "Lighting"]'>Sekolah Menengah Kebangsaan Skudai</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="green"></span> Fully Equipped
                            </div>
                        </td>
                        <td>3</td>
                        <td class="action-icons">
                            <i class="edit">&#9998;</i>
                            <i class="delete">&#10060;</i>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><span class="school-link" data-equipment='["Smartphone"]'>Sekolah Menengah Kebangsaan Mutiara Rini</span></td>
                        <td>
                            <div class="status-indicator">
                                <span class="red"></span> Need Equipments
                            </div>
                        </td>
                        <td>1</td>
                        <td class="action-icons">
                            <i class="edit">&#9998;</i>
                            <i class="delete">&#10060;</i>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Popup -->
    <div id="equipment-popup" class="popup-container">
        <div class="popup">
            <div class="popup-header">
                <h3 id="popup-title">School Name</h3>
                <span class="close-button">&times;</span>
            </div>
            <div class="popup-content">
                <h4>List of Equipments</h4>
                <ul id="equipment-list"></ul>
                <div class="equipment-add-container">
                    <input type="text" id="new-equipment-input" placeholder="Enter new equipment">
                    <button id="add-equipment-button">+</button>
                </div>
                <button id="save-equipment-button" class="save-button">Save</button>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        // Selectors
        const schoolLinks = document.querySelectorAll('.school-link');
        const popup = document.getElementById('equipment-popup');
        const closeButton = popup.querySelector('.close-button');
        const equipmentList = document.getElementById('equipment-list');
        const popupTitle = document.getElementById('popup-title');
        const newEquipmentInput = document.getElementById('new-equipment-input');
        const addEquipmentButton = document.getElementById('add-equipment-button');
        const saveEquipmentButton = document.getElementById('save-equipment-button');

        // Variable to hold the current equipment list
        let currentEquipment = [];

        // Add click event listeners to each school link
        schoolLinks.forEach(link => {
            link.addEventListener('click', () => {
                const equipment = JSON.parse(link.dataset.equipment); // Parse the equipment list
                displayEquipmentPopup(link.textContent, equipment); // Pass school name and equipment
            });
        });

        // Close button event listener
        closeButton.addEventListener('click', hideEquipmentPopup);

        // Add new equipment to the list
        addEquipmentButton.addEventListener('click', () => {
            const newEquipment = newEquipmentInput.value.trim(); // Get the input value
            if (newEquipment) {
                currentEquipment.push(newEquipment); // Add to the equipment list
                updateEquipmentList(); // Update the UI
                newEquipmentInput.value = ''; // Clear the input field
            }
        });

        // Save the equipment list (for now, log it to the console)
        saveEquipmentButton.addEventListener('click', () => {
            console.log('Saved equipment list:', currentEquipment);
            hideEquipmentPopup();
        });

        // Function to display the popup with school name and equipment
        function displayEquipmentPopup(schoolName, equipment) {
            popupTitle.textContent = schoolName; // Update popup title
            currentEquipment = equipment; // Update the current equipment list
            updateEquipmentList(); // Populate the equipment list in the popup
            popup.style.display = 'block'; // Show the popup
        }

        // Function to hide the popup
        function hideEquipmentPopup() {
            popup.style.display = 'none';
        }

        // Function to update the equipment list in the popup
        function updateEquipmentList() {
            equipmentList.innerHTML = ''; // Clear the current list
            currentEquipment.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item; // Set the equipment name
                equipmentList.appendChild(li); // Add to the list
            });
        }
    </script>
</body>
</html>
