<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<FORM name="theForm" action="user?path=serch" method="post">
	<table cellpadding=0 cellspacing=0 border=0 width=500
		bgcolor=#777777 align=center>
		<tr>
			<td>
 <c:forEach var="info" items="${listtoup}">
				<table cellpadding=3 cellspacing=1 border=0 width=100%>
					<TBODY>
						<TR align=middle bgcolor=#e8f4ff>
							<TD colSpan=2 height=24>
								<b>�޸ĸ�����Ϣ</b>
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150>
								ע �� ��**
							</TD>
							<TD>
								<INPUT maxLength=8 size=12 name=userName value="${info.userName}">
								(����ʹ����Ӣ������)
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150>
								�� ��
							</TD>
							<TD>
								<INPUT type=radio value="1" name=sex <c:if test="${info.sex==1}">
								   CHECKED
								</c:if>>
								<IMG height=27 src="pic/Male.gif" width=25 align=absMiddle>
								�к� &nbsp;&nbsp;&nbsp;&nbsp;
								<INPUT type=radio value="0" name=sex <c:if test="${info.sex==0}">
								   CHECKED
								</c:if>>
								<IMG height=27 src="pic/Female.gif" width=27 align=absMiddle>
								Ů��
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150>
								��&nbsp;&nbsp;&nbsp;&nbsp;��**
							</TD>
							<TD>
								<INPUT type=password maxLength=16 size=13 name=psw value="${info.userPassword}">
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150 height=32>
								Email��ַ **
							</TD>
							<TD height=32>
								<INPUT maxLength=50 size=27 name=userEmail value="${info.userEmail}">
								(�磺abc@acai.net)
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150 height=32>
								����
								<img id=face src="Image1.gif" alt=�����������>
								**
							</TD>
							<TD height=15>
								<select name=face size=1
									onChange="document.images['face'].src=options[selectedIndex].value;"
									style="BACKGROUND-COLOR: #99CCFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000">
								</select>
						</TR>
						<tr bgcolor=#f2f8ff>
							<td width=150 height=32>
								�����лظ�ʱ�Ƿ���ʾ
							</td>
							<td height=16>
								<input type="radio" name="showRe" value="1" <c:if test="${info.showre==1}">
								   checked
								</c:if>>
								��ʾ��
								<input type="radio" name="showRe" value="0"
                                <c:if test="${info.showre==0}">
								   checked
								</c:if>>
								����ʾ
						</tr>
						<TR bgcolor=#f2f8ff>
							<TD width=150 valign=top>
								�Զ���ͷ��
								<br>
								���ͼ��λ����������ͼƬ�����Զ����Ϊ��
							</TD>
							<TD>
								ͼ��λ�ã�
								<input type="TEXT" name="myface" size=20 maxlength=100 value="${info.face}">
								����Url��ַ
								<br>
								��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�
								<input type="TEXT" name="width" size=2 maxlength=2 value="${info.width}">
								20---80������
								<br>
								��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�
								<input type="TEXT" name="height" size=2 maxlength=2 value="${info.height}">
								20---80������
								<br>
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150>
								OICQ����
							</TD>
							<TD>
								<INPUT maxLength=20 size=44 name=oicq value="${info.oicq}">
							</TD>
						</TR>
						<TR bgcolor=#f2f8ff>
							<TD width=150>
								ǩ ��
								<BR>
								<BR>
								���ֽ�����������������µĽ�β�����������ĸ��ԡ�
							</TD>
							<TD>
								<TEXTAREA name=sign rows=5 wrap=PHYSICAL cols=42>${info.article}</TEXTAREA>
							</TD>
						</TR>
						<TR align=middle bgcolor=#e8f4ff>
							<TD colSpan=2>
								<DIV align=center>
									<INPUT value="�޸�" name=Submit type=submit>
									<INPUT type=reset value="�� д" name=Submit2>
								</DIV>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
                 </c:forEach>
			</td>
		</tr>
	</table>
</FORM>
