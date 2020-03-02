<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_forEach</title>
	</head>

	<body>
	    循环输出1-8之间的数字：
		<c:forEach var="item" begin="1" end="8">
			<c:out value="${item}" />
		</c:forEach>
		<br>
		循环输出1-8之间的数字,步长2：
		<c:forEach var="item" begin="1" end="8" step="2">
			<c:out value='${item}' />
		</c:forEach>
		<br>
		forEach遍历字符串：
		<c:forEach items="bzc,ljs,wy,njy" var="item">
			<c:out value="${item}" />
		</c:forEach>
	</body>
</html>