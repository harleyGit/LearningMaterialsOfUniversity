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

						<td width="80%" valign=top bgcolor="#f2f8ff">
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr>
									<td>
										1��ע����� �����棬��������Ŀǰ���е���̳���ࡣ�����Ա༭��̳��������������һ���µ���̳����������С�
										Ҳ���Ա༭��ɾ��Ŀǰ���ڵ���̳�������Զ�Ŀǰ�ķ������½������С�
										<p>
											<font color='#ff0000'>2.�ر�ע��</font>��ɾ����̳ͬʱ��ɾ������̳���������ӣ�ɾ������ͬʱɾ��������̳���������ӣ�
											����ʱ��������д����Ϣ��
									</td>
								</tr>
								<tr>
									<td>
										<p align=cetner>
											<b><a href='board?path=boardinfo'>��̳����</a> | <a
												href="class?path=toadd">�½���̳����</a>
										</p>
									</td>
								<tr>
							</table>

							<!-- �������Ϊ��̳��������ʾ�������� -->
							<c:if test="${action=='manager'}">
								<form action="admin_board.jsp?action=savenew" method=post>
									<!-- ѭ����ʼ -->
									<c:forEach items="${classtype}" var="classType">
										<table width="100%" border="0" cellspacing="3" cellpadding="0">
											<tr bgcolor="#e8f4ff">
												<td height="21">
													<font color="#000000"><B>ID:${classType.id
															},����������${classType.classType }��</b> <a
														href="board?path=tempadd&classtype=${classType.id
															}"><font
															color="#000000">������̳</font> </a> |<a
														href=class?path=dele&id=${classType.id}
														onclick="{if(confirm('ɾ���������÷�����������̳���������ӣ�ȷ��ɾ����?')){return true;}return false;}"><font
															color="#000000">ɾ������</font> </a> </font>
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
															��̳����<font color=blue>${board.boardType }</font>
														</td>
													</tr>
													<tr>
														<td height="18">
															��̳��飺
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
															<a href="board?path=toupdate&id=${board.boardid }">�༭����̳</a>
															|
															<a href="board?path=dele&id=${board.boardid }">ɾ������̳</a> | <a href="board?path=manage&bid=${board.boardid }&cid=${classType.id}">������̳</a></td>
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
							<c:if test="${action=='edit'}">
								<form action="board?path=update" method=post>
									<input type='hidden' name=editid value='1'>
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr bgcolor=#e8f4ff>
											<td width="52%" height=22 bgcolor="#99ccff">
												<b>�ֶ����ƣ�</b>											</td>
											<td width="48%" bgcolor="#99ccff">
												<div align="left">
													<b>����ֵ��</b>												</div>
										  </td>
										</tr>
										<input type="hidden" name="lastrootid" value="${board.lastrootid }">
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��̳ID</B> </font>
											</td>
											<td width="48%">
												<input type="text" name="boardid" size="3"
													value='${board.boardid }' readonly>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��̳����</B> </font>
											</td>
											<td width="48%">
												<input type="text" name="boardtype" size="24"
													value='${board.boardType }'>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>�������</B> </font>
											</td>
											<td width="48%">
												<select name=classType>
													<c:choose>
														<c:when test="${board.classType==1}">
															<option value=1 selected>
																���Լ���
															<option value=2>
																������
														</c:when>
														<c:otherwise>
															<option value=1>
																���Լ���
															<option value=2 selected>
																������
														</c:otherwise>
													</c:choose>
												</select>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>����˵��</B> </font>
											</td>
											<td width="48%">
												<input type="text" name="readme" size="24"
													value='${board.readme }'>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��̳����</B> <BR>������������|�ָ����磺ɳ̲С��|wodeail</font>
											</td>
											<td width="48%">
												<input type="text" name="boardmaster" size="24"
													value='${board.boardMaster }'>
											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>�Ƿ�Ϊ��������</B> <BR>0��ʾ���ţ�1��ʾ����</font>
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
												��̳Logo��ַ
											</td>
											<td width="48%">
												<input type="text" name="Logo" size="35"
													value="${board.forumlogo }">
												<input name="button" type="button" value="�ϴ�ͼƬ">
											</td>
										</tr>
										<tr>
											<td width="52%">
												��ҳ��ʾ��̳ͼƬ
											</td>
											<td width="48%">
												<input type="text" name="indexIMG" size="35"
													value="${board.indexIMG }">
												<input name="button" type="button" value="�ϴ�ͼƬ">
											</td>
										</tr>
										<tr bgcolor=#e8f4ff>
											<td width="52%" bgcolor="#99ccff">&nbsp;											</td>
											<td width="48%" bgcolor="#99ccff">
												<input type="submit" name="Submit" value="�ύ">
												<input type="hidden" name="id" value="${board.boardid}">										  </td>
										</tr>
									</table>
								</form>
							</c:if>

							<!-- �������Ϊ�����̳����ʾ�������� -->
							<c:if test="${action=='add'}">
								<form action="board?path=add" method=post>
									<input type='hidden' name=editid value='1'>
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr bgcolor=#e8f4ff>
											<td width="52%" height=22 bgcolor="#99ccff">
												<b>�ֶ����ƣ�</b>											</td>
											<td width="48%" bgcolor="#99ccff">
												<div align="left">
													<b>����ֵ��</b>												</div>										  </td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��̳ID</B> </font>											</td>
											<td width="48%">
												<input type="text" name="lastrootid" size="3"
													value='${board.lastrootid }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��̳����</B> </font>											</td>
											<td width="48%">
												<input type="text" name="boardtype" size="24"
													value='${board.boardType }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>�������</B> </font>											</td>
											<td width="48%">
												<select name=classType>
													
															<option value='${classtype.id}' selected>
																${classtype.classType}
												</select>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>����˵��</B> </font>											</td>
											<td width="48%">
												<input type="text" name="readme" size="24"
													value='${board.readme }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��̳����</B> <BR>������������|�ָ����磺ɳ̲С��|wodeail</font>											</td>
											<td width="48%">
												<input type="text" name="boardmaster" size="24"
													value='${board.boardMaster }'>											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>�Ƿ�Ϊ��������</B> <BR>0��ʾ���ţ�1��ʾ����</font>											</td>
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
												��̳Logo��ַ											</td>
											<td width="48%">
												<input type="text" name="Logo" size="35"
													value="${board.forumlogo }">
												<input name="button" type="button" value="�ϴ�ͼƬ">											</td>
										</tr>
										<tr>
											<td width="52%">
												��ҳ��ʾ��̳ͼƬ											</td>
											<td width="48%">
												<input type="text" name="indexIMG" size="35"
													value="${board.indexIMG }">
												<input name="button" type="button" value="�ϴ�ͼƬ">											</td>
										</tr>
										<tr bgcolor=#e8f4ff>
											<td colspan="2" bgcolor="#99ccff">											
											  <div align="center">
											    <input type="submit" name="Submit" value="�ύ">										  
									        </div></td>
										</tr>
									</table>
								</form>
							</c:if>
							
							<!-- �������Ϊ�����̳����ʱ����ʾ�������� -->
							<c:if test="${action=='addclasstype'}">
								<form action="class?path=add" method=post>									
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center">
										<tr bgcolor=#e8f4ff>
											<td width="52%" height=22 bgcolor="#99ccff">
												<b>�ֶ����ƣ�</b>											</td>
											<td width="48%" bgcolor="#99ccff">
												<div align="left">
													<b>����ֵ��</b>												</div>										  </td>
										</tr>
																				<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>����ID</B> </font>											</td>
											<td width="48%">
												<input type="text" name="id" size="24">											</td>
										</tr>
										<tr>
											<td width="52%" height=24>
												<font color="#000000"><B>��������</B> </font>											</td>
											<td width="48%">
												<input type="text" name="classtype" size="24">											</td>
										</tr>
										<tr bgcolor=#e8f4ff>
											<td colspan="2" bgcolor="#99ccff">											
											  <div align="center">
											    <input type="submit" name="Submit" value="�ύ">										  
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
