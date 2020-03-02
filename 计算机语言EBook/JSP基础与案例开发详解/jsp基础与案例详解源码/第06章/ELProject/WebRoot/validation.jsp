<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>验证运算和条件运算</title>
	</head>

	<body>
		<jsp:useBean id="user" class="org.el.demo.UserBean"/>
		<h3>
			UserBean的实例user的name是否为null ?   &nbsp;&nbsp;result： &nbsp;${empty user.name}
		</h3>
		<h3>
			条件表达式user.name==null ?"bzc":user.name  &nbsp;&nbsp;result： &nbsp;${user.name==null ?"bzc":user.name}
		</h3>
	</body>
</html>
