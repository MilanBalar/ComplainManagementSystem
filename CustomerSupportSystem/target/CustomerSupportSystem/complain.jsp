<%@page import="java.util.Date"%>
<%@page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String s = (String) request.getAttribute("cname");
		Long id = (Long)request.getAttribute("cid");
		String email=(String)request.getAttribute("email");
	%>

	<h2 align="center">
		Welcome
		<%=s%>
	</h2>
	<form action="CusController" method="post">
		<table>
			<tr>
				<td>Customer Id</td>
				<td><input type="text" name="cid" value="<%=id%>"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="cmemail" value="<%=email%>"></td>
			</tr>
			<tr>
				<td>Complain Date</td>
				<td><input type="text" name="comdate" value="<%=new Date()%>"></td>
			</tr>
			<tr>
				<td>Complain Type</td>
				<td><select name="comptype">
						<option>Garbage</option>
						<option>Water</option>
						<option>Air</option>
				</select></td>
			</tr>
			<tr>
				<td>Complain Description</td>
				<td><input type="text" name="compdesc"></td>
			</tr>
			<tr>
				<td><input type="submit" name="action" value="Complain"></td>
			</tr>
			
		</table>
		<a href="complainView.jsp"><input type="hidden" name="cmemail" value="<%=email%>">View All Complain</a>
	</form>
		<form action="complainView.jsp" method="post">
		<%request.setAttribute("email", email); %>
		<input type="text" name="email" value="<%=email%>">
		<input type="submit" value="ViewAll">
		</form>
		
</body>
</html>