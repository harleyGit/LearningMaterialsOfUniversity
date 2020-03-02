<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<html>
<head>
<title>forumName--管理页面</title>
<link rel="stylesheet" type="text/css" href="css/forum.css">

<head>
<BODY alink="#333333" vlink="#333333" link="#333333"
	topmargin="20">
	<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor='#777777' align=center>
		<tr>
			<td>
				<table cellpadding=3 cellspacing=1 border=0 width=100%>
					<tr bgcolor='#f2f8ff'>
						<td colspan="2" align=center bgcolor="#99ccff">
							欢迎
							<b>${admin_name }</b>进入管理页面
					  </td>
					</tr>
					<tr bgcolor=#f2f8ff>
						<td width="20%" valign=top>
<%@include file="admin_left.jsp"%>
						</td>
						<td width="80%" valign=top>
								<form method="POST" action="config?path=update">
									<c:forEach var="userinfo" items="${listAll}">
										<table width="95%" border="0" cellspacing="1" cellpadding="3"
											align=center >
											<tr bgcolor=#e8f4ff>
												<td height="23" colspan="2">
													<font color=#000000><b>用户金钱设定</b> </font>												</td>
											</tr>
											<tr>
												<td width="30%">
													注册金钱数												</td>
												<td width="70%">
													<input type="text" name="wealthReg" size="35"
														value="${userinfo.wealthReg}" />												</td>
											</tr>
											<tr>
												<td width="30%">
													登陆增加金钱												</td>
												<td width="70%">
													<input type="text" name="wealthLogin" size="35"
														value="${userinfo.wealthLogin}">												</td>
											</tr>
											<tr>
												<td width="30%">
													发帖增加金钱												</td>
												<td width="70%">  <input type="text" name="wealthAnnounce" size="35"
														value="${userinfo.wealthAnnounce}"></td>
											</tr>
											<tr>
												<td width="30%">
													跟帖增加金钱												</td>
												<td width="70%">
													<input type="text" name="wealthReAnnounce" size="35"
														value="${userinfo.wealthReannounce}">												</td>
											</tr>
											<tr>
												<td width="30%">
													删帖减少金钱												</td>
												<td width="70%">
													<input type="text" name="wealthDel" size="35"
														value="${userinfo.wealthDel}">												</td>
											</tr>
											<tr bgcolor=#e8f4ff>
												<td height="23" colspan="2">
													<font color=#000000><b>用户经验设定</b>													</font>												</td>
											</tr>
											<tr>
												<td width="30%">
													注册经验值												</td>
												<td width="70%">
													<input type="text" name="epReg" size="35"
														value="${userinfo.epReg}">												</td>
											</tr>
											<tr>
												<td width="30%">
													登陆增加经验值												</td>
												<td width="70%">
													<input type="text" name="epLogin" size="35"
														value="${userinfo.epLogin}">												</td>
											</tr>
											<tr>
												<td width="30%">
													发帖增加经验值												</td>
												<td width="70%">
													<input type="text" name="epAnnounce" size="35"
														value="${userinfo.epAnnounce}">												</td>
											</tr>
											<tr>
												<td width="30%">
													跟帖增加经验值												</td>
												<td width="70%">
													<input type="text" name="epReAnnounce" size="35"
														value="${userinfo.epReannounce}">												</td>
											</tr>
											<tr>
												<td width="30%">
													删帖减少经验值												</td>
												<td width="70%">
													<input type="text" name="epDel" size="35"
														value="${userinfo.epDel}">												</td>
											</tr>
											<tr bgcolor=#e8f4ff>
												<td height="23" colspan="2">
													<font color=#000000><b>用户魅力设定</b>													</font>												</td>
											</tr>
											<tr>
												<td width="30%">
													注册魅力值												</td>
												<td width="70%">
													<input type="text" name="cpReg" size="35"
														value="${userinfo.cpReg}">												</td>
											</tr>
											<tr>
												<td width="30%">
													登陆增加魅力值												</td>
												<td width="70%">
													<input type="text" name="cpLogin" size="35"
														value="${userinfo.cpLogin}">												</td>
											</tr>
											<tr>
												<td width="30%">
													发帖增加魅力值												</td>
												<td width="70%">
													<input type="text" name="cpAnnounce" size="35"
														value="${userinfo.cpAnnounce}">												</td>
											</tr>
											<tr>
												<td width="30%">
													跟帖增加魅力值												</td>
												<td width="70%">
													<input type="text" name="cpReAnnounce" size="35"
														value="${userinfo.cpReannounce}">												</td>
											</tr>
											<tr>
												<td width="30%">
													删帖减少魅力值												</td>
												<td width="70%">
													<input type="text" name="cpDel" size="35"
														value="${userinfo.cpDel}">												</td>
											</tr>
											<tr bgcolor=#e8f4ff>
												<td colspan="2" bgcolor="#99ccff">												
													<div align="center">
														<input type="submit" name="Submit" value="提 交">
											        </div></td>
											</tr>
										</table>
									  
									</c:forEach>
								</form>

					  </td>
            </tr>
        </table>
        </td>
    </tr>
</table>
</body>
</html>