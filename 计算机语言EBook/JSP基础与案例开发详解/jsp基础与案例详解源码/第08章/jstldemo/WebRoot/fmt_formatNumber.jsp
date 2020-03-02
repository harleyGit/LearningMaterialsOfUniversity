<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title>fmt_format</title>
	</head>

	<body>
		<fmt:formatNumber value="12" type="currency" pattern=".00元"/> <br>
		
		<fmt:formatNumber value="12" type="currency" pattern=".0#元"/> <br>
		
		<fmt:formatNumber value="1234567890" type="currency"/> <br>
		
		<fmt:formatNumber value="123456.7891" pattern="#,#00.0#"/><br>
		
		<fmt:formatNumber value="12" type="percent" /><br>
		
		<fmt:formatNumber value="500000.01" groupingUsed="false" /><br>
		
		<fmt:formatNumber value="98.6" minIntegerDigits="4"/><br>
		
		<fmt:formatNumber value="98.6" minIntegerDigits="4" groupingUsed="false"/><br>
		
		<fmt:formatNumber value="3.141592653589" maxFractionDigits="2"/><br>
		
	</body>
</html>