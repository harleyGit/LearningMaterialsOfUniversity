<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<title>论坛--管理页面</title>
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
							欢迎
							<b> ${admin_name}</b>进入管理页面						</td>
					</tr>
					<tr bgcolor='#f2f8ff'>

						<td width="20%" valign=top>
							<%@ include file="admin_left.jsp"%>
						</td>

						<td width="80%" valign=top bgcolor="#f2f8ff"><p>
						  <!-- 如果请求为论坛管理则显示下面内容 -->
						</p>
						  <p>&nbsp;						      </p>
					  <c:if test="${action=='manager'}">
								<form action="admin_board.jsp?action=savenew" method=post>
									<!-- 循环开始 -->
									<c:forEach items="${classtype}" var="classType">
										<table width="100%" border="0" cellspacing="3" cellpadding="0">
											<tr bgcolor="#e8f4ff">
												<td height="21">
													<font color="#000000"><B>ID:${classType.id
															},分类名：『${classType.classType }』</b></font>												</td>
										  </tr>
										</table>
										<c:forEach items="${board}" var="board">
											<c:if test="${board.classType==classType.id}">
											<br>
												<table width="100%" border="0" cellspacing="3"
													cellpadding="0">
													<tr>
														<td width="57%" height="18">
															论坛名：<font color=blue>${board.boardType }</font>														</td>
													    <td width="43%">版主：<font color=blue>${board.boardMaster }</font>	</td>
													</tr>
													<tr>
														<td height="18" colspan="2">
															论坛简介：
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
															<a href="user?path=pre_edit_moder&boardid=${board.boardid}">更换版主</a></td>
												  </tr>
												</table>
											  <br>
											</c:if>
										</c:forEach>
										<hr color='#000000' width="70%" align="left">
									</c:forEach>
									<!-- 循环结束 -->
								</form>
							</c:if>

							<!-- 如果请求为编辑些论坛则显示下面内容 -->
							<c:if test="${action=='edit'}"></c:if>

							<!-- 如果请求为添加论坛则显示下面内容 -->
							<c:if test="${action=='add'}"></c:if>
							
							<!-- 如果请求为添加论坛分类时则显示下面内容 -->
							<c:if test="${action=='addclasstype'}"></c:if>
					  </td>
				  </tr>
				</table>
			</td>
		</tr>
	</table>
</BODY>
<%@include file="../inc/foot.jsp"%>
