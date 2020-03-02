<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_if</title>
	</head>

	<body>
		<c:set var="username" value="1" />
		<c:if test="${username==1}">
 	  条件成立，执行此处
 	</c:if>
	</body>
</html>