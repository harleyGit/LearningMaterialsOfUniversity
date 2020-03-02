<%@ page language="java"
	import="java.util.*,org.ly.bean.*,org.ly.dao.impl.*"
	pageEncoding="utf-8"%>
<%
    LoginDAOImpl impl = new LoginDAOImpl();
	//定义当前页数
	int page_count = 1;
	//每页显示的记录数
	int row = 5;
	//总页数
	int sum_page = 1;
	//总记录数
	int sum_row = impl.getAllCount();	
	try {
		page_count = Integer.parseInt(request.getParameter("page"));
		sum_row = Integer.parseInt(request.getParameter("sum_row"));
		System.out.println(page_count+" "+sum_row);
	} catch (Exception e) {
	}	
	HashMap map = impl.getAllMessage(page_count, row);
%>

<html>
	<head>
		<title>那一年冬天</title>
		<link rel="Shortcut Icon" href="../images/sun.ico">
		<link href="../css/Liu.css" rel="stylesheet" type="text/css">
		<META http-equiv=Pragma content=no-cache>
		<META http-equiv=Cache-Control content=no-cache>
		<META http-equiv=Expires content=0>
		<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function openPage(curpage)
{
	document.spage.page.value = curpage ;		
	document.spage.submit() ;
}
function selOpenPage()
{
	document.spage.page.value = document.spage.selpage.value ;
	document.spage.submit() ;
}
//-->
</script>
		<link href="Liu.css" rel="stylesheet" type="text/css">
	</head>
	<body bgcolor="#FFFFFF" background="../images/index_bg.jpg"
		leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
		onLoad="MM_preloadImages('../images/savalo_blog_green_006.jpg','../images/savalo_blog_green_007.jpg','../images/savalo_blog_green_008.jpg','../images/savalo_blog_green_009.jpg','../images/savalo_blog_green_010.jpg','../images/savalo_blog_green_011.jpg')">
		<table width="780" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr align=center>
				<td colspan="9">
					<img src="../images/20037233554511044.jpg" width="760"
						height="133" alt="那一年冬天　LiuY's MessageBoard">
				</td>
			</tr>
			<tr>
				<td>
					<img src="../images/savalo_blog_green_04.jpg" width="18"
						height="24" alt="">
				</td>
				<td width="349" height="24"
					background="../images/savalo_blog_green_05.jpg">
					<marquee class="font">
						欢迎来到我的留言板
					</marquee>
				</td>
				<td background="../images/savalo_blog_green_05.jpg">
					<a href="#"
						onMouseOver="MM_swapImage('Image1','','../images/savalo_blog_green_006.jpg',1)"
						onMouseOut="MM_swapImgRestore()"><img
							src="../images/savalo_blog_green_06.jpg" alt="首页" name="Image1"
							width="63" height="24" border="0" id="Image1"> </a>
				</td>
				<td background="../images/savalo_blog_green_05.jpg">
					<a href="#"
						onMouseOver="MM_swapImage('Image2','','../images/savalo_blog_green_007.jpg',1)"
						onMouseOut="MM_swapImgRestore()"><img
							src="../images/savalo_blog_green_07.jpg" alt="相册" name="Image2"
							width="67" height="24" border="0" id="Image2"> </a>
				</td>
				<td background="../images/savalo_blog_green_05.jpg">
					<a href="message/message.jsp"
						onMouseOver="MM_swapImage('Image3','','../images/savalo_blog_green_008.jpg',1)"
						onMouseOut="MM_swapImgRestore()"><img
							src="../images/savalo_blog_green_08.jpg" alt="留言" name="Image3"
							width="65" height="24" border="0" id="Image3"> </a>
				</td>
				<td background="../images/savalo_blog_green_05.jpg">
					<a href="#"
						onMouseOver="MM_swapImage('Image4','','../images/savalo_blog_green_009.jpg',1)"
						onMouseOut="MM_swapImgRestore()"><img
							src="../images/savalo_blog_green_09.jpg" alt="搜索" name="Image4"
							width="66" height="24" border="0" id="Image4"> </a>
				</td>
				<td background="../images/savalo_blog_green_05.jpg">
					<a href="../login.jsp"
						onMouseOver="MM_swapImage('Image5','','../images/savalo_blog_green_010.jpg',1)"
						onMouseOut="MM_swapImgRestore()"><img
							src="../images/savalo_blog_green_10.jpg" alt="登录" name="Image5"
							width="65" height="24" border="0" id="Image5"> </a>
				</td>
				<td background="../images/savalo_blog_green_05.jpg">
					<a href="../Exit"
						onMouseOver="MM_swapImage('Image6','','../images/savalo_blog_green_011.jpg',1)"
						onMouseOut="MM_swapImgRestore()"><img
							src="../images/savalo_blog_green_11.jpg" alt="退出登录" name="Image6"
							width="69" height="24" border="0" id="Image6"> </a>
				</td>
				<td>
					<img src="../images/savalo_blog_green_12.jpg" width="18"
						height="24" alt="">
				</td>
			</tr>
		</table>
		<table width="780" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="12" rowspan="2"
					background="../images/savalo_blog_green_13.jpg">
					&nbsp;


				</td>
				<td width="189" rowspan="2" align="center" valign="top"
					bgcolor="#FFFFFF">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<%
									String admin = (String) session.getAttribute("admin");
									if (admin == null) {
								%>
								<form action="../Login" method="post" name="form1">
									<table width="100%" height="193" border="0" cellpadding="0"
										cellspacing="0" class="table">
										<tr>
											<td colspan="3">
												<div align="center">
													<strong>管理员登录</strong>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div align="center">
													用户名：
													<input name="uid" type="text" id="name" size="11"
														maxlength="12">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div align="center">
													密 码：
													<input name="pwd" type="password" id="pwd" size="11"
														maxlength="10">
												</div>
											</td>
										</tr>
										<tr>
											<td height="36" colspan="3">
												<div align="center">
													验证码：
													<input name="validate" type="text" id="validate" size="3"
														maxlength="4">
													<img src="image.jsp" />
												</div>
											</td>
										</tr>
										<tr>
											<td width="43">
												&nbsp;


											</td>
											<td width="55">
												<input name="enter" type="submit" id="enter" value="登　录">
											</td>
											<td width="87">
												<input name="reset" type="reset" id="reset" value="重　置">
											</td>
										</tr>
									</table>
								</form>
								<%
									} else {
								%>
								<p>
									<b>欢迎管理员:</b>
								</p>
								<p align="center">
									${admin }
									<%
										}
									%>
								
							</td>
						</tr>
						<tr>
							<td>
								<img src="../images/005.jpg" width="189" height="3">
							</td>
						</tr>
						<tr>
							<td align="center" height="5"></td>
						</tr>
						<tr>
							<td align="center">
								<img src="../images/ss.bmp" width="179" height="20"
									　alt="搜索BLOG文章">
							</td>
						</tr>
						<tr>
							<td align="center">
								<form name="selectForm" method="post" action="../Message">
									<table width="190" border="0" cellpadding="0" cellspacing="0"
										align="center">
										<tr>
											<td height="32" colspan="2">
												<div align="center">
													<input name="keyworld" type="text" id="keyworld"
														value="请输入关键字" size="25" onfocus='value=""'>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div align="right">
													<input name="select" type="submit" value="搜　索">
													<input name="type" type="hidden" value="like">
												</div>
											</td>
											<td>
												&nbsp;

											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						<tr>
							<td>
								<img src="../images/005.jpg" width="189" height="3">
							</td>
						</tr>
						<tr>
							<td align="center" height="5"></td>
						</tr>
						<tr>
							<td>
								<img src="../images/005.jpg" width="189" height="3">
							</td>
						</tr>
						<tr>
							<td align="center"></td>
						</tr>
						<tr>
							<td align="center" height="5"></td>
						</tr>
						<tr>
							<td align="center">
								<img src="../images/yqlj.bmp" width="179" height="20" alt="友情链接">
							</td>
						</tr>
						<tr>
							<td align="center">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											&nbsp;


										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="http://www.sina.com.cn">SINA</a>
											<a href="http://www.sohu.com">SOHU</a>
											<a href="http://www.163.com.cn">163</a>
										</td>
									</tr>
									<tr>
										<td>
											&nbsp;


										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<img src="../images/005.jpg" width="189" height="3">
							</td>
						</tr>
						<tr>
							<td align="center" height="5"></td>
						</tr>
					</table>
				</td>
				<td width="1" valign="top"
					style="FILTER: progid :                             DXImageTransform .                             Microsoft .                             Gradient(GradientType =                             0, StartColorStr =                             '#ffffff', EndColorStr =                             '#000000')"
					height="50%"></td>
				<td width="570" rowspan="2" align="center" valign="top"
					bgcolor="#FFFFFF">
					<table width="96%" border="0" cellspacing="0" cellpadding="2">
						<%
							List list = (List) map.get("all");
							Iterator iterator = list.iterator();
							if (list.size() < 1) {
						%>
						<p align="center">
							目前还没有留言.
						</p>
						<%
							}
							for (int i = 0; i < list.size(); i++) {
								Message me = (Message) list.get(i);
						%>
						<tr>
							<td class="context">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="messageTitle">
									<tr>
										<td>
											<strong><%=me.getMotif()%>&nbsp;&nbsp;作者：<%=me.getName()%></strong>
										</td>
										<td>
											&nbsp;

										</td>
										<td><%=me.getMessageDate()%></td>
									</tr>
								</table>
								<br>
								<div align="center">
									<textarea name="message" cols="60" rows="5" class="message"
										readonly="readonly"><%=me.getContext()%></textarea>
								</div>
								<br>
								<%
									if (me.getRevert() != null && me.getRevert() != "") {
								%>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="34%">
											&nbsp;

										</td>
										<td width="66%">
											<div align="center" class="div">
												<div align="center"><%=me.getRevert()%></div>
											</div>
										</td>
									</tr>
								</table>
								<%
									}
								%>
							</td>
						</tr>
						<tr>
							<td class="context">
								<%
									if (admin == null) {
								%>
								<div align="right">
									<a href="message/fullMessage.jsp?id=<%=me.getId()%>">阅读全文</a>
								</div>
								<%
									} else {
								%>
								<div align="right">
									<a href="message/fullMessage.jsp?id=<%=me.getId()%>">阅读全文</a>|
									<a href="manager/repeat.jsp?id=<%=me.getId()%>">回复留言</a>|
									<a href="manager/delete.jsp?id=<%=me.getId()%>">删除留言</a>|
									<a href="manager/updata.jsp?id=<%=me.getId()%>">修改留言</a>
								</div>
								<%
									}
								%>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;


							</td>
						</tr>
						<tr>
							<td>
								<div id="dot"
									style="border-top: 1px dashed #2D5300; height: 1px; overflow: hidden;">

								</div>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<form name="spage" method="post" action="main.jsp">
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									<%
										sum_page = (sum_row + row - 1) / row;	
										if (list.size() >= 1) {
									%>
									<div align="center">
										<input type="button"  value="首 页"
											onClick="openPage(1)" <%=page_count == 1 ? "disabled" : ""%>>

										<input type="button" value="上一页"
											onClick="openPage(<%=page_count - 1%>)" <%=page_count == 1 ? "disabled" : ""%>>

										<input type="button" value="下一页"
											onClick="openPage(<%=page_count + 1%>)" <%=page_count == sum_page ? "disabled" : ""%>>

										<input type="button" value="尾 页"
											onClick="openPage(<%=sum_page%>)" <%=page_count == sum_page ? "disabled" : ""%>>
											<input type="hidden" name="page" value="">
										&nbsp;
										<font color="red" size="5"><%=page_count%> </font> /
										<font color="red" size="5"><%=sum_page%> </font> &nbsp;
										跳转到
										<select name="selpage" onChange="selOpenPage()">
											<%
												for (int x = 1; x <= sum_page; x++) {
											%>
											<option value="<%=x%>" <%=page_count == x ? "selected" : ""%>>
												<%=x%>
											</option>
											<%
												}
											%>
										</select>
										页
										&nbsp;
									</div>
									<%
										}
									%>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</form>
					<p>
						&nbsp;
					</p>
				</td>
				<td width="12" rowspan="2"
					background="../images/savalo_blog_green_15.jpg">
					&nbsp;

				</td>
			</tr>
		</table>
		<td width="12" rowspan="2"
			background="../images/savalo_blog_green_15.jpg">
		</td>
		<table width="780" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr align=center>
				<td >
					<img src="../images/046.jpg" width="760"
						height="30" alt="版权所有　&copy; 2008 Author By LiuY">
				</td>
			</tr>
		</table>
	</body>
</html>