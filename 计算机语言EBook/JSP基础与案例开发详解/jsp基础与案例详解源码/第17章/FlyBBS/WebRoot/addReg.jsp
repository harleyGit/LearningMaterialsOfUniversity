<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>****��ӭע�᱾��̳****</title>
		<link rel=stylesheet type=text/css href=css/forum.css>
	</head>
	<body>
	<%@ include file="inc/top.jsp"%>
	<TABLE border=0 width="95%" align=center>
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
					&nbsp;&nbsp; ע�����û�
				</TD>
			</TR>
	</TABLE>
		<FORM name=theForm action=user?path=add method=post>
			<table cellpadding=3 cellspacing=2 border=0 width=55% align="center">
				<TR align=middle bgcolor=#99ccff>
					<TD colSpan=2 height=24>
						<b>���û�ע��</b>
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						ע �� ��**
					</TD>
					<TD>
						<INPUT maxLength=8 size=12 name=userName>
						(ֻ����ʹ��Ӣ��)
					</TD>
				</TR>
                <TR bgcolor=#f2f8ff>
					<TD width=150>
						�� ��**
					</TD>
					<TD>
						<INPUT maxLength=8 size=12 name=nickname>
						(����ʹ����Ӣ������)
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>					
					<TD width=150>
						�� ��
					</TD>
					<TD>
						<INPUT type=radio CHECKED value="1" name=sex>
						<IMG height=27 src="pic/Male.gif" width=25 align=absMiddle>
						�к� &nbsp;&nbsp;&nbsp;&nbsp;
						<INPUT type=radio value="0" name=sex>
						<IMG height=27 src="pic/Female.gif" width=27 align=absMiddle>
						Ů��
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						��&nbsp;&nbsp;&nbsp;&nbsp;��**
					</TD>
					<TD>
						<INPUT type=password maxLength=16 size=13 name=psw>
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						����ȷ�� **
					</TD>
					<TD>
						<INPUT type=password maxLength=16 size=13 name=pswc>
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150 height=32>
						Email��ַ **
					</TD>
					<TD height=32>
						<INPUT maxLength=50 size=27 name=userEmail>
						(�磺abc@acai.net)
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150 height=32 bgcolor="#f2f8ff">
						����
						<img id=face src="pic/Image1.gif" alt=�����������>
						**					</TD>
					<TD height=15>
						<select name=face size=1
							onChange="document.images['face'].src=options[selectedIndex].value;"
							style="BACKGROUND-COLOR: #99CCFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000">

							<option value='pic/Image1.gif'>
								Image1
							</option>
							<option value='pic/Image2.gif'>
								Image2
							</option>
							<option value='pic/Image3.gif'>
								Image3
							</option>
							<option value='pic/Image4.gif'>
								Image4
							</option>
							<option value='pic/Image5.gif'>
								Image5
							</option>
							<option value='pic/Image6.gif'>
								Image6
							</option>

						</select>
					</TD>
				</TR>
<tr>
<td bgcolor="#f2f8ff">�ϴ�ͷ��</td><td bgcolor="#f2f8ff"><label>
  <input name="diyface" type="text" id="diyface">
</label>
  <label>
  <input name="Submit3" type="button" class="bianhui" value=" �� �� ">
  </label></td>
</tr>
				<TR bgcolor=#f2f8ff>
					<TD width=150 valign=top>
						�Զ���ͷ��
						<br>
						���ͼ��λ����������ͼƬ�����Զ����Ϊ��,ͼ���СΪ��ʱ��Ĭ��Ϊ20*20
					</TD>
					<TD>
						
						<br>

						ͼ���С��
						
						<br>
						��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�
						<input type="TEXT" name="width" size=2 maxlength=2>
						20---80������
						<br>
						��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�
						<input type="TEXT" name="height" size=2 maxlength=2>
						20---80������
						<br>
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						QQ����
					</TD>
					<TD>
						<INPUT maxLength=20 size=44 name=qq>
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
						<TEXTAREA name=sign rows=5 wrap=PHYSICAL cols=42></TEXTAREA>
					</TD>
				</TR>
				<TR align=middle bgcolor=#99ccff>
					<TD colSpan=2>
						<DIV align=center>
							<INPUT name=Submit type=submit class="bianhui" value="ע ��">
							<INPUT name=Submit2 type=reset class="bianhui" value="�� д">
						</DIV>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</body>
	<%@ include file="inc/foot.jsp"%>