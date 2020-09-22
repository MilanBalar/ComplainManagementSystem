<html>
<head>
<title>Customer Support System</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h2 align="center">Customer Registration form</h2>
	<form action="CusController" method="post">
		<table>
			<tr>
				<td>Name</td>
				<td colspan="2"><input type="text" name="cname"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td colspan="2"><input type="text" name="cemail"></td>
			</tr>
			<tr>
				<td>Contact</td>
				<td colspan="2"><input type="text" name="ccontact"></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>Male<input type="radio" name="cgender" value="Male"></td>
				<td>Female<input type="radio" name="cgender" value="Female"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td colspan="2"><input type="password" name="cpassword"></td>
			</tr>
			<tr>
				<td>City</td>
				<td colspan="2"><select name="ccity">
					<option>Ahemdabad</option>
					<option>Baroda</option>
					<option>Bharuch</option>
					<option>Anand</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" name="action" value="Register"></td>
			</tr>
		</table>
	</form>
	<a href="login.jsp">Existing User Login</a>
</body>
</html>
