<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
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
							<b> ${admin_name}</b>�������ҳ��						</td>
					</tr>
					<tr bgcolor='#f2f8ff'>

						<td width="20%" valign=top>
							<%@ include file="admin_left.jsp"%>
						</td>

						<td width="80%" valign=top bgcolor="#f2f8ff"><p>
						  <!-- �������Ϊ��̳��������ʾ�������� -->
						</p>
						  <p>&nbsp;						      </p>
					  <c:if test="${action=='manager'}">
								<form action="admin_board.jsp?action=savenew" method=post>
									<!-- ѭ����ʼ -->
									<c:forEach items="${classtype}" var="classType">
										<table width="100%" border="0" cellspacing="3" cellpadding="0">
											<tr bgcolor="#e8f4ff">
												<td height="21">
													<font color="#000000"><B>ID:${classType.id
															},����������${classType.classType }��</b></font>												</td>
										  </tr>
										</table>
										<c:forEach items="${board}" var="board">
											<c:if test="${board.classType==classType.id}">
											<br>
												<table width="100%" border="0" cellspacing="3"
													cellpadding="0">
													<tr>
														<td width="57%" height="18">
															��̳����<font color=blue>${board.boardType }</font>														</td>
													    <td width="43%">������<font color=blue>${board.boardMaster }</font>	</td>
													</tr>
													<tr>
														<td height="18" colspan="2">
															��̳��飺
															<c:if test="${board.forumlogo!='' }">
																<table align=left>
																	<tr>
																		<td>
																			<img src='${board.forumlogo }' align=top>																		</td>
																		<td width=20></td>
																	</tr>
																</table>
															</c:if>
															${board.readme }														</td>
													</tr>
													<tr>
														<td height="15" colspan="2">
															<a href="user?path=pre_edit_moder&boardid=${board.boardid}">��������</a></td>
												  </tr>
												</table>
											  <br>
											</c:if>
										</c:forEach>
										<hr color='#000000' width="70%" align="left">
									</c:forEach>
									<!-- ѭ������ -->
								</form>
							</c:if>

							<!-- �������Ϊ�༭Щ��̳����ʾ�������� -->
							<c:if test="${action=='edit'}"></c:if>

							<!-- �������Ϊ�����̳����ʾ�������� -->
							<c:if test="${action=='add'}"></c:if>
							
							<!-- �������Ϊ�����̳����ʱ����ʾ�������� -->
							<c:if test="${action=='addclasstype'}"></c:if>
					  </td>
				  </tr>
				</table>
			</td>
		</tr>
	</table>
</BODY>
<%@include file="../inc/foot.jsp"%>
