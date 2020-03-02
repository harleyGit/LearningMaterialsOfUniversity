<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>JSTL_c_set</title>
	</head>
	<body>
		<c:set var="username" value="bzc" />
		输出无标题标签变量：
		<c:out value="${username}" />
		<br>
		<c:set var="bodyc" scope="session">
		body content
		</c:set>
		输出有标题标签变量：
		<c:out value="${bodyc}" />
		<br>
		<jsp:useBean id="userbean" class="org.bzc.bean.UserBean"></jsp:useBean>
		<c:set value="bzc" target="${userbean}" property="username" />
		无标签体-输出设置bean中属性name的值：
		<c:out value="${userbean.username}" />
		<br>
		<c:set target="${userbean}" property="username">
      bianzhicheng
    </c:set>
		有标签体-输出设置bean中属性name的值：
		<c:out value="${userbean.username}" />
		<br>
	</body>
</html>