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
    <td width="115">������</td>
    <td width="280">
      <label>
        <input type="text" name="username"/>
      </label>
    </td>
  </tr>
  <tr>
    <td>�༶��</td>
    <td>
      <label>
        <input type="text" name="classes"/>
      </label>
    </td>
  </tr>
  <tr>
    <td>�ɼ���</td>
    <td>
      <label>
        <input type="text" name="score"/>
      </label>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>
      <input type="submit" name="Submit" value="�ύ"/>
      <input type="submit" name="Submit2" value="����"/>
      <a href="select.jsp">�鿴��Ϣ</a>
    </td>
  </tr>
</table>
</form>
</body></html>
