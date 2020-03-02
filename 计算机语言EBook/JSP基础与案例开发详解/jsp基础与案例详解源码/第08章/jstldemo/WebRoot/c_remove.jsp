<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_remove</title>
	</head>

	<body>
		<c:set var="username" value="bzc" />
		输出无标签体变量：
		<c:out value="${username}" />
		<br>
		<c:remove var="username" />
		输出执行remove命令后的变量：
		<c:out value="${username}">值为NULL，执行此处</c:out>
		<br>
	</body>
</html>