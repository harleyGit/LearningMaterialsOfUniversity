<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
	<head>
		<title>${configlist.forumName } --『 ${boardinfo } 』
			浏览：${note.title }[${note.type }]</title>
		<link rel=stylesheet type=text/css href=css/forum.css>
		<style>
TABLE {
	BORDER-TOP: 0px;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 1px;
}

TD {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	color: #000000;
}
</style>
	<body bgcolor=#ffffff alink=#333333 vlink=#333333 link=#333333
		topmargin=0>
		<%@ include file="inc/top.jsp"%>
		<TABLE border=0 width="95%" align=center>
			<TBODY>
				<TR>
					<TD vAlign=top width="30%">
						<img border=0 src=pic/LOGO.GIF>
					</TD>
					<TD valign=middle align=top>
						&nbsp;&nbsp;
						<img src=pic/closedfold.gif border=0>
						&nbsp;&nbsp;
						<a href=index.jsp>${configlist.forumName }</a>
						<br>
						&nbsp;&nbsp;
						<img src=pic/bar.gif border=0 width=15 height=15>
						<img src=pic/closedfold.gif border=0>
						&nbsp;&nbsp;
						<a href=${url}>『 ${boardinfo } 』</a>
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src=pic/bar.gif border=0 width=15 height=15>
						<img src=pic/openfold.gif border=0>
						&nbsp;&nbsp; 浏览：${note.title }[${note.type }]
						<a name=top></a>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<br>
		<!-- 下面为投票内容 -->
		<c:if test="${votelist!=null}">
			<form action="vote?path=add" method=POST name=frmVote>
				<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
					<tr>
						<td bgcolor="#0099cc" valign=middle width=1 height=24>
						</td>
						<td bgcolor="#99ccff" colspan=2 align=left valign=middle width=*>
							<table cellpadding=0 cellspacing=1 border=0 width="100%">
								<tr>
									<td align=left valign=middle bgcolor="#99ccff">
										<font color="#000000">&nbsp;<b>投票</B>：${note.title }</font>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
					<tr>
						<td bgcolor="#0099cc" valign=middle width=1 height=24>
						</td>
						<td bgcolor="#f2f8ff" colspan=2 align=left valign=middle width=*>
							<table cellpadding=0 cellspacing=1 border=0 width="100%">
								<c:forEach items="${votelist}" var="votelist" varStatus="v">
									<input type="hidden" name="Announceid"
										value="${votelist.announceid }">
									<input type="hidden" name="votetype"
										value="${votelist.votetype }">
									<tr>
										<td align=left valign=middle bgcolor="#f2f8ff" width="20%">
											<font color="#000000">&nbsp; <c:choose>
													<c:when test="${votelist.votetype==0}">
														<input type="radio" name="vote" value="${votelist.vote }">
													</c:when>
													<c:otherwise>
														<input type="checkbox" name="vote"
															value="${votelist.vote }">
													</c:otherwise>
												</c:choose> ${votelist.vote } </font>
										</td>
										<td align=left>
											<hr width="${votelist.lenght/max*100}%" noshade="noshade"
												color="#dbc0c0" size="10">有 ${votelist.lenght} 人投票											
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td align=left valign=middle bgcolor="#f2f8ff" colspan="2">
										<div align="center">
											<input type="submit" name="Submit2" value="提交投票"
												class="bianhui">
											<input type="button" name="Submit3" value="查看投票"
												class="bianhui">


										</div>
									</td>
								</tr>
							</table>
						</td>
						<td bgcolor="#0099cc" valign=middle width=1 height=24>
						</td>
					</tr>
				</table>
			</form>
			<br>
			<table cellpadding=0 cellspacing=0 border=0 width="95%"
				bgcolor=#FFFFFF align=center>
				<tr>
					<td height=1>
					</td>
				</tr>
			</table>
		</c:if>
		<!-- 投票结束 -->

		<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
			<tr>
				<td align=left width=* valign=middle>
					&nbsp;
					<a href='control?path=newNote&boardid=${note.boardID }&parentid=${note.parentID }'>
						<img src=pic/post.gif alt=发表一个新主题 border=0></a>&nbsp;
					<a href=vote.jsp?forumID=1><img src=pic/newpoll.gif
							alt=发表一个新投票 border=0></a>&nbsp;
					<a href='bbs?path=torebbs&boardid=${note.boardID }&parentid=${note.parentID }&cite=null&AnnounceID=${note.announceID }'>
						<img src=pic/newreply1.gif alt=回复主题 border=0></a>&nbsp;
				</td>
				<td align=right width="" 50%"" valign=middle>
					您是本帖的第
					<B>${note.hits }</B> 个阅读者
				</td>
			</tr>
		</table>
		<table cellpadding=0 cellspacing=0 border=0 width="95%"
			bgcolor=#FFFFFF align=center>
			<tr>
				<td height=1>
				</td>
			</tr>
		</table>

		<table cellpadding=0 cellspacing=0 border=0 width="95%"
			bgcolor="#0099cc" align=center>
			<tr>
				<td height=1>
				</td>
			</tr>
		</table>
		<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
			<tr>
				<td bgcolor="#0099cc" valign=middle width=1 height=24>
				</td>
				<td bgcolor="#99ccff" colspan=2 align=left valign=middle width=*>
					<table cellpadding=0 cellspacing=1 border=0 width="100%">
						<tr>
							<td bgcolor="#99ccff" align=left valign=middle width="65%">
								<font color="#000000"> &nbsp;<b>* 贴子主题</B>： ${note.title
									}[${note.type }]</font>
							</td>
							<td width="" 35%"" align=right>
							<c:set var="moder" value="${user.nickName}"/>
							<c:if test="${BoardMaster eq moder}">
                            <a href="bbs?path=m_delete&announceID=${note.announceID}&boardid=${note.boardID }&parentid=${note.parentID }"><img src=pic/delete.gif border=0 width=16 height=16 alt=删除文章
										align="absmiddle"></a>&nbsp;
                            <a href="bbs?path=m_edit_j&announceID=${note.announceID}"><img src=pic/jing.gif border=0 width=16 height=16 alt=设置为精华帖
										align=absmiddle></a>&nbsp;
                            <a href="bbs?path=m_edit_top&announceID=${note.announceID}"><img src=pic/gotop.gif border=0 width=16 height=16 alt=设置为置顶 align=absmiddle></a>&nbsp;
                            <a href="bbs?path=m_edit_lock&announceID=${note.announceID}"><img src=pic/offlock.gif border=0 width=16 height=16 alt=锁定帖子 align=absmiddle></a>&nbsp;
								</c:if>
								<a href=# onClick="javascript:WebBrowser.ExecWB(4,1)"><img
										src=pic/saveas.gif border=0 width=16 height=16 alt=保存该页为文件
										align=absmiddle></a>&nbsp;
								<object id="WebBrowser" width=0 height=0
									classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>
								<a href=report.jsp?forumID= "&forumID&"&rootID="&rootID&"
									&announceID="&announceid_1&"><img src=pic/report.gif
										alt=报告本帖给版主 border=0></a>&nbsp;
								<a href="printpage.jsp?forumID=1&rootID=6&announceID=6"><img
										src=pic/printpage.gif alt=显示可打印的版本 border=0></a>&nbsp;
								<a href="pag.jsp?forumID=1&rootID=6&announceID=6"> <img
										src=pic/pag.gif border=0 alt=把本贴打包邮递></a>&nbsp;
								<a href="favadd.jsp?forumID=1&rootID=6&announceID=6"> <IMG
										SRC=pic/fav_add.gif BORDER=0 alt=把本贴加入论坛收藏夹></a>&nbsp;
								<a href="sendpage.jsp?forumID=1&rootID=6&announceID=6"> <img
										src=pic/emailtofriend.gif border=0 alt=发送本页面给朋友></a>&nbsp;
								<a href=#><span style="CURSOR: hand"
									onClick="window.external.AddFavorite('http://www.justhis.com/forum/dispbbs.jsp?forumID=1&rootID=6&announceID=6', ' 阿菜网络论坛- fds[灌水]')"><IMG
											SRC=pic/fav_add1.gif BORDER=0 width=15 height=15
											alt=把本贴加入IE收藏夹></span></a> &nbsp;
							</td>
						</tr>
					</table>
				</td>
				<td bgcolor="&tableBackColor&" valign=middle width=1 height=24>
				</td>
			</tr>
		</table>
		<table cellpadding=0 cellspacing=0 border=0 width=""
			95%"" bgcolor="&tableBackColor&" align=center>
			<tr>
				<td height=1>

				</td>
			</tr>
		</table>

		<!-- 下面为主题贴 -->
		<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
			<tr>
				<td bgcolor="#0099cc" valign=middle width=1 height=24>
				</td>
				<td bgcolor="#f2f8ff">
					<table width="100%" cellpadding=4 cellspacing=0>
						<tr>
							<td bgcolor="#f2f8ff" valign=top width="20%" rowspan=2>
								<img src="" width=0 height=4>
								<BR>
								<table width="100%" cellpadding=4 cellspacing=0
									style="filter: glow(color =                     #798AB7, strength =                     2)">
									<tr>
										<td>
											&nbsp;
											<img src=pic/${note.topic}>
											&nbsp;
											<a name="6"><B>${note.userName }</B></a>
											<c:choose>
											<c:when test="${user.sex==1}">
											<img src="pic/boy.JPG" width='20' height='20'alt="大帅哥">
											</c:when>
											<c:otherwise>
											<img width='20' height='20' src="pic/girl.JPG" alt="漂亮MM哟">
											</c:otherwise>
											</c:choose>											
										</td>
									</tr>
								</table>
								<br>
								&nbsp;&nbsp;等级：&nbsp;&nbsp;
								<img src=pic/level${note.grade }.gif>
								<BR>
								&nbsp;&nbsp;财产：
								<img src=pic/bar1.gif width="${note.fwealth }" height=8
									alt=${note.wealth }>
								<br>
								&nbsp;&nbsp;经验：
								<img src=pic/bar4.gif width=${note.fep } height=8
									alt=${note.ep }>
								<br>
								&nbsp;&nbsp;魅力：
								<img src=pic/bar5.gif width=${note.fcp } height=8
									alt=${note.cp }>
								<br>
								&nbsp;&nbsp;注册：${note.redate}
								<BR>
								&nbsp;&nbsp;文章：${note.article}
								<br>
								&nbsp;&nbsp;级别：保密
								<img src="" width=0 height=4>
								<BR>
							</td>
							<td bgcolor=#f2f8ff width=1 height=100% rowspan=2>
								<table width=1 height="100%" cellpadding=0 cellspacing=0
									bgcolor=#99ccff>
									<tr>
										<td width=1></td>
									</tr>
								</table>
							</td>
							<td bgcolor=#f2f8ff valign=top width=* height="95%">
								<img src="" width=0 height=4>
								<BR>
								&nbsp;
								<img src=pic/message.gif border=0 alt=给${note.userName }发送一个短消息>&nbsp;
								<img src=pic/profile.gif border=0 alt=查看${note.userName }的个人资料>&nbsp;
								<img src=pic/find.gif border=0 alt="搜索${note.userName }在『 ${boardinfo} 』的所有贴子">&nbsp;
								<a href='mailto:${note.userEmail}'><IMG
										alt='点击这里发送电邮给${note.userName }' border=0 src='pic/email.gif'></a>&nbsp;
								<img src=pic/reply.gif border=0 alt=引用回复这个贴子>&nbsp;
								<img src=pic/reply_a.gif border=0 alt=回复这个贴子>&nbsp;
								<a href="bbs?path=m_delete&announceID=${note.announceID}&boardid=${note.boardID }&parentid=${note.parentID }"></a>&nbsp;
                              <BR>
								<hr width="100%" size=1 color=#777777>
								<table cellpadding=0 cellspacing=0 width="95%"
									style="word-break: break-all">
									<tr>
										<td width=32 align=left valign=top>
											<img src='pic/${note.heart }' border=0 alt=发贴心情>
											&nbsp;
										</td>
										<td style="LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word">
											<font face=宋体 color=#333333> <b>${note.title
													}[${note.type}] </b> <br> </font>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											${note.body }
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<br>
											${user.sign }
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class=bottomline bgcolor=#f2f8ff valign=bottom>
								<hr width=100% size=1 color=#777777>
								<table width=100% cellpadding=0 cellspacing=0>
									<tr>
										<td align=left>
											&nbsp;
											<a href=editannounce.jsp?forumID=1&rootID=6&announceID=6><img
													src=pic/edit.gif border=0 alt=编辑这个贴子> </a>
										</td>
										<td align=left>
											发贴时间： 2008-08-31 10:14:58
										</td>
										<td align=left>
											<img src=pic/ip.gif border=0 width=13 height=15 alt="">
											IP:${note.ip }已设置为保密！
										</td>
										<td align=right nowarp valign=bottom width=110>
											主题贴
										</td>
										<td align=right valign=bottom width=4>
										</td>
									</tr>
								</table>
								<img src="" width=0 height=4>
								<BR>
							</td>
						</tr>
						<!-- 循环结束 -->


					</table>
				</td>
				<td bgcolor=#0099cc valign=middle width=1 height=24>
				</td>
			</tr>
		</table>

		<table cellpadding=0 cellspacing=0 border=0 width="95%"
			bgcolor=#0099cc align=center>
			<tr>
				<td height=1>
				</td>
			</tr>
		</table>

		<!-- 下面为循环输出回复贴 -->
		<c:if test="${fn:length(rebbs)>0}">
			<c:forEach items="${rebbs}" var="rebbs" varStatus="count">
				<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
					<tr>
						<td bgcolor="#0099cc" valign=middle width=1 height=24>
						</td>
						<td bgcolor="#f2f8ff">
							<table width="100%" cellpadding=4 cellspacing=0>
								<tr>
									<td bgcolor="#f2f8ff" valign=top width="20%" rowspan=2>
										<img src="" width=0 height=4>
										<BR>
										<table width="100%" cellpadding=4 cellspacing=0
											style="filter: glow(color =                     #798AB7, strength =                     2)">
											<tr>
												<td>
													&nbsp;
													<img src=pic/${rebbs.topic}>
													&nbsp;
													<a name="6"><B>${rebbs.userName }</B> </a>
												</td>
											</tr>
										</table>
										<br>
										&nbsp;&nbsp;等级：&nbsp;&nbsp;
										<img src=pic/level${rebbs.grade }.gif>
										<BR>
										&nbsp;&nbsp;财产：
										<img src=pic/bar1.gif width="${rebbs.fwealth }" height=8
											alt=${rebbs.wealth }>
										<br>
										&nbsp;&nbsp;经验：
										<img src=pic/bar4.gif width=${rebbs.fep } height=8
											alt=${rebbs.ep }>
										<br>
										&nbsp;&nbsp;魅力：
										<img src=pic/bar5.gif width=${rebbs.fcp } height=8
											alt=${rebbs.cp }>
										<br>
										&nbsp;&nbsp;注册：${rebbs.redate}
										<BR>
										&nbsp;&nbsp;文章：${rebbs.article}
										<br>
										&nbsp;&nbsp;级别：保密
										<img src="" width=0 height=4>
										<BR>
									</td>
									<td bgcolor=#f2f8ff width=1 height=100% rowspan=2>
										<table width=1 height="100%" cellpadding=0 cellspacing=0
											bgcolor=#99ccff>
											<tr>
												<td width=1></td>
											</tr>
										</table>
									</td>
									<td bgcolor=#f2f8ff valign=top width=* height="95%">
										<img src="" width=0 height=4>
										<BR>
										&nbsp;
										<a href=javascript:openScript(
											'messanger.jsp?action=new&touser=admin',420,320)><img
												src=pic/message.gif border=0 alt=给${rebbs.userName }发送一个短消息></a>&nbsp;
										<a href=javascript:openScript( 'dispuser.jsp?name=admin',350,300)><img
												src=pic/profile.gif border=0 alt=查看${rebbs.userName }的个人资料></a>&nbsp;
										<a
											href=queryResult.jsp?sType=1&nSearch=3&keyword=admin&forumID=1&SearchDate=ALL
											target=_blank><img src=pic/find.gif border=0
												alt="搜索${rebbs.userName }在『 ${boardinfo} 』的所有贴子"></a>&nbsp;
										<a href='mailto:${rebbs.userEmail}'><IMG
												alt='点击这里发送电邮给${note.userName }' border=0
												src='pic/email.gif'></a>&nbsp;
										<a href=reannounce.jsp?forumID=1&rootID=6&parentID=6&reply=true><img
												src=pic/reply.gif border=0 alt=引用回复这个贴子></a>&nbsp;
										<a href=reannounce.jsp?forumID=1&rootID=6&parentID=6><img
												src=pic/reply_a.gif border=0 alt=回复这个贴子></a>&nbsp;
	                                   <c:if test="${BoardMaster eq moder}">
	                                    <a href="bbs?path=m_delete_reply&announceID=${note.announceID}&replyid=${rebbs. announceID}"><img src=pic/delete.gif border=0 width=16 height=16 alt=删除回复
										align=absmiddle></a>&nbsp;
										</c:if>
										<BR>
										<hr width="100%" size=1 color=#777777>
										<table cellpadding=0 cellspacing=0 width="95%"
											style="word-break: break-all">
											<tr>
												<td width=32 align=left valign=top>
													<img src='pic/${rebbs.heart }' border=0 alt=发贴心情>
													&nbsp;
												</td>
												<td style="LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word">
													<font face=宋体 color=#333333> <b>${rebbs.title
															}[${rebbs.type}] </b> <br> </font>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													${rebbs.body }
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class=bottomline bgcolor=#f2f8ff valign=bottom>
										<hr width=100% size=1 color=#777777>
										<table width=100% cellpadding=0 cellspacing=0>
											<tr>
												<td align=left>
													&nbsp;
													<a href=editannounce.jsp?forumID=1&rootID=6&announceID=6><img
															src=pic/edit.gif border=0 alt=编辑这个贴子> </a>
												</td>
												<td align=left>
													发贴时间： 2008-08-31 10:14:58
												</td>
												<td align=left>
													<img src=pic/ip.gif border=0 width=13 height=15 alt="">
													IP:${rebbs.ip }已设置为保密！
												</td>
												<td align=right nowarp valign=bottom width=110>
													第 ${count.count} 楼
												</td>
												<td align=right valign=bottom width=4>
												</td>
											</tr>
										</table>
										<img src="" width=0 height=4>
										<BR>
									</td>
								</tr>
								<!-- 循环结束 -->


							</table>
						</td>
						<td bgcolor=#0099cc valign=middle width=1 height=24>
						</td>
					</tr>
				</table>

				<table cellpadding=0 cellspacing=0 border=0 width="95%"
					bgcolor=#0099cc align=center>
					<tr>
						<td height=1>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
		<!-- 循环回复结束 -->

		<!-- 快速回复 -->
		<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
			<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
				<tr bgcolor=#99ccff>
					<td align=left width=90% valign=middle>
						<font color=#000000>&nbsp;<b>*快速回复</b>：主题标题</font>
					</td>
					<td width=10% align=right valign=middle height=24>
						<a href=#top><img src=pic/gotop.gif border=0><font
							color=#000000>顶端</font> </a>&nbsp;
					</td>
				</tr>
			</table>

			<TABLE cellSpacing=1 cellPadding=1 width=95% border=0 align=center>
				<TR bgColor=#777777>
					<TD vAlign=top colSpan=3>
						<form action="bbs?path=quik" method=POST name=frmAnnounce>

							<TABLE cellSpacing=0 cellPadding=3 width=100% bgColor=#99ccff
								border=0>
								<input type=hidden name=parentID value=${note.parentID }>
								<input type=hidden name=boardID value=${note.boardID }>
								<input type=hidden name=title value=${note.title}>
								<INPUT TYPE=hidden name=announceid value=${note.announceID }>
								<TR bgColor=#f2f8ff>
									<c:if test="${user==null}">
										<TD noWrap width=175>
											你的用户名:
										</TD>
										<TD>
											<INPUT maxLength=25 size=15 value="" name="userName">
											&nbsp;&nbsp;
											<A href=reg.jsp>还没注册?</A> 密码:
											<INPUT type=password maxLength=13 size=15 value=""
												name="userPassword">
											&nbsp;&nbsp;
											<A href=lostpass.jsp>忘记密码?</A> ${intoMess}
										</TD>
									</c:if>
									<c:if test="${user!=null}">
										<TD noWrap width=175>
											你的用户名:
										</TD>
										<TD>
											<INPUT maxLength=25 size=15 value="${user.userName}"
												name="userName">
											&nbsp;&nbsp;
											<A href=reg.jsp>还没注册?</A> 密码:
											<INPUT type=password maxLength=13 size=15
												value="${user.userPassword}" name="userPassword">
											&nbsp;&nbsp;
											<A href=lostpass.jsp>忘记密码?</A>
										</TD>
									</c:if>
								</TR>
								<TR bgColor=#e8f4ff>
									<TD vAlign=top noWrap>
										<b>内容</b>
										<br>
										<li>
											登录后方可发表回复。
										<li>
											最多1000字
									</TD>
									<TD>
										<TEXTAREA name=content cols=80 rows=6 wrap=VIRTUAL
											onkeydown=ctlent()></TEXTAREA>
									</TD>
								</TR>
								<TR bgColor=#f2f8ff>
									<TD noWrap>
										<INPUT type=checkbox value=0 name=emailFlag>
										邮件回复
										<INPUT type=checkbox CHECKED value=1 name=signFlag>
										显示签名
									</TD>
									<TD width="100%">
										<input type=Submit value=OK!发表我的回应帖子 name=Submit>
										&nbsp;
										<input type=reset name=Clear value=清空内容！>
									</TD>
								</TR>
							</TABLE>
						</FORM>
					</TD>
				</TR>
			</TABLE>

			<table cellpadding=0 cellspacing=0 border=0 width="95%"
				bgcolor=#0099cc align=center>
				<tr>
					<td height=1>
					</td>
				</tr>
			</table>
	</body>

	<%@ include file="inc/foot.jsp"%>
</html>