<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>��̳--����ҳ��</title>
<link rel="stylesheet" type="text/css" href="css/forum.css">

<link href="../css/forum.css" rel="stylesheet" type="text/css">
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
							<b> ${admin_name }</b>�������ҳ��
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
										�����棬��������Ŀǰ�����������й��档�����Ա༭ԭ�й����������һ���µ���̳���档 Ҳ���Ա༭��ɾ��Ŀǰ���ڵĹ��档
									</td>
								</tr>
							</table>

							<br>

							<c:if test="${action=='manager'}">
								<!-- ��ʾ��ҳ���� -->
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="table">
									<tr>
										<td bgcolor="#99ccff" colspan="2">
											<a href="bbsnew?path=newsinfo&id=0">��ҳ����</a>|
											<a href="bbsnew?path=newsinfo&id=1">���Լ���</a> |
											<a href="bbsnew?path=newsinfo&id=2">������</a>
										</td>
									</tr>
									<br>
									<c:forEach items="${listBbsnews}" var="listBbsnews">

										<tr>
											<td colspan="2">
												<hr>
												������⣺${listBbsnews.title }
											</td>
										</tr>
										<tr>
											<td colspan="2">
												������ ��${listBbsnews.username } ����ʱ�䣺${listBbsnews.addtime }
											</td>
										</tr>
										<tr>
											<td width=10%>
												�������ݣ�
											</td>
											<td>
												${listBbsnews.content }
											</td>
										</tr>
										<tr align="left" valign="bottom">
											<td colspan="2">
												<a href="bbsnew?path=toupdate&id=${listBbsnews.id }">�༭�˹���</a>
												|
												<a
													href="bbsnew?path=dele&id=${listBbsnews.id}&bid=${listBbsnews.boardid}">ɾ���˹���</a>

											</td>
										</tr>

									</c:forEach>

								</table>
							</c:if>
							<!-- ���������¹�����ִ������ -->
							<c:if test="${action=='add'}">
								<form action="bbsnew?path=add" method=post>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="30%">
												<div align="center">
													������⣺
												</div>
											</td>
											<td width="70%">
												<input type="text" name="name" size=40>
											</td>
										</tr>
										<tr>
											<td width="30%">
												<div align="center">
													������飺
												</div>
											</td>
											<td width="70%">
												<select name="select">
													<option value="0" selected>
														��ҳ����
													</option>
													<c:forEach items="${listClass}" var="classtype">
														<option value="${classtype.id}">
															${classtype.classType}
														</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td height="15" width="30%">
												<div align="center">
													�������ݣ�
												</div>
											</td>
											<td height="15" width="70%">
												<textarea name="content" cols="40" rows="6"></textarea>
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
								<form action="bbsnew?path=update" method=post>
									<input type=hidden name=id value=${bbsnews.id}>
									<input type=hidden name=bid value=${boardid}>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="30%">
												<div align="center">
													������⣺
												</div>
											</td>
											<td width="70%">
												<input type="text" name="name2" size=40
													value="${bbsnews.title}">
											</td>
										</tr>
										<tr>
											<td width="30%">
												<div align="center">
													������飺
												</div>
											</td>
											<td width="70%">
												<select name="select2">	
														<option value="0">
														��ҳ����
													</option>												
													<c:forEach items="${listClass}" var="classtype">
														<c:choose>
															<c:when test="${bbsnews.boardid == classtype.id}">
																<option value="${classtype.id}" selected="selected">
																	${classtype.classType}
																</option>
															</c:when>
															<c:otherwise>
																<option value="${classtype.id}">
																	${classtype.classType}
																</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>											
												</select>
												<label></label>
											</td>
										</tr>
										<tr>
											<td height="15" width="30%">
												<div align="center">
													�������ݣ�
												</div>
											</td>
											<td height="15" width="70%">
												<textarea name="textarea" cols="40" rows="6">${bbsnews.content}</textarea>
											</td>
										</tr>
										<tr>
											<td height="15" colspan="2">
												<div align="center">
													<input type="submit" name="Submit3" value=" �� �� ">
													<input type="reset" name="Submit22" value=" �� �� ">
												</div>
											</td>
										</tr>
									</table>
								</form>
							</c:if>
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr bgcolor='#e8f4ff'>
									<td height="20" bgcolor="#99ccff">
										<a href="bbsnew?path=toadd">�����¹���</a>
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