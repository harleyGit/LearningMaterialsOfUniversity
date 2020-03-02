<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
							<b> ${admin_name}</b>进入管理页面
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
										注意事项：
										<br>
										在下面，您将看到目前所有的联盟论坛。您可以编辑联盟论坛名或是增加一个新的联盟论坛。
										也可以编辑或删除目前存在的联盟论坛。您可以对目前的联盟重新进行排列。
									</td>
								</tr>
							</table>

							<br>
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr bgcolor="#e8f4ff">
									<td height="22" bgcolor="#99ccff">
										<a href="bbslink?path=toadd">增加新的联盟论坛</a>
									</td>
								</tr>
							</table>

							<c:if test="${action=='manager'}">
								<!-- 循环开始 -->
								<c:forEach items="${bbslink}" var="bbslink">
									<hr width=60% align=left color=black height=1>
									<table width="100%" border="0" cellspacing="3" cellpadding="0">
										<tr>
											<td>
												联盟论坛名称：${bbslink.boardname }
											</td>
										</tr>
										<tr>
											<td>
												联盟论坛 URL：${bbslink.url }
											</td>
										</tr>
										<tr>
											<td>
												联盟论坛简介：${bbslink.readme }
											</td>
										</tr>
										<tr align="left" valign="bottom">
											<td height="27">
												<a href="bbslink?path=toupdate&id=${bbslink.id }">编辑此联盟论坛</a>
												|
												<a href="bbslink?path=del&id=${bbslink.id }">删除此联盟论坛</a> |
												<a href="admin_link.jsp?action=orders&id=${bbslink.id }">联盟论坛重新排序</a>
											</td>
										</tr>
									</table>
								</c:forEach>
								<hr width=60% align=left color=black height=1>
								<!-- 循环结束 -->
							</c:if>

							<!-- 如果是添加新的联盟论坛则执行下面 -->
							<c:if test="${action=='add'}">
								<form action="bbslink?path=add" method=post>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="30%">
												<div align="center">
													论坛名称：
												</div>
											</td>
											<td width="70%">
												<input type="text" name="name" size=40>
											</td>
										</tr>
										<tr>
											<td width="30%">
												<div align="center">
													连接URL：
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
													论坛简介：
												</div>
											</td>
											<td height="15" width="70%">
												<input type="text" name="readme" size=40>
											</td>
										</tr>
										<tr>
											<td height="15" colspan="2">
												<div align="center">
													<input type="submit" name="Submit" value=" 添 加 ">
													<input type="reset" name="Submit2" value=" 重 置 ">

												</div>
											</td>
										</tr>
									</table>
								</form>
							</c:if>

							<!-- 如果是修改则执行下面代码 -->
							<c:if test="${action=='edit'}">
								<form action="bbslink?path=update" method=post>
									<input type=hidden name=id value=${bbslink.id}>
									<table width="100%" border="0" cellspacing="3" cellpadding="0">
										<tr>
											<td>
												联盟论坛名称：
												<input type="text" name="name" size=40
													value=${bbslink.boardname }>
											</td>
										</tr>
										<tr>
											<td>
												联盟论坛 URL：
												<input type="text" name="url" size=40 value=${bbslink.url }>
											</td>
										</tr>
										<tr>
											<td>
												联盟论坛简介：
												<input type="text" name="readme" size=40
													value=${bbslink.readme }>
											</td>
										</tr>
										<tr>
											<td height="15" colspan="2">
												<div align="center">
													<input type="submit" name="Submit" value=" 修 改 ">
													<input type="reset" name="Submit2" value=" 重 置 ">
												</div>
											</td>
										</tr>
									</table>
								</form>
							</c:if>
							<table width="100%" border="0" cellspacing="3" cellpadding="0">
								<tr bgcolor='#e8f4ff'>
									<td height="20" bgcolor="#99ccff">
										<a href="bbslink?path=toadd">增加新的联盟论坛</a>
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
			版权所有： Fly 版本：Ver0.1
		</p>
	</body>
</html>