<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Log In </title>
</head>
<body>
	<h1 align="center">Log In</h1>
<form action="CusController" method="post">
		<table>
			<tr>
				<td>User Type</td>
				<td><select name="user">	
					<option value="Customer">Customer</option>
					<option value="Administrator">Admin</option>
				</select></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="cemail"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="cpassword"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="action" value="SignIn"></td>
			</tr>
		</table>
	</form>
	<a href="registration.jsp">New Customer Registration</a>
</body>
</html>