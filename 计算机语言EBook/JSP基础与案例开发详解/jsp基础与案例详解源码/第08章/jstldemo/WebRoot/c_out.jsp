<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_out</title>
	</head>
	<body>
		<c:out value="�ޱ�ǩ��������---" />
		<br>
		<br>
		<c:out value="${name}">
valueֵΪnullʱ������ң�
</c:out>
		<c:out value="<hr>ԭ�����HTML��ǩ<hr>" escapeXml="true" />
		<c:out value="<hr>ת�����HTML��ǩ<hr>" escapeXml="false" />
	</body>
</html>