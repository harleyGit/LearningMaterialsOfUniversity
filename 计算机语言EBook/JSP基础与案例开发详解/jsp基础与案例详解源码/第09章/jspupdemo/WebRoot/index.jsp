<%@ page contentType="text/html;charset=gb2312"%>
<html>
	<head>
		<title>文件上载</title>
		<style>
input{border:1px solid green;}
</style>

	</head>
	<body>
		<form action="up.jsp" enctype="MULTIPART/FORM-DATA" method=post>
			作者:
			<input type="text" name="author" />
			<br />
			公司:
			<input type="text" name="company" />
			<br />
			选择要上载的文件
			<input type="file" name="filename" />
			<br />
			<input type="submit" value="上载" />
		</form>
	</body>
</html>
