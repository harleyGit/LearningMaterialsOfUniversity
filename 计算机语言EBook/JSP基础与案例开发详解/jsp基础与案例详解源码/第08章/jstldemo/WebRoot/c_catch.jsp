<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_catch</title>
	</head>

	<body>
		<c:catch var="exception">
			<%
				int[] nums = new int[5];
					System.out.println(nums[5]);
			%>
		</c:catch>
		输出异常：
		<c:out value="${exception}"></c:out>
		<br>
		异常 exception.message ：
		<c:out value="${exception.message}"></c:out>
		<br>
		异常 exception.cause ：
		<c:out value="${exception.cause}"></c:out>
		<br>
		异常 exception.stackTrace ：
		<c:out value="${exception.stackTrace}" />
	</body>
</html>
