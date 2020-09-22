<%@page import="com.bean.Customer"%>
<%@page import="com.DAO.customerDAO"%>
<%@page import="com.bean.Complain"%>
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
		Long id = Long.parseLong(request.getParameter("cmid"));
		Complain c=customerDAO.getComplainById(id);
		
	%>
	<form action="CusController" method="post">
		<table>
			<tr>
				<td>Complain Id</td>
				<td><input type="text" name="cmid" value="<%=c.getCmid()%>"></td>
			</tr>
			<tr>
				<td>Customer ID</td>
				<td><input type="text" name="cust_id" value="<%=c.getCustomer().getCid()%>"></td>
			</tr>
			<tr>
				<td>Customer Email id </td>
				<td><input type="text" name="cmemail" value="<%=c.getCmemail()%>"></td>
			</tr>
			<tr>
				<td>Complain Date</td>
				<td><input type="text" name="comdate" value="<%=c.getCdate()%>"></td>
			</tr>
			<tr>
				<td>Complain Type</td>
				<td><input type="text" name="comptype" value="<%=c.getComptype()%>"></td>
			</tr>
			<tr>
				<td>Complain Description</td>
				<td><input type="text" name="compdesc" value="<%=c.getCompdesc()%>"></td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><input type="text" name="cremarks" value="<%=c.getRemarks()%>"></td>
			</tr>
			
			<tr>
				<td><input type="submit" name="action" value="Edit"></td>
			</tr>
			
		</table>
	</form>
</body>
</html>