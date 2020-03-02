<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>hello</title>
	</head>
	<%!int i = 2;%>
	<body>
		<h1><%=9 + 9%></h1>
		<%
			if (i> 3) {
		%>
		<h2>
			success
		</h2>
		<%
			} else {
		%>
		    error
		<%
			}
		%>
	</body>
</html>
