<%@page import="java.util.List"%>
<%@page import="com.DAO.customerDAO"%>
<%@page import="com.bean.Complain"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.Customer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Long id = (Long) request.getAttribute("id");
	String email = (String) request.getAttribute("email");
	out.println(email);
	List<Complain> l = customerDAO.getAllDetails(email);
	%>

	<h2 align="center">All Your Complain</h2>
	<table border="1">
		<tr>
			<th>Complain ID</th>
			<th>Complain Date</th>
			<th>Complain Type</th>
			<th>Complain Description</th>
			<th>Remarks</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%
			for (Complain c : l) {
		%>
		<tr>
			<td><%=c.getCmid()%></td>
			<td><%=c.getCdate()%></td>
			<td><%=c.getComptype()%></td>
			<td><%=c.getCompdesc()%></td>
			
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>