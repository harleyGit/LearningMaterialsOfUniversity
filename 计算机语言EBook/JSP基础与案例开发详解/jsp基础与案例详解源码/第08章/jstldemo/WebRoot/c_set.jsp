<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_set</title>
	</head>
	<body>
		<c:set var="username" value="bzc" />
		����ޱ����ǩ������
		<c:out value="${username}" />
		<br>
		<c:set var="bodyc" scope="session">
		body content
		</c:set>
		����б����ǩ������
		<c:out value="${bodyc}" />
		<br>
		<jsp:useBean id="userbean" class="org.bzc.bean.UserBean"></jsp:useBean>
		<c:set value="bzc" target="${userbean}" property="username" />
		�ޱ�ǩ��-�������bean������name��ֵ��
		<c:out value="${userbean.username}" />
		<br>
		<c:set target="${userbean}" property="username">
      bianzhicheng
    </c:set>
		�б�ǩ��-�������bean������name��ֵ��
		<c:out value="${userbean.username}" />
		<br>
	</body>
</html>