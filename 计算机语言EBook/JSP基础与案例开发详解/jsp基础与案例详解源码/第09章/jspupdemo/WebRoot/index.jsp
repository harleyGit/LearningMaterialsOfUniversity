<%@ page contentType="text/html;charset=gb2312"%>
<html>
	<head>
		<title>�ļ�����</title>
		<style>
input{border:1px solid green;}
</style>

	</head>
	<body>
		<form action="up.jsp" enctype="MULTIPART/FORM-DATA" method=post>
			����:
			<input type="text" name="author" />
			<br />
			��˾:
			<input type="text" name="company" />
			<br />
			ѡ��Ҫ���ص��ļ�
			<input type="file" name="filename" />
			<br />
			<input type="submit" value="����" />
		</form>
	</body>
</html>
