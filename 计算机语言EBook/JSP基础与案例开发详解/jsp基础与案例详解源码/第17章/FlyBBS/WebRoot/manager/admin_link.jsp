<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>��̳--����ҳ��</title>
<link rel="stylesheet" type="text/css" href="css/forum.css">

<BODY bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333"
	topmargin="20">
	<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor='#777777'
		align=center>
		<tr>
			<td>
				<table cellpadding=3 cellspacing=1 border=0 width=100%>
					<tr bgcolor='#e8f4ff'>
						<td colspan="2" align=center bgcolor="#99ccff">
							��ӭ
							<b> ${admin_name}</b>�������ҳ��
						</td>
					</tr>
					<tr bgcolor='#f2f8ff'>

						<td width="20%" valign=top>
							<%@include file="admin_left.jsp"%>
						</td>

						<td width="80%" valign=top>
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr>
									<td>
										ע�����
										<br>
										�����棬��������Ŀǰ���е�������̳�������Ա༭������̳����������һ���µ�������̳��
										Ҳ���Ա༭��ɾ��Ŀǰ���ڵ�������̳�������Զ�Ŀǰ���������½������С�
									</td>
								</tr>
							</table>

							<br>
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr bgcolor="#e8f4ff">
									<td height="22" bgcolor="#99ccff">
										<a href="bbslink?path=toadd">�����µ�������̳</a>
									</td>
								</tr>
							</table>

							<c:if test="${action=='manager'}">
								<!-- ѭ����ʼ -->
								<c:forEach items="${bbslink}" var="bbslink">
									<hr width=60% align=left color=black height=1>
									<table width="100%" border="0" cellspacing="3" cellpadding="0">
										<tr>
											<td>
												������̳���ƣ�${bbslink.boardname }
											</td>
										</tr>
										<tr>
											<td>
												������̳ URL��${bbslink.url }
											</td>
										</tr>
										<tr>
											<td>
												������̳��飺${bbslink.readme }
											</td>
										</tr>
										<tr align="left" valign="bottom">
											<td height="27">
												<a href="bbslink?path=toupdate&id=${bbslink.id }">�༭��������̳</a>
												|
												<a href="bbslink?path=del&id=${bbslink.id }">ɾ����������̳</a> |
												<a href="admin_link.jsp?action=orders&id=${bbslink.id }">������̳��������</a>
											</td>
										</tr>
									</table>
								</c:forEach>
								<hr width=60% align=left color=black height=1>
								<!-- ѭ������ -->
							</c:if>

							<!-- ���������µ�������̳��ִ������ -->
							<c:if test="${action=='add'}">
								<form action="bbslink?path=add" method=post>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="30%">
												<div align="center">
													��̳���ƣ�
												</div>
											</td>
											<td width="70%">
												<input type="text" name="name" size=40>
											</td>
										</tr>
										<tr>
											<td width="30%">
												<div align="center">
													����URL��
												</div>
											</td>
											<td width="70%">
												<input name="textfield" type="text" value="HTTP://" size="7"
													readonly="readonly">
												<input type="text" name="url" size=31>
												<label></label>
											</td>
										</tr>
										<tr>
											<td height="15" width="30%">
												<div align="center">
													��̳��飺
												</div>
											</td>
											<td height="15" width="70%">
												<input type="text" name="readme" size=40>
											</td>
										</tr>
										<tr>
											<td height="15" colspan="2">
												<div align="center">
													<input type="submit" name="Submit" value=" �� �� ">
													<input type="reset" name="Submit2" value=" �� �� ">

												</div>
											</td>
										</tr>
									</table>
								</form>
							</c:if>

							<!-- ������޸���ִ��������� -->
							<c:if test="${action=='edit'}">
								<form action="bbslink?path=update" method=post>
									<input type=hidden name=id value=${bbslink.id}>
									<table width="100%" border="0" cellspacing="3" cellpadding="0">
										<tr>
											<td>
												������̳���ƣ�
												<input type="text" name="name" size=40
													value=${bbslink.boardname }>
											</td>
										</tr>
										<tr>
											<td>
												������̳ URL��
												<input type="text" name="url" size=40 value=${bbslink.url }>
											</td>
										</tr>
										<tr>
											<td>
												������̳��飺
												<input type="text" name="readme" size=40
													value=${bbslink.readme }>
											</td>
										</tr>
										<tr>
											<td height="15" colspan="2">
												<div align="center">
													<input type="submit" name="Submit" value=" �� �� ">
													<input type="reset" name="Submit2" value=" �� �� ">
												</div>
											</td>
										</tr>
									</table>
								</form>
							</c:if>
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr bgcolor='#e8f4ff'>
									<td height="20" bgcolor="#99ccff">
										<a href="bbslink?path=toadd">�����µ�������̳</a>
									</td>
								</tr>
							</table>
							<br>
							<br>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</BODY>


<html>
	<head>
	</head>
	<body>
		<p align="center">
			��Ȩ���У� Fly �汾��Ver0.1
		</p>
	</body>
</html>