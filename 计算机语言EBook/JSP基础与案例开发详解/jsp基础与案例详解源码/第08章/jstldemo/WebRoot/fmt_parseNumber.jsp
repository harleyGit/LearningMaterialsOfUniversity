<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title>fmt_format</title>
	</head>

	<body>
		<fmt:parseNumber value="12.00" type="number"/> <br>
		
		<fmt:parseNumber value="1,234,567,890.00 " type="number"/> <br>
		
		<fmt:parseNumber value="123,456.79" type="number"/><br>	
		
		<fmt:parseNumber value="12000%" type="number"/><br>	
		
	</body>
</html>