<%@ page pageEncoding="utf-8"%>
<%@ page isErrorPage="true"%>
<html>
<head>
<title>500错误处理</title>
</head>
<body>
这是500错误处理页面。
<br>
异常信息<%=exception.getClass().getName() %>
</body>
</html>