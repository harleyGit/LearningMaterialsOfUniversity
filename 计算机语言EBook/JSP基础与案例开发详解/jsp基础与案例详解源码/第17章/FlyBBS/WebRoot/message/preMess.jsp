<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>写短消息</title>
</head>
<body>
<%@ include file="/inc/top.jsp"%>

<form action="mess?path=talkOk2" method=post name=messager>
  <table cellpadding=0 cellspacing=0 border=0  bgcolor="" align=center>
  <input type="hidden" name="sender" value="${sender}">
    <tr> 
      <td> 
        <table width=112% height="271" border=0 cellpadding=3 cellspacing=1>
          <tr> 
            <td colspan=2 align=center> 
              <font color="#000000"><b>发送短消息</b>--请完整输入下列信息</font></td>
          </tr>
          <tr> 
            <td width="17%"> <b>收件人：</b></td> 
            <td width="83%"  valign=middle>
              <input type=text name="incept"  size=30 value="${incept }">
            </td>
          </tr>
          <tr> 
            <td  valign=top><b>标题：</b></td>
            <td  valign=middle>
              <input type=text name="title" size=30 maxlength=80>
&nbsp;请限定50字内 </td>
          </tr>
          <tr> 
            <td  valign=top><b>内容：</b><br></td>
            <td  valign=middle>
              <textarea cols=40 rows=8 name="content"></textarea>
            </td>
          </tr>
          <tr> 
            <td valign=middle colspan=2  align="right"> 
              <input type=Submit value="发送" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="清除">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<%@ include file="/inc/foot.jsp"%>

</body>
</html>
