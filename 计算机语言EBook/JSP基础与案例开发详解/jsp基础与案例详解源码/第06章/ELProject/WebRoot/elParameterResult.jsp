<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>el_param2</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		用户名： ${param.username }
		<br>
		爱好： ${paramValues.likes[0]}&nbsp;&nbsp;
		${paramValues.likes[1]}&nbsp;&nbsp;${paramValues.likes[2]}
		<br>
	</body>
</html>
