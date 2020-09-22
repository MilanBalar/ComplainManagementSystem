
<%@page import="com.DAO.customerDAO"%>
<%@page import="com.bean.Complain"%>
<%@page import="java.util.List"%>
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
		List<Complain> c = customerDAO.getAllComplainData();
	%>
	<h2 align="center">Welcome Admin</h2>
	<h3>All Complain</h3>
	<table border="1">
		<tr>
			<th>Complain Id</th>
			<th>Complain Date</th>
			<th>Complain Type</th>
			<th>Complain Description</th>
			<th>Complain Remarks</th>
			<th>Edit</th>
			<th>Delete</th>
		<tr>
			<%
				for (Complain co : c) {
			%>
		
		<tr>
			<td><%=co.getCmid()%></td>
			<td><%=co.getCdate()%></td>
			<td><%=co.getComptype()%></td>
			<td><%=co.getCompdesc()%></td>
			<td><%=co.getRemarks()%></td>
			<td>
				<form action="CusController" method="post">
					<input type="hidden" name="cmid" value="<%=co.getCmid()%>">
					<input type="submit" name="action" value="Update">
				</form>
			</td>
			<td><form action="CusController" method="post">
					<input type="hidden" name="cmid" value="<%=co.getCmid()%>">
					<input type="submit" name="action" value="Delete">
				</form></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>