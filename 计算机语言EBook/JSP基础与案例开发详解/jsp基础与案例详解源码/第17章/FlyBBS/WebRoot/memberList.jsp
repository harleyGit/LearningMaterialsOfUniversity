<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>��Ա�б�</title>
		<link rel="stylesheet" type="text/css" href="css/forum.css">
</head>
<c:if test="${sendOk eq 'SENDOK'}">
		 <script language="javascript">
 alert("�ѷ��ͳɹ�");
</script>
		</c:if>
	<body>
		<%@ include file="inc/top.jsp"%>
		<form method="POST" action="toplist.jsp">
			<table width=95% border=1 align="center" cellpadding=0 cellspacing=0 bordercolor="#99CCFF" class="t_member">
<tr>
					<td colspan=7 valign=top><BR>
						<font face=����>&nbsp;��ע���û����� 3 �� &nbsp; �������� 100ƪ</font>					</td>
					<td colspan=5 align=right>
						<select
							onchange="if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}">
							<option value="user?path=serch&type=top">
								�����û��б�							</option>
							<option value="user?path=search&type=user">
								����ע���û�							</option>
							<option value="user?path=search&type=forum">
								��������Top10							</option>
						</select>					</td>
				</tr>

				<tr>
					<td width="96" align=center>
						<b>�û�Ȩ��</b>					</td>
			        <td width="64" align=center><b>�û���</b></td>
		          <td width="64" align=center><strong>Email</strong></td>
<td width="38" align=center>
						<b>QQ</b>					</td>
	  <td width="60" align=center>
						<b><strong>����Ϣ</strong> </td>
			  <td width="135" align=center>
				  <b>ע��ʱ��</b></td>
	  <td width="90" align=center>
						<b>�û�����</b>					</td>
			  <td width="115" align=center>
						<b>��������</b>					</td>
			  </tr>
				<c:forEach items="${finduser}" var="list">
					<tr>
						<td><div align="center"><a href="javascript:" onClick="window.open('user?path=seluser&username=${list.userName}',350,300)">${list.nickName}</a> </div></td>
				        <td align=center><div align="center"><a href="javascript:" onClick="window.open('user?path=seluser&username=${list.userName}',350,300)">${list.userName}</a> </div></td>
			          <td align=center>

							<c:choose>
								<c:when test="${list.userEmail != null}">
							    <a href="mailto:${list.userEmail}"><img border=0 src="pic/email.gif" width="45" height="23"></a>								</c:when>
								<c:otherwise>
û��</c:otherwise>
							</c:choose>						</td>

						<td align=center>


							<c:choose>
								<c:when test="${list.qq != null}">
					        <a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=${list.qq}&Site=www.cyboys.com&Menu=yes><img src="pic/oicq.gif"
											alt="�� QQ:${list.qq} ����" border=0 width=16 height=16></a>								</c:when>
								<c:otherwise>
û��</c:otherwise>
							</c:choose>						</td>

						<td align=center>
							<a href="mess?path=talk&&uname=${list.userName}"> <img
									src=pic/message.gif border=0></a>						</td>
						<td align=center>
							${list.addDate}
							<br>						</td>
						<td align=center>
							${list.userEP}
							<br>						</td>
						<td align=center>
							${list.article}						</td>
					</tr>
				</c:forEach>
			</table>
	</form>
		<%@ include file="inc/foot.jsp"%>
	</body>
</html>
