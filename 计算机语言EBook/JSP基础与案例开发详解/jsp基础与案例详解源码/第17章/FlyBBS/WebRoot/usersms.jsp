<%@ page contentType="text/html;charset=GBK"%>
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
					&nbsp;&nbsp; 发送短消息
				</TD>
			</TR>
	</TABLE>
<form action="mess?path=talkOk" method=post name=messager>
  <table cellpadding=0 cellspacing=0 border=0 align=center>
  <input type="hidden" name="sender" value="${sender}">
    <tr> 
      <td> 
        <table cellpadding=3 cellspacing=1 border=0 width=100%>
          <tr> 
            <td bgcolor=#CCFFFF colspan=2 align=center><font size="2"><b>发送短消息</b>--请完整输入下列信息</font></td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=middle width=70><font size="2"><b>收件人：</b></font></td>
            <td bgcolor=#CCFFFF valign=middle>
             <input type="text" name="incept" value="${incept}" readonly></td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=top><font size="2"><b>标题：</b></font></td>
            <td bgcolor=#CCFFFF valign=middle>
              <input type=text name="title" size=50 maxlength=80>
              <font size="2">&nbsp;请限定50字内</font></td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=top><font size="2"><b>内容：</b><br></font></td>
            <td bgcolor=#CCFFFF valign=middle>
              <textarea cols=70 rows=8 name="content" title="">
</textarea>            </td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=middle colspan=2 align=center> 
              <input type=Submit value="发送" name=Submit>
              &nbsp; 
              <input type=Submit value="保存" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="清除">            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
