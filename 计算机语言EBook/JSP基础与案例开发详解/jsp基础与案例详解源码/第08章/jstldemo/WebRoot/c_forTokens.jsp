<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_forTokens</title>
	</head>

	<body>
	    forTokens遍历字符串：
		<c:forTokens items="bzc,ljs|wy|njy" delims=",||" var="item">
			<c:out value='${item}' />
		</c:forTokens>
		<br>
		forTokens遍历字符串：
		<c:forTokens items="(bzc ljs njy)----(wy)" delims="()" var="item">
			<c:out value="${item}" />
		</c:forTokens>
		<br>
	</body>
</html>