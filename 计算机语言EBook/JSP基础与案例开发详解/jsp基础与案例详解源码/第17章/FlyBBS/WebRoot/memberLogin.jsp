<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/forum.css">
<title>��Ա��½</title>
</head>
<body>
<%@ include file="inc/top.jsp"%>
<form action="user" method="post">
	<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor='#777777'
		align=center>
		<tr>
			<td>
				<table cellpadding=6 cellspacing=1 border=0 width=100%>
					<tr>
						<td bgcolor='#99ccff' valign=middle colspan=2 align=center>
							<b>�����������û����������½</b>
						</td>
					</tr>
					<tr>
						<td bgcolor='#f2f8ff' valign=middle>
							�����������û���
						</td>
						<td bgcolor='#f2f8ff' valign=middle>
							<INPUT name=userName type=text>
							&nbsp;
							<a href="reg.jsp">û��ע�᣿</a>
						</td>
					</tr>
					<tr>
						<td bgcolor='#f2f8ff' valign=middle>
							��������������
						</td>
						<td bgcolor='#f2f8ff' valign=middle>
							<INPUT name=userPassword type=password>
							&nbsp;
							<a href="lostpass.jsp">�������룿</a>
						</td>
					</tr>
					<tr>
						<td bgcolor='#f2f8ff' valign=top width=30%>
							<b>Cookie ѡ��</b>
							<BR>
							��ѡ����� Cookie ����ʱ�䣬�´η��ʿ��Է������롣
						</td>
						<td bgcolor='#f2f8ff' valign=middle>
							<input type="radio" name="cookieDate" value="0" checked>
							�����棬�ر��������ʧЧ
							<br>
							<input type="radio" name="cookieDate" value="1">
							����һ��
							<br>
							<input type="radio" name="cookieDate" value="2">
							����һ��
							<br>
							<input type="radio" name="cookieDate" value="3">
							����һ��
							<br>
						</td>
					</tr>
					<input type='hidden' name='path' value='login'>
					<input type='hidden' name='type' value='admin'>
					<tr>
						<td bgcolor='#e8f4ff' valign=middle colspan=2 align=center>
							<input type=submit name="submit" value="�� ½">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<%@ include file="inc/foot.jsp"%>
</body>
</html>
