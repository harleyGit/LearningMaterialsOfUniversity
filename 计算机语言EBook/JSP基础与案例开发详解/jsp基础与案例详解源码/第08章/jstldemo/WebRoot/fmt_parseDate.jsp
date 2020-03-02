<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title>fmt_format</title>
	</head>

	<body>
	    将时间字符串解析为Date对象：<br><br>
		<fmt:parseDate value="07/09/08" pattern="MM/dd/yy" /><br><br>
		<fmt:parseDate value="2008年7月9日 23:20" pattern="yyyy年MM月dd日 HH:mm" />
	</body>
</html>