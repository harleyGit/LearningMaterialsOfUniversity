<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title>fmt_format</title>
	</head>

	<body>
	    当前时间的三种表现形式如下：<br><br>
	    
		(1):<fmt:formatDate value="<%=new Date() %>" type="date"/><br><br>
		
		(2):<fmt:formatDate value="<%=new Date() %>" type="time"/><br><br>
		
		(3):<fmt:formatDate value="<%=new Date() %>" type="both"/>
	</body>
</html>