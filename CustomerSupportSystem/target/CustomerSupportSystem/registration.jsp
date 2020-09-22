<html>
<head>
<title>Customer Support System</title>
</head>
<body>
	<h2>Customer Registration form</h2>
	<form action="CusController" method="post">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="cname"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="cemail"></td>
			</tr>
			<tr>
				<td>Contact</td>
				<td><input type="text" name="ccontact"></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>Male<input type="radio" name="cgender" value="Male"></td>
				<td>Female<input type="radio" name="cgender" value="Female"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="cpassword"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><select name="ccity">
					<option>Ahemdabad</option>
					<option>Baroda</option>
					<option>Bharuch</option>
					<option>Anand</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" name="action" value="Sing Up"></td>
			</tr>
		</table>
	</form>

</body>
</html>
