<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer</title>
</head>
<body>
	<h1>Add Customer</h1>
	<form method="get" action="add1">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address" required></td>
			</tr>
			<tr>
				<td>Contact Number:</td>
				<td><input type="text" name="contactNum" required></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" required></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<button type="submit">Add Customer</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
