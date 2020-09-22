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
<link rel="stylesheet" href="css/style.css">
<title>All Complain Details</title>
</head>
<body>
	<%
		String name = request.getParameter("cname");
	Long id = (Long) request.getAttribute("id");
	//String complid= Long.toString(id);
	String email = (String) request.getAttribute("email");
	List<Complain> l = customerDAO.getAllDetails(email);
	%>
	<div style="position: absolute; top: 50px; right: 40px">
		<a href="login.jsp">Logout</a>
	</div>
	<h2 align="center"><%=name%>
		Complains Logs
	</h2>
	<table border="1">
		<tr>
			<th>Complain ID</th>
			<!-- <th>Customer Id</th> -->
			<!-- <th>Customer Email Id</th> -->
			<th>Complain Date</th>
			<th>Complain Type</th>
			<th>Complain Description</th>
			<th>Remarks</th>
			<th>Edit Complain</th>
			<th>Remove Complain</th>

		</tr>
		<%
			for (Complain c : l) {
		%>
		<tr>
			<td><%=c.getCmid()%></td>
			<%-- <td><%=c.getCustomer().getCid()%></td> --%>
			<%-- <td><%=c.getCmemail()%></td> --%>
			<td><%=c.getCdate()%></td>
			<td><%=c.getComptype()%></td>
			<td><%=c.getCompdesc()%></td>
			<td><%=c.getRemarks()%></td>
			<td><form action="CusController" method="post">
					<input type="hidden" name="cmid" value="<%=c.getCmid()%>">
					<input type="hidden" name="cname" value="<%=name%>"> <input
						type="hidden" name="cid" value="<%=c.getCustomer().getCid()%>">
					<input type="hidden" name="cmemail" value="<%=c.getCmemail()%>">
					<input type="hidden" name="compdesc" value="<%=c.getCompdesc()%>" //>
					<input type="submit" name="action" value="Modify">
				</form></td>
			<td><form action="CusController" method="post">
					<input type="hidden" name="cmid" value="<%=c.getCmid()%>">
					<input type="hidden" name="cmemail" value="<%=c.getCmemail()%>">
					<input type="submit" name="action" value="Remove">
				</form></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="7"><form action="CusController" method="post">
					<%
						request.setAttribute("cname", name);
					%>
					<input type="hidden" name="cid" value="<%=id%>"> <input
						type="hidden" name="cmemail" value="<%=email%>"> <input
						type="submit" name="action" value="AddComplain">
				</form></td>
		</tr>
	</table>


</body>
</html>