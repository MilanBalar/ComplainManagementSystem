<%@page import="java.util.Date"%>
<%@page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Complain Page</title>
</head>
<body>

	<%
		String s = (String) request.getAttribute("cname");
	//String s1=(String)request.getParameter("cname");
	Long cmid = (Long) request.getAttribute("cmid");
	Long id = (Long) request.getAttribute("cid");
	String email = (String) request.getAttribute("email");
	%>

	<h2 align="center">
		Welcome
		<%=s%>
	</h2>
	<h3 align="center">Complain Form</h3>
	<div style="position: absolute; top: 50px; right: 40px">
		<a href="login.jsp">Logout</a>
	</div>

	<form action="CusController" method="post">
		<table>
			<tr>
				<td>Customer Id</td>
				<input type="hidden" name="cmid" value="<%=cmid%>">
				<input type="hidden" name="cname" value="<%=s%>">
				<td><input type="text" name="cid" value="<%=id%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="cmemail" value="<%=email%>"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>Complain Date</td>
				<td><input type="text" name="comdate" value="<%=new Date()%>"></td>
			</tr>
			<tr>
				<td>Complain Type</td>
				<td><select name="comptype">
						<option value="Garbage">Garbage</option>
						<option value="Water">Water</option>
						<option value="Air">Air</option>

				</select></td>
			</tr>
			<tr>
				<td>Complain Description</td>
				<td><input type="text" name="compdesc"></td>
			</tr>
			<tr>
				
				<td>
					<form action="CusController" method="post">
						<input type="hidden" name="cid" value="<%=id%>"> <input
							type="hidden" name="email" value="<%=email%>"> <input
							type="submit" name="action" value="ViewAll">
					</form>
				</td>
				<td colspan="1"><input type="submit" name="action"
					value="Complain" ></td>
			</tr>

		</table>
	</form>


</body>
</html>