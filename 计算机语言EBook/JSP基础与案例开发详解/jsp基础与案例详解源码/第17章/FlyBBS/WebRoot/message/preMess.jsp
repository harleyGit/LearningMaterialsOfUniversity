<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>д����Ϣ</title>
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
              <font color="#000000"><b>���Ͷ���Ϣ</b>--����������������Ϣ</font></td>
          </tr>
          <tr> 
            <td width="17%"> <b>�ռ��ˣ�</b></td> 
            <td width="83%"  valign=middle>
              <input type=text name="incept"  size=30 value="${incept }">
            </td>
          </tr>
          <tr> 
            <td  valign=top><b>���⣺</b></td>
            <td  valign=middle>
              <input type=text name="title" size=30 maxlength=80>
&nbsp;���޶�50���� </td>
          </tr>
          <tr> 
            <td  valign=top><b>���ݣ�</b><br></td>
            <td  valign=middle>
              <textarea cols=40 rows=8 name="content"></textarea>
            </td>
          </tr>
          <tr> 
            <td valign=middle colspan=2  align="right"> 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="���">
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
