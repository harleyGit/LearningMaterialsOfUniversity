<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
	<head>
		<title>${configlist.forumName }</title>
		<link rel=stylesheet type=text/css href=css/forum.css>
		<script src="js/time.js"></script>
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
		<TABLE border=0 width=95% align=center>
			<TBODY>
				<TR>
					<TD align=left>
						<a href="#"><img border=0
								src=pic/LOGO.GIF></a>
					</TD>
					<TD Align=right>
						����������
						<font color=red><b>${today }</b> </font> | ����������
						<b>${maxZhuTi }</b> | ����������
						<b>${maxbbs }</b>
						<br>
						ע���Ա
						<B>${usernum }</B> | ��ӭ�»�Ա
						<a href="javascript:" onClick="window.open('user?path=seluser&username=${lastuser.userName }',350,300)"><font
							color=#ff0000>${lastuser.nickName }</font> </a> ���뱾��̳
						<p>
							<img src="pic/time.gif">
							<font color="#666666" id="timeBox"
								title="��ǰ������ʱ�䣬�����ʾ���ػ���ҳʱ��ʱ�����ƫ���ˢ�¾���������ʾ" face="Arial"></font>
							
							<img src=pic/userlist1.gif>
							<a href="user?path=serch&type=top">�û��б�</a>
							
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<br>

		<style>
TABLE {
	BORDER-TOP: 0px;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 1px;
}

TD {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
}
</style>

		<table cellspacing=0 border=0 width=95% bgcolor="#0099cc" align=center>
			<tr>
				<td height=1></td>
			</tr>
		</table>
		<table cellpadding=6 cellspacing=0 width=95% align=center
			bordercolor=#0099cc border=1>
			<TR>
				<TD bgColor="#f2f8ff" width=110>
					<IMG align=absMiddle src=pic/gb.gif>
					��̳��Ϣ�㲥:
				</TD>
				<TD bgColor="#f2f8ff">
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

			</TR>

		</table>
		<table cellpadding=6 cellspacing=0 width=95% align=center
			bordercolor=#0099cc border=1>
			<TR bgColor="#99ccff">
				<TD width=26>
					<B><FONT COLOR="#000000">״̬</font> </b>
				</TD>
				<TD vAlign=center>
					<B><FONT COLOR="#000000">��̳����</FONT> </B>
				</TD>
				<TD vAlign=center align=middle width=80>
					<B><FONT COLOR="#000000">����</FONT> </B>
				</TD>
				<TD vAlign=center noWrap align=middle width=38>
					<B><FONT COLOR="#000000">����</FONT> </B>
				</TD>
				<TD vAlign=center noWrap align=middle width=38>
					<B><FONT COLOR="#000000">����</FONT> </B>
				</TD>
				<TD vAlign=center noWrap align=middle width=168>
					<B><FONT COLOR="#000000">��󷢱�</FONT> </B>
				</TD>
				<TD vAlign=center align=middle width=26>
					<B><FONT COLOR="#000000">�ղ�</FONT> </B>
				</TD>
			</TR>
		</table>

		<c:forEach items="${classtype}" var="classType">
			<table cellpadding=6 cellspacing=0 width=95% align=center
				bordercolor="#0099cc" border=1>
				<TR>
					<TD bgColor="#f2f8ff" colSpan=7>
						<B>${classType.classType}</B>
					</TD>
				</TR>
				<c:forEach items="${boardlist}" var="board">
					<c:if test="${board.classType==classType.id}">
						<TR>
							<c:choose>
								<c:when test="${board.boarduser!=null}">
									<TD vAlign=top align=middle width=26 bgColor="#e8f4ff">
										<img src=pic/foldernew.gif width=13 height=16 alt=������̳����������>
									</TD>
								</c:when>
								<c:otherwise>
									<TD vAlign=top align=middle width=26 bgColor="#e8f4ff">
										<img src=pic/ifolder.gif width=13 height=16 alt=������̳����������>
									</TD>
								</c:otherwise>
							</c:choose>
							<TD vAlign=top width=* bgColor="#f2f8ff">
								<a
									href="control?path=boardInfo&boardid=${board.boardid}&parentid=${board.classType }&bbstype=${board.lockboard}&day=4"><font
									color=#000066>�� ${board.boardType} ��</font> </a>
								<br>
								${board.readme}
							</TD>
							<TD vAlign=center align=middle bgColor="#e8f4ff" width=80>
								${board.boardMaster}
							</TD>
							<TD vAlign=center noWrap align=middle width=38 bgColor="#f2f8ff">
								${board.maxMotif }
							</TD>
							<TD vAlign=center noWrap align=middle width=38 bgColor="#f2f8ff">
								${board.maxNote }
							</TD>
							<TD noWrap width=168 bgColor="#e8f4ff">
								<font color=#000066>���⣺</font><a
									href='bbs?path=noteInfo&AnnounceID=${board.lastrootid }'>${board.lasttitle}</a>
								<br>
								<font color=#000066>��󷢱�</font>
								<a href="javascript:" onClick="window.open('user?path=seluser&username=${board.boarduser}',350,300)">${board.nickName}</a>
								<IMG border=0 src=pic/lastpost.gif>
								<br>
								${board.lastposttime}
							</TD>
							<TD vAlign=center noWrap align=middle width=26 bgColor="#f2f8ff">
								<A
									href="javascript:window.external.AddFavorite('http://www.justhis.com/forum/list.jsp?forumID=1','����������̳--�� ������̳ ����̳��http://www.justhis.com/forum/��')"
									target=_self><img src=pic/fav.gif border=0></A>
							</TD>
						</TR>
					</c:if>
				</c:forEach>
			</table>
		</c:forEach>
		<BR>
		<BR>
		<table cellspacing=0 border=0 width=95% bgcolor="#0099cc" align=center>
			<tr>
				<td height=1></td>
			</tr>
		</table>
		<table cellpadding=6 cellspacing=0 width=95% align=center
			bordercolor="#0099cc" border=1>
			<TR>
				<TD bgColor="#99ccff" colSpan=2>
					<b>�û�������Ϣ</b>
				</TD>
			</TR>
			<TR>
				<TD vAlign=top align=middle width=26 bgColor="#e8f4ff">
					<IMG align=absMiddle src=pic/inboxnonew.gif>
				</TD>
				<TD vAlign=top bgColor="#f2f8ff">
					����IP�ǣ�${ip }������ϵͳ��${osname }, � �� ����${ie }
				</TD>
			</TR>
		</TABLE>
		<br>
		<table cellpadding=6 cellspacing=0 width=95% align=center
			bordercolor="#0099cc" border=1 style="word-break: break-all;">
			<TR>
				<TD bgColor="#99ccff" colSpan=2>
					<b>��̳����ͳ��</b> [
					<a href=index.jsp?action=online>�ر���ϸ�б�</a>] [
					<a href=online.jsp><font color=#000000>�����û�</font> </a>]
				</TD>
			</TR>
			<TR>
				<TD vAlign=top align=middle width=26 bgColor="#e8f4ff">
					<IMG align=absMiddle src=pic/pmlogin.gif>
				</TD>
				<TD vAlign=top bgColor="#f2f8ff">
					������̳�Ϲ���
					<b>${maxManager }</b> λ��Ա��
					<b>${maxGuest }</b> λ���ˣ�ͬʱ���߷�ֵ
					<b>${maxManager+maxGuest }</b>������ʱ��
					<b>2008-09-25 10:29:49</b>��
					<br>
					<font color=#ff0000>��������ͼ��</font>��
					<img src=pic/ao1.gif>
					��̳�� ��
					<img src=pic/ao.gif>
					��̳̳�� ��
					<img src=pic/gb(1).gif>
					��̳��� ��
					<img src=pic/messages1.gif>
					��ͨ��Ա ��
					<img src=pic/messages2.gif>
					���˻������Ա
					<hr size=1>
					<table width=100% border=0 cellspacing=0 cellpadding=0>
						<tr>
							<td>
								<c:forEach items="${userList}" var="listuser">
									<c:choose>
										<c:when test="${listuser.bbstype==10}">
											<img src="pic/ao1.gif">
										</c:when>
										<c:when test="${listuser.bbstype==8}">
											<img src='pic/ao.gif'>
										</c:when>
										<c:when test="${listuser.bbstype==5}">
											<img src='pic/gb(1).gif'>
										</c:when>
										<c:when test="${listuser.bbstype==1}">
											<img src='pic/messages1.gif'>
										</c:when>
										<c:otherwise>
											<img src='pic/messages2.gif'>
										</c:otherwise>
									</c:choose>
							${listuser.username }
						</c:forEach>
							</td>
						</tr>
					</table>
				</TD>
			</TR>
		</TABLE>
		<br>
		<table cellspacing=0 cellpadding=0 width=95% bgcolor="#0099cc"
			align=center border=0>
			<tr>
				<td>
					<table cellspacing=1 cellpadding=3 width=100% border=0>
						<tr>
							<td width=75% bgcolor=#99ccff>
								<font color=#000000><b> -=> ${configlist.forumName }</b>
								</font>
							</td>
							<td align=right noWrap bgcolor=#99ccff width="25%">
								����ʱ���Ϊ - ����ʱ��
							</td>
						</tr>
						<tr>
							<td bgcolor=#f2f8ff colspan=3>
								<table cellspacing=4 cellpadding=0 width=92% border=0
									align=center>
									<tr>
										<td colspan=6>
											��̳ͼ���������½�����ϴη��ʺ����ʾ ���������½���ܲ鿴���飬����ֻ��ʾ����̳��������ͼ����

										</td>
									</tr>
									<tr>
										<td>
											<font color=#ff0000 TITLE=����ע���Ա���Ժͻظ�>������̳</font>
										</td>
										<td>
											<font color=#ff0000 TITLE=ֻ�����½�û�������Ժͻظ�>������̳</font>
										</td>
										<td>
											<font color=#ff0000 TITLE=�����κ��˷��Ժͻظ�>������̳</font>
										</td>
										<td>
											<font color=#ff0000 TITLE=����̳���Ͱ������ԣ�����ע���û�ֻ�ܻظ�>������̳</font>
										</td>
										<td>
											<font color=#ff0000 TITLE=����ӵ�з���������Ѿ�������֤��ע���Ա����>��֤��̳</font>
										</td>
										<td colspan=2>
											<font color=#ff0000>������̳</font>
										</td>
									</tr>
									<tr>
										<td>
											<img src=pic/foldernew.gif width=13 height=16>
											���µ�����
										</td>
										<td>
											<img src=pic/foldernew.gif width=13 height=16>
											���µ�����
										</td>
										<td>
											<img src=pic/folderallnew.gif width=13 height=16>
											���µ�����
										</td>
										<td>
											<img src=pic/follownew.gif width=13 height=16>
											���µ�����
										</td>
										<td>
											<img src=pic/lock_l.gif width=13 height=16>
											���µ�����
										</td>
										<td>
											<img src=pic/jinghua.gif width=13 height=16
												TITLE=ֻ����̳���Ͱ������ԺͲ���>
											ֻ��������
										</td>
										<td align=right valign=top rowspan=2>
											<a href=http://xacai.yeah.net target=_blank
												title="---------------------    ������    ---------------------&#13;&#10; UJBB��̳�� ACai.java����&#13;&#10; �����ʾ�� Powered By xacai.yeah.net &#13;&#10; ��л���������ǵ���̳�����������ĸ��ã�&#13;&#10;---------------------    ������    ---------------------"><img
													src=pic/logo_2.gif border=0> </a>
										</td>
									</tr>
									<tr>
										<td>
											<img src=pic/ifolder.gif width=13 height=16>
											û��������
										</td>
										<td>
											<img src=pic/ifolder.gif width=13 height=16>
											û��������
										</td>
										<td>
											<img src=pic/folderall.gif width=13 height=16>
											û��������
										</td>
										<td>
											<img src=pic/follow.gif width=13 height=16>
											û��������
										</td>
										<td>
											<img src=pic/lock_b.gif width=13 height=16>
											û��������
										</td>
										<td>
											<img src=pic/shareforum.gif width=16 height=16
												TITLE=�ͱ���̳�������ӵ�������̳>
											������̳��
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

