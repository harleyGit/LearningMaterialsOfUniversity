<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ELDemo_param</title>
<style type="text/css">
<!--
.STYLE3 {font-size: 12}
-->
</style>
</head>

<body>
<form action="elParameterResult.jsp" method="post">
<table width="435" height="170" border="1" align="center" 
cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2"><div align="center">param、paramValues练习</div></td>
  </tr>
  <tr>
    <td width="101"><div align="center"><span class="STYLE3">用户名：</span></div></td>
<td width="328">
<input name="username" type="text" id="username" /></td>
  </tr>
  <tr>
<td><div align="center"><span class="STYLE3">爱好：
</span></div></td>
    <td><span class="STYLE3">
      <input name="likes" type="checkbox" id="likes" value="游泳" />
    游泳
      <input name="likes" type="checkbox" id="likes" value="看书" />
      看书
      <input name="likes" type="checkbox" id="likes" value="玩游戏" />
    玩游戏</span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><span class="STYLE3">
      <input type="submit" name="Submit" value="提交" />
      <input name="Reset" type="reset" id="Reset" value="重置" />
    </span></td>
  </tr>
</table>
</form>
</body>
</html>
