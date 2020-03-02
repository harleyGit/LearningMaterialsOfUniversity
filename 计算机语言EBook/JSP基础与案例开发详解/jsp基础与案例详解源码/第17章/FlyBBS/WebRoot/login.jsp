<%@ page contentType="text/html;charset=GBK"%>
<link rel="stylesheet" type="text/css" href="css/forum.css">
<%@ include file="inc/top.jsp"%><br>
		<TABLE border=0 width=95% align=center>
			<TBODY>
				<TR>
					<TD align=left>
						<a href="http://www.justhis.com/"><img border=0
								src=pic/LOGO.GIF> </a>
					</TD>
					<TD Align=right>
						今日贴数：
						<font color=red><b>${today }</b> </font> | 主题总数：
						<b>${maxZhuTi }</b> | 帖子总数：
						<b>${maxbbs }</b>
						<br>
						注册会员
						<B>${usernum }</B> | 欢迎新会员
						<a href=javascript:openUser('${lastuser.userName }')> <font
							color=#ff0000>${lastuser.userName }</font> </a> 加入本论坛
						<p>
							<img src="pic/time.gif">
							<font color="#666666" id="timeBox"
								title="当前服务器时间，如果显示本地缓存页时此时间会有偏差，但刷新就能正常显示" face="Arial"></font>
							
							<img src=pic/userlist1.gif>
							<a href="user?path=serch&type=top">用户列表</a>
							
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<br>
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
							<a href="register.jsp">没有注册？</a>
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
					<tr>
						<td bgcolor='#e8f4ff' valign=middle colspan=2 align=center>
							<input type=submit name="submit" value="登 陆">
                            <input type=button name="button" value="返 回" onclick="javascript:history.go(-1)">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>

<%@ include file="inc/foot.jsp"%>

