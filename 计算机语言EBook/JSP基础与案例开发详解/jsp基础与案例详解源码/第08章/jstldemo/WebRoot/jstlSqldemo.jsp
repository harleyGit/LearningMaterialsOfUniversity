<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--����sql����ı�ǩ��//-->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="ip" value="localhost" />
<!--�������ݿ�˿�//-->
<c:set var="port" value="3306" />
<!--�������ݿ���û���//-->
<c:set var="user" value="root" />
<!--�������ݿ���û�����//-->
<c:set var="pwd" value="1234567" />
<!--�������ݿ���//-->
<c:set var="db" value="person" />
<!--����Ҫ�����ı���//-->
<c:set var="table" value="userinfo" />
<html>
	<head>
		<title>JSTL �������ݿ�</title>
	</head>
	<body bgcolor="#ffffff">
		<sql:setDataSource driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://${ip}:${port}/${db}?user=${user}&password=${pwd}" />
		<sql:query var="result">  
SELECT * FROM <c:out value="${table}" />
		</sql:query>
		<c:forEach var="row" items="${result.rowsByIndex}">
			<c:out value="${row[0]}" /> &nbsp;<c:out value="${row[1]}" />
			<br>
		</c:forEach>
	</body>
</html>
