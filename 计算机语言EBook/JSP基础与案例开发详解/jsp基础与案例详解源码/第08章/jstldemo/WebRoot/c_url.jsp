<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>urlÁ·Ï°</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	</head>
	<body>
		<c:url value="/content/search.jsp">; 
  <c:param name="keyword" value="xmh" />; 
  <c:param name="month" value="02/2003" />; 
</c:url>
		<hr />
		<a href="<c:url value='/content/sitemap.jsp'/>;">µ¥»÷´Ë´¦</a>; 
	</body>
</html>
