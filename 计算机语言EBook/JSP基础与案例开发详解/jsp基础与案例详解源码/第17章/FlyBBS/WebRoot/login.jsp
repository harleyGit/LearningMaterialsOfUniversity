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
						����������
						<font color=red><b>${today }</b> </font> | ����������
						<b>${maxZhuTi }</b> | ����������
						<b>${maxbbs }</b>
						<br>
						ע���Ա
						<B>${usernum }</B> | ��ӭ�»�Ա
						<a href=javascript:openUser('${lastuser.userName }')> <font
							color=#ff0000>${lastuser.userName }</font> </a> ���뱾��̳
						<p>
							<img src="pic/time.gif">
							<font color="#666666" id="timeBox"
								title="��ǰ������ʱ�䣬�����ʾ���ػ���ҳʱ��ʱ�����ƫ���ˢ�¾���������ʾ" face="Arial"></font>
							
							<img src=pic/userlist1.gif>
							<a href="user?path=serch&type=top">�û��б�</a>
							
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
							<a href="register.jsp">û��ע�᣿</a>
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
					<tr>
						<td bgcolor='#e8f4ff' valign=middle colspan=2 align=center>
							<input type=submit name="submit" value="�� ½">
                            <input type=button name="button" value="�� ��" onclick="javascript:history.go(-1)">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>

<%@ include file="inc/foot.jsp"%>

