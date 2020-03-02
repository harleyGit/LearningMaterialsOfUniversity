<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_out</title>
	</head>
	<body>
		<c:out value="无标签主体的输出---" />
		<br>
		<br>
		<c:out value="${name}">
value值为null时，输出我；
</c:out>
		<c:out value="<hr>原样输出HTML标签<hr>" escapeXml="true" />
		<c:out value="<hr>转换输出HTML标签<hr>" escapeXml="false" />
	</body>
</html>