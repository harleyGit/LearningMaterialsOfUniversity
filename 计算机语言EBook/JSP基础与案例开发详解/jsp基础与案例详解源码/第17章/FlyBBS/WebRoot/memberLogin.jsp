<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/forum.css">
<title>会员登陆</title>
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
							<b>请输入您的用户名、密码登陆</b>
						</td>
					</tr>
					<tr>
						<td bgcolor='#f2f8ff' valign=middle>
							请输入您的用户名
						</td>
						<td bgcolor='#f2f8ff' valign=middle>
							<INPUT name=userName type=text>
							&nbsp;
							<a href="reg.jsp">没有注册？</a>
						</td>
					</tr>
					<tr>
						<td bgcolor='#f2f8ff' valign=middle>
							请输入您的密码
						</td>
						<td bgcolor='#f2f8ff' valign=middle>
							<INPUT name=userPassword type=password>
							&nbsp;
							<a href="lostpass.jsp">忘记密码？</a>
						</td>
					</tr>
					<tr>
						<td bgcolor='#f2f8ff' valign=top width=30%>
							<b>Cookie 选项</b>
							<BR>
							请选择你的 Cookie 保存时间，下次访问可以方便输入。
						</td>
						<td bgcolor='#f2f8ff' valign=middle>
							<input type="radio" name="cookieDate" value="0" checked>
							不保存，关闭浏览器就失效
							<br>
							<input type="radio" name="cookieDate" value="1">
							保存一天
							<br>
							<input type="radio" name="cookieDate" value="2">
							保存一月
							<br>
							<input type="radio" name="cookieDate" value="3">
							保存一年
							<br>
						</td>
					</tr>
					<input type='hidden' name='path' value='login'>
					<input type='hidden' name='type' value='admin'>
					<tr>
						<td bgcolor='#e8f4ff' valign=middle colspan=2 align=center>
							<input type=submit name="submit" value="登 陆">
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
