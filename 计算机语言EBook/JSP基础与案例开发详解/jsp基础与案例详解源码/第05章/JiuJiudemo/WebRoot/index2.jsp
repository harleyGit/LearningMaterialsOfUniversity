<%@ page language="java"  pageEncoding="GB2312"%>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆页</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="result2.jsp">
  <p align="center">请输入两个自然数给你打印乘法表</p>
  <table width="304" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#aaccdd" bordercolor="#cccccc">
    <tr>
      <td width="101">stratNumber</td>
      <td width="113"><label>
        <input name="d" type="text" id="textfield" size="15" maxlength="8"  height="20"/>
      </label></td>
      <td width="68">&nbsp;eg: 3<br></td>
    </tr>
    <tr>
      <td>endNumber</td>
      <td><label>
        <input name="c" type="text" id="textfield2" size="15" maxlength="8"  height="20"/>
      </label></td>
      <td>&nbsp;eg: 9</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="submit" name="button" id="button" value="提交" />
        <input name="button2" type="reset" id="button2" value="重置" />
      </label></td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
