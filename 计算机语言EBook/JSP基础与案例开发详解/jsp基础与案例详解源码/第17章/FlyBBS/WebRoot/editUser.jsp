<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>修改用户信息</title>
		<link rel=stylesheet type=text/css href=css/forum.css>
	    <style type="text/css">
<!--
.STYLE1 {font-size: 12px}
-->
        </style>
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
					&nbsp;&nbsp; 编辑用户信息
				</TD>
			</TR>
	</TABLE>
    <c:choose>
		<c:when test="${empty editOk}">
            <FORM name=theForm action=user?path=edit method=post>
			<table cellpadding=3 cellspacing=2 border=0 width=55% 

align="center">
				<TR align=middle bgcolor=#99ccff>
					<TD colSpan=2 height=24>
						<b>编辑用户信息</b>
					</TD>
				</TR>
                <input type="hidden" name="userID" value="${user.userID}">
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						注 册 名
					</TD>
					<TD>
						<INPUT maxLength=8 size=12 name=userName 

value="${user.userName }" readonly>
					</TD>
				</TR>
                <TR bgcolor=#f2f8ff>
					<TD width=150>
						昵 称
					</TD>
					<TD>
						<INPUT maxLength=8 size=12 name=nickName value="${user.nickName }">
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>					
					<TD width=150>
						性 别
					</TD>
					<TD>
                    <c:choose>
                    <c:when test="${user.sex==1}">
                    <INPUT type=radio CHECKED value="1" name=sex>
						<IMG height=27 src="pic/Male.gif" width=25 

align=absMiddle>
						男孩 &nbsp;&nbsp;&nbsp;&nbsp;
						<INPUT type=radio value="0" name=sex>
						<IMG height=27 src="pic/Female.gif" width=27 

align=absMiddle>
						女孩
                    </c:when>
                    <c:otherwise>
                    <INPUT type=radio value="1" name=sex>
						<IMG height=27 src="pic/Male.gif" width=25 

align=absMiddle>
						男孩 &nbsp;&nbsp;&nbsp;&nbsp;
						<INPUT type=radio value="0" name=sex 

CHECKED>
						<IMG height=27 src="pic/Female.gif" width=27 

align=absMiddle>
						女孩
                    </c:otherwise>
                    </c:choose>
						
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						密&nbsp;&nbsp;&nbsp;&nbsp;码**
					</TD>
					<TD>
						<INPUT type=password maxLength=16 size=13 

name=psw value="${user.userPassword}">
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						密码确认 **
					</TD>
					<TD>
						<INPUT type=password maxLength=16 size=13 

name=pswc value="${user.userPassword}">
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150 height=32>
						Email地址 **
					</TD>
					<TD height=32>
						<INPUT maxLength=50 size=27 name=userEmail 

value="${user.userEmail}">
						(如：abc@acai.net)
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150 height=32 bgcolor="#f2f8ff">
						形象
						<img id=face src="pic/Image1.gif" alt=个人形

象代表>
						**					

</TD>
					<TD height=15>
						<select name=face size=1
							onChange="document.images

['face'].src=options[selectedIndex].value;"
							style="BACKGROUND-COLOR: #99CCFF; 

BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 

1px double; COLOR: #000000">

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
<td bgcolor="#f2f8ff">上传头像</td><td bgcolor="#f2f8ff"><label>
  <input name="diyface" type="text" id="diyface">
</label>
  <label>
  <input name="Submit3" type="button" class="bianhui" value=" 上 传 ">
  </label></td>
</tr>
				<TR bgcolor=#f2f8ff>
					<TD width=150 valign=top>
						自定义头像
						<br>
						如果图像位置中有连接图片将以自定义的为主,图

像大小为空时则默认为20*20
					</TD>
					<TD>
						
						<br>

						图像大小：
						
						<br>
						宽&nbsp;&nbsp;&nbsp;&nbsp;度：
						<input type="TEXT" name="width" size=2 

maxlength=2>
						20---80的整数
						<br>
						高&nbsp;&nbsp;&nbsp;&nbsp;度：
						<input type="TEXT" name="height" size=2 

maxlength=2>
						20---80的整数
						<br>
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						QQ号码
					</TD>
					<TD>
						<INPUT maxLength=20 size=44 name=qq 

value="${user.qq}">
					</TD>
				</TR>
				<TR bgcolor=#f2f8ff>
					<TD width=150>
						签 名
						<BR>
						<BR>
						文字将出现在您发表的文章的结尾处。体现您的个

性。
					</TD>
					<TD>
						<TEXTAREA name=sign rows=5 wrap=PHYSICAL 

cols=42>${user.sign}</TEXTAREA>
					</TD>
				</TR>
				<TR align=middle bgcolor=#99ccff>
					<TD colSpan=2>
						<DIV align=center>
							<INPUT name=Submit type=submit 

class="bianhui" value="编 辑">
							<INPUT name=Submit2 type=reset 

class="bianhui" value="重 写">
						</DIV>
					</TD>
				</TR>
			</TABLE>
		</FORM>
        </c:when>
        <c:otherwise>
        <table cellpadding=3 cellspacing=2 border=0 width=55% align="center">
				<TR align=middle bgcolor=#99ccff>
					<TD colSpan=2 height=24>&nbsp;</TD>
				</TR>
                <input type="hidden" name="userID" value="${user.userID}">
				<TR bgcolor=#f2f8ff>
					<TD colspan="2"><p>&nbsp;</p>
					  <p>&nbsp;</p>
					  <p align="center">用户信息已修改</p>
				    <p>&nbsp;</p>
				    <p>&nbsp;</p></TD>
				</TR>
				
				<TR align=middle bgcolor=#99ccff>
					<TD colSpan=2>
						<DIV align=center></DIV>					</TD>
				</TR>
			</TABLE>
        </c:otherwise>
	</c:choose>
    
	</body>
	<%@ include file="inc/foot.jsp"%>