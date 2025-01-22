<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Equipment Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<style>
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

.container {
	margin-left: 270px;
	max-width: calc(100% - 290px);
	padding: 30px;
}

.page-header {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
}

.page-header h1 {
	color: var(--text-dark);
	margin: 0;
	font-size: 28px;
	font-weight: bold;
}

.search-add-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.search-container {
	display: flex;
	gap: 10px;
	width: 50%;
}

.table-container {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.table {
	margin-bottom: 0;
}

.table th {
	background-color: var(--primary-color);
	color: var(--text-light);
	font-weight: 600;
	padding: 15px;
}

.table td {
	padding: 15px;
	vertical-align: middle;
}

.equipment-image {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border-radius: 5px;
}

.btn-action {
	padding: 5px 15px;
	margin: 0 5px;
}

.btn-add {
	padding: 8px 20px;
	font-weight: 500;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="header-container">
			<img src="images/jata.png" alt="Logo" class="sidebar-logo">
			<div class="header-text">
				<h1>TV PSS</h1>
				<h6>
					Management<br>Information System
				</h6>
			</div>
		</div>
	  <ul>
			<li><a href="/TVPSS/schools">School</a></li>
			<li><a href="/TVPSS/criteria/admin">School Version</a></li>
			<li><a href="/TVPSS/teachers">Teacher</a></li>
			<li><a href="/TVPSS/equipment">Equipment</a></li>
			<li><a href="/TVPSS/crew">Crew</a></li>
			<li><a href="/TVPSS/videos">Video</a></li>
			<li><a href="/TVPSS/news">News</a></li>
			<li><a href="/TVPSS/activities">Activity</a></li>
			<li><a href="/TVPSS/login/validate">Logout</a></li>
		</ul>
	</div>

	<div class="container">
		<div class="page-header">
			<h1>Equipment Management</h1>
		</div>

		<div class="search-add-container">
			<div class="search-container">
				<input type="text" id="searchInput" class="form-control"
					placeholder="Search equipment...">
				<button class="btn btn-primary" onclick="searchEquipment()">
					<i class="fas fa-search"></i> Search
				</button>
			</div>
			<a href="/TVPSS/equipment/add" class="btn btn-primary btn-add"> <i
				class="fas fa-plus"></i> Add New Equipment
			</a>
		</div>
		
		<!-- Stats Summary -->
        <div class="stats-container">
            <div class="stat-card">
                <h3>${equipmentList.size()}</h3>
                <p>Total Equipment</p>
            </div>
            <div class="stat-card">
                <h3>${equipmentList.stream().filter(e -> e.status == 'Approved').count()}</h3>
                <p>Approved Equipment</p>
            </div>
            <div class="stat-card">
                <h3>${equipmentList.stream().filter(e -> e.status == 'Pending').count()}</h3>
                <p>Pending Approval</p>
            </div>
            <div class="stat-card">
                <h3>${equipmentList.stream().filter(e -> e.status == 'Disapproved').count()}</h3>
                <p>Disapproved Equipment</p>
            </div>
        </div>

        <!-- Filters -->
        <div class="filter-container">
            <form action="${pageContext.request.contextPath}/equipment/filter" method="get" class="filter-form">
                <div class="form-group">
                    <label for="schoolId" class="form-label">Filter by School</label>
                    <select class="form-select" id="schoolId" name="schoolId">
                        <option value="">All Schools</option>
                        <c:forEach var="school" items="${schools}">
                            <option value="${school.id}" ${school.id == selectedSchool ? 'selected' : ''}>
                                ${school.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="status" class="form-label">Filter by Status</label>
                    <select class="form-select" id="status" name="status">
                        <option value="">All Statuses</option>
                        <c:forEach var="statusOption" items="${statuses}">
                            <option value="${statusOption}" ${statusOption == selectedStatus ? 'selected' : ''}>
                                ${statusOption}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-filter"></i> Apply Filters
                    </button>
                    <a href="${pageContext.request.contextPath}/equipment" class="btn btn-secondary">
                        <i class="fas fa-undo"></i> Reset
                    </a>
                </div>
            </form>
        </div>

		<div class="table-container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Equipment Id</th>
						<th>Equipment Name</th>
						<th>Quantity</th>
						<th>Last Maintenance</th>
						<th>School Name</th>
						<th>Proof</th>
						<th>Actions</th>
						<th>Status</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${equipmentList}" var="equipment">
						<tr>
							<td>${equipment.equipmentId}</td>
							<td>${equipment.equipmentName}</td>
							<td>${equipment.quantity}</td>
							<td>${equipment.lastMaintenanceDate}</td>
							<td>${equipment.school.name}</td>
							<td>${equipment.status}</td>
							<td><img
								src="${pageContext.request.contextPath}/${equipment.imageUrl}"
								alt="Equipment" class="equipment-image"
								style="max-width: 100px; max-height: 100px;"></td>
							<td>
								<form
									action="${pageContext.request.contextPath}/equipment/approve/${equipment.equipmentId}"
									method="post" style="display: inline;">
									<button type="submit" class="btn btn-warning btn-action">
										<i class="fas fa-check"></i> Approve
									</button>
								</form>

								<form
									action="${pageContext.request.contextPath}/equipment/disapprove/${equipment.equipmentId}"
									method="post" style="display: inline;">
									<button type="submit" class="btn btn-danger btn-action">
										<i class="fas fa-times"></i> Disapprove
									</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
        function searchEquipment() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr');
            
            rows.forEach(row => {
                const equipmentName = row.children[2].textContent.toLowerCase();
                row.style.display = equipmentName.includes(input) ? '' : 'none';
            });
        }
    </script>
    
    <script>
    function searchEquipment() {
        const input = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('tbody tr');
        
        rows.forEach(row => {
            const equipmentName = row.children[1].textContent.toLowerCase(); // Updated index to match column
            row.style.display = equipmentName.includes(input) ? '' : 'none';
        });
    }

    // Add event listeners to all forms
    document.addEventListener('DOMContentLoaded', function() {
        const forms = document.querySelectorAll('form');
        forms.forEach(form => {
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                let action = 'approve';
                if (form.action.includes('disapprove')) {
                    action = 'disapprove';
                }
                
                if (confirm(`Are you sure you want to ${action} this equipment?`)) {
                    form.submit();
                }
            });
        });
    });
</script>
</body>
</html>