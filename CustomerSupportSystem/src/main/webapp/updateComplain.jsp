<%@page import="com.bean.Customer"%>
<%@page import="com.DAO.customerDAO"%>
<%@page import="com.bean.Complain"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>Update Complain</title>
</head>
<body>
	<%
		Long id = Long.parseLong(request.getParameter("cmid"));
		Complain c=customerDAO.getComplainById(id);
		
	%>
	<h2 align="center">Update Remarks </h2>
	<form action="CusController" method="post">
		<table>
			<tr>
				<td>Complain Id</td>
				<td><input type="text" name="cmid" value="<%=c.getCmid()%>" readonly></td>
			</tr>
			<tr>
				<td>Customer id</td>
				<td><input type="text" name="cust_id" value="<%=c.getCustomer().getCid()%>" readonly></td>
			</tr>
			<tr>
				<td>Customer name</td>
				<td><input type="text" name="cust_name" value="<%=c.getCustomer().getCname()%>" readonly></td>
			</tr>
			<tr>
				<td>Customer Email id </td>
				<td><input type="text" name="cmemail" value="<%=c.getCmemail()%>" readonly></td>
			</tr>
			<tr>
				<td>Complain Date</td>
				<td><input type="text" name="comdate" value="<%=c.getCdate()%>" readonly></td>
			</tr>
			<tr>
				<td>Complain Type</td>
				<td><input type="text" name="comptype" value="<%=c.getComptype()%>" readonly></td>
			</tr>
			<tr>
				<td>Complain Description</td>
				<td><input type="text" name="compdesc" value="<%=c.getCompdesc()%>" readonly></td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><input type="text" name="cremarks" value="<%=c.getRemarks()%>"></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" name="action" value="Edit"></td>
			</tr>
			
		</table>
	</form>
</body>
</html>