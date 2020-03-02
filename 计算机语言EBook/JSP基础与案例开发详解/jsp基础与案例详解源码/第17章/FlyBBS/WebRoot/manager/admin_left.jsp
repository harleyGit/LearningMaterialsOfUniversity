<%@ page contentType="text/html;charset=GBK"%>
<link rel="stylesheet" type="text/css" href="../css/forum.css">
<table border="0" cellspacing="0" width="100%" cellpadding="0">
	<tr>
		<td height="20">
			<a href=${pageContext.request.contextPath}/manager/admin_main.jsp>管理首页</a>
		</td>
	</tr>
	<tr>
		<td height="20">&nbsp;
			
		</td>
	</tr>
	<tr>
		<td bgcolor="#99ccff" height="20">
			<b>管理员操作</b>
		</td>
	</tr>
	<tr>
		<td height="20">
			<b>论坛管理<b>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/board?path=boardinfo'>论坛管理</a>
		</td>
	</tr>
    <tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/board?path=m_moderators'>版主管理</a>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/bbslink?path=tolink'>联盟论坛管理</a>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/bbsnew?path=newsinfo&id=0'>论坛公告管理</a>
		</td>
	</tr>

	<tr>
		<td height="20">
			<b>用户管理<b>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href="${pageContext.request.contextPath}/user?path=serch">用户管理</a>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href="${pageContext.request.contextPath}/config?path=serch">金钱/经验/魅力</a>
		</td>
	</tr>

	<tr>
		<td height="20">
			<b>页面样式<b>
		</td>
	</tr>
	<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/config?path=toupdate'>论坛变量设置</a>
		</td>
	</tr>
<tr>
		<td height="20">
			--
			<a href='${pageContext.request.contextPath}/config?path=toupdate'>版主权限设置</a>
		</td>
	</tr>

	<tr>
		<td height="20" bgcolor="#99ccff">
			<b><a href="user?path=admin_logout">退出管理</a>
			</b>
		</td>
	</tr>
</table>
