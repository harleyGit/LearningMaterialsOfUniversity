<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
	<head>
		<title>${configlist.forumName }--�� ${boardinfo } ��</title>
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

	</head>
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
						&nbsp;&nbsp;�� ${boardinfo } ��
						<a name=top></a>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<br>

		<TABLE cellSpacing=0 cellPadding=0 width=95% border=0 align=center>
			<TBODY>
				<tr>
					<td align=center width=34 valign=middle>
						<img src='pic/gb.gif' border=0 alt=������̳�Ĺ��棡���ɲ������� width=20
							height=17>

					</td>
					<TD width=80%>
						<MARQUEE scrollamount="3" onMouseOver="this.stop()"
							onMouseOut="this.start()">
							<b> <c:choose>
									<c:when test="${fn:length(bbsnews)==0}">
										<ACRONYM TITLE=��ǰû�й���>��ǰû�й���</ACRONYM>
									</c:when>
									<c:otherwise>
										<c:forEach items="${bbsnews}" var="bbsnew">
											<a href="">${bbsnew.title } (${bbsnew.addtime
												})&nbsp;&nbsp;&nbsp;</a>
										</c:forEach>
									</c:otherwise>
								</c:choose> </b>
						</MARQUEE>
					</TD>
					<td align=right valign=middle>
						<p>
					
							<input type=hidden name=forumID value=1>
						
								
							<select onChange="if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}">
								<option> ������ѯ
								<option value="control?path=boardInfo&day=4&boardid=${boardid}&parentid=${parentid}&bbstype=${bbstype}">
									�鿴���е�����
								<option value="control?path=boardInfo&day=5&boardid=${boardid}&parentid=${parentid}&bbstype=${bbstype}">
									�鿴һ���ڵ�����
								<option value=control?path=boardInfo&day=7&boardid=${boardid}&parentid=${parentid}&bbstype=${bbstype}>
									�鿴һ�����ڵ�����
								<option value=control?path=boardInfo&day=30&boardid=${boardid}&parentid=${parentid}&bbstype=${bbstype}>
									�鿴һ�����ڵ�����
								<option value=control?path=boardInfo&day=6&boardid=${boardid}&parentid=${parentid}&bbstype=${bbstype}>
									�鿴�����ڵ�����
							</select>
						
					</td>
				</tr>
			</TBODY>
		</TABLE>
		<table cellspacing=0 border=0 width=95% bgcolor="#0099cc" align=center>
			<tr>
				<td height=1></td>
			</tr>
		</table>
		<TABLE border=1 cellpadding=0 cellspacing=0 width=95% align=center
			bordercolor=#0099cc>
			<TBODY>
				<TR>
					<TD height=27 width="95%" bgColor=#99ccff>
						<font color=#000000>Ŀǰ��̳������<b>0</b>�ˣ����С� ${boardinfo } ���Ϲ���
							<b>0</b> λ��Ա�� <b>0</b> λ����.�������� <font color="#ff0000"><b>1</b>
						</font> [<a href=list.jsp?action=online&forumID=1><font color=#000000>�ر���ϸ�б�</font>
						</a>] &nbsp;[<a href=online.jsp?forumID=1><font color=#000000>�����û�</font>
						</a>] 
					</TD>
					<TD bgColor=#99ccff width="5%" align=center>
						<a href='list.jsp?forumID=1&Page=1&skin='><img
								src='pic/refresh_1.gif' border=0 alt='ˢ��'> </a>
					</TD>
				</TR>
				<tr>
					<td colspan=2 bgcolor=#f2f8ff>
						<table cellpadding=6 cellspacing=1 border=0 width="100%"
							style="word-break: break-all;">
						</TABLE>
				</tr>
			</TBODY>
		</TABLE>
		<br>
		<table cellpadding=0 cellspacing=0 border=0 width=95% align=center>
			<tr>
				<td align=center width=2 valign=middle>
				</td>
				<td align=left valign=middle>
					<a href='control?path=newNote&boardid=${boardid }&parentid=${parentid }'><img src='pic/post.gif' border=0 alt='������'/></a>&nbsp;&nbsp;&nbsp;
					<a href='control?path=vote&boardid=${boardid }&parentid=${parentid }'><img src='pic/newpoll.gif' border=0 alt='������ͶƱ'/></a>
				</td>
				<td align=right>
					<b><a href='elist.jsp?forumID=1'>��̳����</a> ��̳����:</b>
					<c:choose>
						<c:when test="${master==null || master==''}">��ȱ</c:when>
						<c:otherwise>${master}</c:otherwise>
					</c:choose>

				</td>
			</tr>
		</table>

		<table cellspacing=0 border=0 width=95% bgcolor="#0099cc" align=center>
			<tr>
				<td height=1>
					<br>
					<br>
				</td>
			</tr>
		</table>
		<TABLE style="color: " "&tableFontColor&"  border=1 cellPadding=0
			cellSpacing=0 width=95% align=center bordercolor="#0099cc">
			<TBODY>
				<TR align=middle>
					<TD height=27 width=32 bgColor="#99ccff">
						<font color="#000000">״̬ 
					</TD>
					<TD bgColor="#99ccff" width=*>
						<font color="#000000">�� �� (��<img src=pic/plus.gif>����չ�������б�)

						
					</TD>
					<TD bgColor="#99ccff" width=80>
						<font color="#000000">�� �� 
					</TD>
					<TD bgColor="#99ccff" width=64>
						<font color="#000000">�ظ�/���� 
					</TD>
					<TD bgColor="#99ccff" colspan="2">
						<font color="#000000">������ | �ظ��� 
					</TD>
				</TR>
			<TBODY>
				<c:forEach items="${bbs}" var="bbs">
					<TR align=middle>
						<TD bgColor="#e8f4ff" width=32 height=27>
							<c:if test="${bbs.isvote!=1}">
								<c:choose>
									<c:when test="${bbs.reBbs>10}">
										<img src="pic/hotfolder.gif" alt=�ظ�����10��>
									</c:when>
									<c:otherwise>
										<img src="pic/folder.gif" alt=��������>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${bbs.isvote==1}">
								<img src="pic/closedb.gif" alt=ͶƱ��>
							</c:if>
                            <c:if test="${bbs.isgood==1}">
								<img src="pic/isbest.gif" alt=������>
							</c:if>
                            <c:if test="${bbs.istop==1}">
								<img src="pic/istop.gif" alt=�ö���>
							</c:if>
						</TD>
						<TD align=left bgcolor="#f2f8ff" width=*
							onmouseover=javascript:this.bgColor=
							'#e8f4ff' onmouseout=javascript:this.bgColor='#f2f8ff'>
							<img src='pic/nofollow.gif' id='followImg1'>
							<a href="bbs?path=noteInfo&AnnounceID=${bbs.announceID }"
								title="��${bbs.title }��<br>���ߣ�${bbs.userName}<br>������${bbs.dateAndTime}<br>">
								${bbs.title }</a>
						</TD>
						<TD bgColor="#e8f4ff" width=80>
							<a href=javascript:openUser('admin')>${bbs.userName}</a>
						</TD>
						<TD bgColor="#f2f8ff" width=64>
							<font color="#000000">${bbs.reBbs}/${bbs.hits }</font>
						</TD>
						<TD align=center bgColor="#e8f4ff" width=92>
							&nbsp;
							<a href=dispbbs.jsp?forumID=1&rootID=1&id=1>${bbs.lasttime }</a>&nbsp;

						</TD>
						<TD width=92>
							&nbsp;
							<a href=javascript:openUser('-------')>${bbs.lastUser }</a>
						</TD>
					</TR>
				</c:forEach>

			</TBODY>
		</TABLE>

		<table border=0 cellpadding=0 cellspacing=3 width=95% align=center>
			<form method=post action=list.jsp name=frmList2>
				<input type=hidden name=selTimeLimit value="">
			<tr>
				<td valign=middle>
					<span class=smallFont>ҳ�Σ�<strong>1</strong>/<strong>1</strong>ҳ
						ÿҳ<strong>25</strong> ������<strong>3</strong>
				</td>
				<td valign=middle>
					<div align=right>
						<p>
							��ҳ��
							<font color=gray>[1]</font>
							<span class=smallFont>ת��:<input type=text name=Page size=3
									maxlength=10 value='1'> <input type='submit' value=Go
									id=button1 name=button1> </span>
						</p>
					</div>
				</td>
			</tr>
			<input type=hidden name=forumID value='1'>
		</table>
		<table border=0 cellpadding=0 cellspacing=3 width=95% align=center>
			<tr>
				<td valign=middle nowrap>
					<div align=right>

						<select
							onchange="if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}">
							<option value='1'>
								��̳��ת��...
							</option>
							<c:forEach items="${boardlist}" var="board">
								<option style="BACKGROUND-COLOR: #99ccff"
									value="control?path=boardInfo&boardid=${board.boardid}&parentid=${board.classType}&day=4">
									�� ${board.boardType}��
								</option>
							</c:forEach>
						</select>
						<div>
				</td>
			</tr>

		</table>
		<table cellspacing=0 cellpadding=0 width=95% align=center
			bgcolor="#0099cc" border=0>
			<tr>
				<td>
					<table cellspacing=1 cellpadding=3 width=100% border=0>
						<tr bgcolor="#99ccff">
							<td width=80%>
								<font color="#000000"><b> -=> ${configlist.forumName
										}ͼ��</b> </font>
							</td>
							<td noWrap width=20% align=right>
								<font color="#000000">����ʱ���Ϊ - ����ʱ�� &nbsp; 
							</td>
						</tr>
						<tr>
							<td colspan=3 bgcolor="#f2f8ff">
								<table cellspacing=4 cellpadding=0 width=92% border=0
									align=center>
									<tr>
										<td>
											<img src=pic/folder.gif>
											���ŵ�����
										</td>
										<td>
											<img src=pic/hotfolder.gif>
											�ظ�����10��
										</td>
										<td>
											<img src=pic/lockfolder.gif>
											����������
										</td>
										<td>
											<img src=pic/istop.gif>
											�̶����˵�����
										</td>
										<td>
											<img src=pic/isbest.gif>
											��������
										</td>
									</tr>
									<tr>
										<td width=100% colspan=5>
											HTML��ǩ��
											<font color=#990000>ON</font>. UBB��ǩ��
											<font color=#003399>ON</font>. ��ͼ��ǩ��
											<font color=#003399>ON</font>. Flash��ǩ��
											<font color=#003399>ON</font>. �����ַ�ת����
											<font color=#003399>ON</font>. ͷ���ϴ���
											<font color=#003399>ON</font>. �û�ͷ�Σ�
											<font color=#003399>ON</font>.
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
	<%@ include file="inc/foot.jsp"%>
</html>


