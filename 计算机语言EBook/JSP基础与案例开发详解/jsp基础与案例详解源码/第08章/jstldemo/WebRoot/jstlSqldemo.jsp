<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--导入sql所需的标签库//-->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="ip" value="localhost" />
<!--设置数据库端口//-->
<c:set var="port" value="3306" />
<!--设置数据库的用户名//-->
<c:set var="user" value="root" />
<!--设置数据库的用户密码//-->
<c:set var="pwd" value="1234567" />
<!--设置数据库名//-->
<c:set var="db" value="person" />
<!--设置要操作的表名//-->
<c:set var="table" value="userinfo" />
<html>
	<head>
		<title>JSTL 操作数据库</title>
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
