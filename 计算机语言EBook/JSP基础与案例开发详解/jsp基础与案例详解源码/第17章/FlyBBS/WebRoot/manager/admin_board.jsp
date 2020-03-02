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

						<td width="80%" valign=top bgcolor="#f2f8ff">
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr>
									<td>
										1．注意事项： 在下面，您将看到目前所有的论坛分类。您可以编辑论坛分类名或是增加一个新的论坛到这个分类中。
										也可以编辑或删除目前存在的论坛。您可以对目前的分类重新进行排列。
										<p>
											<font color='#ff0000'>2.特别注意</font>：删除论坛同时将删除该论坛下所有帖子！删除分类同时删除下属论坛和其中帖子！
											操作时请完整填写表单信息。
									</td>
								</tr>
								<tr>
									<td>
										<p align=cetner>
											<b><a href='board?path=boardinfo'>论坛管理</a> | <a
												href="class?path=toadd">新建论坛分类</a>
										</p>
									</td>
								<tr>
							</table>

							<!-- 如果请求为论坛管理则显示下面内容 -->
							<c:if test="${action=='manager'}">
								<form action="admin_board.jsp?action=savenew" method=post>
									<!-- 循环开始 -->
									<c:forEach items="${classtype}" var="classType">
										<table width="100%" border="0" cellspacing="3" cellpadding="0">
											<tr bgcolor="#e8f4ff">
												<td height="21">
													<font color="#000000"><B>ID:${classType.id
															},分类名：『${classType.classType }』</b> <a
														href="board?path=tempadd&classtype=${classType.id
															}"><font
															color="#000000">新增论坛</font> </a> |<a
														href=class?path=dele&id=${classType.id}
														onclick="{if(confirm('删除将包括该分类下所有论坛的所有帖子，确定删除吗?')){return true;}return false;}"><font
															color="#000000">删除分类</font> </a> </font>
												</td>
											</tr>
										</table>
										<c:forEach items="${board}" var="board">
											<c:if test="${board.classType==classType.id}">
											<br>
												<table width="100%" border="0" cellspacing="3"
													cellpadding="0">
													<tr>
														<td height="18">
															论坛名：<font color=blue>${board.boardType }</font>
														</td>
													</tr>
													<tr>
														<td height="18">
															论坛简介：
															<c:if test="${board.forumlogo!='' }">
																<table align=left>
																	<tr>
																		<td>
																			<img src='${board.forumlogo }' align=top>
																		</td>
																		<td width=20></td>
																	</tr>
																</table>
															</c:if>
															${board.readme }
														</td>
													</tr>
													<tr>
														<td height="15">
															<a href="board?path=toupdate&id=${board.boardid }">编辑此论坛</a>
															|
															<a href="board?path=dele&id=${board.boardid }">删除此论坛</a> | <a href="board?path=manage&bid=${board.boardid }&cid=${classType.id}">管理论坛</a></td>
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
							<c:if test="${action=='edit'}">
								<form action="board?path=update" method=post>
									<input type='hidden' name=editid value='1'>
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr bgcolor=#e8f4ff>
											<td width="52%" height=22 bgcolor="#99ccff">
												<b>字段名称：</b>											</td>
											<td width="48%" bgcolor="#99ccff">
												<div align="left">
													<b>变量值：</b>												</div>
										  </td>
										</tr>
										<input type="hidden" name="lastrootid" value="${board.lastrootid }">
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>论坛ID</B> </font>
											</td>
											<td width="48%">
												<input type="text" name="boardid" size="3"
													value='${board.boardid }' readonly>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>论坛名称</B> </font>
											</td>
											<td width="48%">
												<input type="text" name="boardtype" size="24"
													value='${board.boardType }'>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>所属类别</B> </font>
											</td>
											<td width="48%">
												<select name=classType>
													<c:choose>
														<c:when test="${board.classType==1}">
															<option value=1 selected>
																电脑技术
															<option value=2>
																版务处理
														</c:when>
														<c:otherwise>
															<option value=1>
																电脑技术
															<option value=2 selected>
																版务处理
														</c:otherwise>
													</c:choose>
												</select>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>版面说明</B> </font>
											</td>
											<td width="48%">
												<input type="text" name="readme" size="24"
													value='${board.readme }'>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>论坛版主</B> <BR>多斑竹添加请用|分隔，如：沙滩小子|wodeail</font>
											</td>
											<td width="48%">
												<input type="text" name="boardmaster" size="24"
													value='${board.boardMaster }'>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>是否为隐含版面</B> <BR>0表示开放，1表示隐含</font>
											</td>
											<td width="48%">
												<select name="lockboard">
													<c:choose>
														<c:when test="${board.lockboard==0}">
															<option value="0" selected>
																0
															<option value="1">
																1
														</c:when>
														<c:otherwise>
															<option value="0">
																0
															<option value="1" selected>
																1
														</c:otherwise>
													</c:choose>
												</select>
											</td>
										</tr>
										<tr>
											<td width="52%">
												论坛Logo地址
											</td>
											<td width="48%">
												<input type="text" name="Logo" size="35"
													value="${board.forumlogo }">
												<input name="button" type="button" value="上传图片">
											</td>
										</tr>
										<tr>
											<td width="52%">
												首页显示论坛图片
											</td>
											<td width="48%">
												<input type="text" name="indexIMG" size="35"
													value="${board.indexIMG }">
												<input name="button" type="button" value="上传图片">
											</td>
										</tr>
										<tr bgcolor=#e8f4ff>
											<td width="52%" bgcolor="#99ccff">&nbsp;											</td>
											<td width="48%" bgcolor="#99ccff">
												<input type="submit" name="Submit" value="提交">
												<input type="hidden" name="id" value="${board.boardid}">										  </td>
										</tr>
									</table>
								</form>
							</c:if>

							<!-- 如果请求为添加论坛则显示下面内容 -->
							<c:if test="${action=='add'}">
								<form action="board?path=add" method=post>
									<input type='hidden' name=editid value='1'>
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr bgcolor=#e8f4ff>
											<td width="52%" height=22 bgcolor="#99ccff">
												<b>字段名称：</b>											</td>
											<td width="48%" bgcolor="#99ccff">
												<div align="left">
													<b>变量值：</b>												</div>										  </td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>论坛ID</B> </font>											</td>
											<td width="48%">
												<input type="text" name="lastrootid" size="3"
													value='${board.lastrootid }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>论坛名称</B> </font>											</td>
											<td width="48%">
												<input type="text" name="boardtype" size="24"
													value='${board.boardType }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>所属类别</B> </font>											</td>
											<td width="48%">
												<select name=classType>
													
															<option value='${classtype.id}' selected>
																${classtype.classType}
												</select>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>版面说明</B> </font>											</td>
											<td width="48%">
												<input type="text" name="readme" size="24"
													value='${board.readme }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>论坛版主</B> <BR>多斑竹添加请用|分隔，如：沙滩小子|wodeail</font>											</td>
											<td width="48%">
												<input type="text" name="boardmaster" size="24"
													value='${board.boardMaster }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>是否为隐含版面</B> <BR>0表示开放，1表示隐含</font>											</td>
											<td width="48%">
												<select name="lockboard">										
															<option value="0" selected>
																0
															<option value="1">
															1
												</select>											</td>
										</tr>
										<tr>
											<td width="52%">
												论坛Logo地址											</td>
											<td width="48%">
												<input type="text" name="Logo" size="35"
													value="${board.forumlogo }">
												<input name="button" type="button" value="上传图片">											</td>
										</tr>
										<tr>
											<td width="52%">
												首页显示论坛图片											</td>
											<td width="48%">
												<input type="text" name="indexIMG" size="35"
													value="${board.indexIMG }">
												<input name="button" type="button" value="上传图片">											</td>
										</tr>
										<tr bgcolor=#e8f4ff>
											<td colspan="2" bgcolor="#99ccff">											
											  <div align="center">
											    <input type="submit" name="Submit" value="提交">										  
									        </div></td>
										</tr>
									</table>
								</form>
							</c:if>
							
							<!-- 如果请求为添加论坛分类时则显示下面内容 -->
							<c:if test="${action=='addclasstype'}">
								<form action="class?path=add" method=post>									
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr bgcolor=#e8f4ff>
											<td width="52%" height=22 bgcolor="#99ccff">
												<b>字段名称：</b>											</td>
											<td width="48%" bgcolor="#99ccff">
												<div align="left">
													<b>变量值：</b>												</div>										  </td>
										</tr>
																				<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>分类ID</B> </font>											</td>
											<td width="48%">
												<input type="text" name="id" size="24">											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>分类名称</B> </font>											</td>
											<td width="48%">
												<input type="text" name="classtype" size="24">											</td>
										</tr>
										<tr bgcolor=#e8f4ff>
											<td colspan="2" bgcolor="#99ccff">											
											  <div align="center">
											    <input type="submit" name="Submit" value="提交">										  
									        </div></td>
										</tr>
									</table>
								</form>
							</c:if>
					  </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</BODY>
<%@include file="../inc/foot.jsp"%>
