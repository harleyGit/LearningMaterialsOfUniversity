<%@page contentType="text/html; charset=GBK"%>
<html>
<head>
<title>insert</title>
<style>
  .xmh{
  font-size:12px}
</style>
</head>
<body>
<form action="isinsert.jsp" method="post">
<table width="402" border="1" cellpadding="1" cellspacing="0" style=" border-style:inherit" bordercolordark="#FFFFFF" class="xmh">
  <tr>
    <td width="115">姓名：</td>
    <td width="280">
      <label>
        <input type="text" name="username"/>
      </label>
    </td>
  </tr>
  <tr>
    <td>班级：</td>
    <td>
      <label>
        <input type="text" name="classes"/>
      </label>
    </td>
  </tr>
  <tr>
    <td>成绩：</td>
    <td>
      <label>
        <input type="text" name="score"/>
      </label>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="Submit" value="提交"/>
      <input type="submit" name="Submit2" value="重置"/>
      <a href="select.jsp">查看信息</a>
    </td>
  </tr>
</table>
</form>
</body></html>
