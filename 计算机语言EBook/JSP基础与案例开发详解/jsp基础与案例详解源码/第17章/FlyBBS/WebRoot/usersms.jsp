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
					&nbsp;&nbsp; ���Ͷ���Ϣ
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
            <td bgcolor=#CCFFFF colspan=2 align=center><font size="2"><b>���Ͷ���Ϣ</b>--����������������Ϣ</font></td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=middle width=70><font size="2"><b>�ռ��ˣ�</b></font></td>
            <td bgcolor=#CCFFFF valign=middle>
             <input type="text" name="incept" value="${incept}" readonly></td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=top><font size="2"><b>���⣺</b></font></td>
            <td bgcolor=#CCFFFF valign=middle>
              <input type=text name="title" size=50 maxlength=80>
              <font size="2">&nbsp;���޶�50����</font></td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=top><font size="2"><b>���ݣ�</b><br></font></td>
            <td bgcolor=#CCFFFF valign=middle>
              <textarea cols=70 rows=8 name="content" title="">
</textarea>            </td>
          </tr>
          <tr> 
            <td bgcolor=#CCFFFF valign=middle colspan=2 align=center> 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="���">            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
