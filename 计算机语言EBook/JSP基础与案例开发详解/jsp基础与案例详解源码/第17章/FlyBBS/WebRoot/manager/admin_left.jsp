<%@ page contentType="text/html;charset=GBK"%>
<link rel="stylesheet" type="text/css" href="../css/forum.css">
<table border="0" cellspacing="0" width="100%" cellpadding="0">
	<tr>
		<td height="20">
			<a href=${pageContext.request.contextPath}/manager/admin_main.jsp>������ҳ</a>
		</td>
	</tr>
	<tr>
		<td height="20">&nbsp;
			
		</td>
	</tr>
	<tr>
		<td bgcolor="#99ccff" height="20">
			<b>����Ա����</b>
		</td>
	</tr>
	<tr>
		<td height="20">
			<b>��̳����<b>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/board?path=boardinfo'>��̳����</a>
		</td>
	</tr>
    <tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/board?path=m_moderators'>��������</a>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/bbslink?path=tolink'>������̳����</a>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/bbsnew?path=newsinfo&id=0'>��̳�������</a>
		</td>
	</tr>

	<tr>
		<td height="20">
			<b>�û�����<b>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href="${pageContext.request.contextPath}/user?path=serch">�û�����</a>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href="${pageContext.request.contextPath}/config?path=serch">��Ǯ/����/����</a>
		</td>
	</tr>

	<tr>
		<td height="20">
			<b>ҳ����ʽ<b>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/config?path=toupdate'>��̳��������</a>
		</td>
	</tr>
<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/config?path=toupdate'>����Ȩ������</a>
		</td>
	</tr>

	<tr>
		<td height="20" bgcolor="#99ccff">
			<b><a href="user?path=admin_logout">�˳�����</a>
			</b>
		</td>
	</tr>
</table>
