<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/logincss.css" rel="stylesheet" type="text/css">
<script language=javascript>
<!--
 function loadimage(){ 
    document.getElementById("randImage").src = "enimg.jsp?"+Math.random(); 
  } 
function SetFocus()
{
if (document.Login.admin_name.value=="")
	document.Login.admin_name.focus();
else
	document.Login.admin_name.select();
}
function CheckForm()
{
	if(document.Login.admin_name.value=="")
	{
		alert("请输入用户名！");
		document.Login.admin_name.focus();
		return false;
	}
	if(document.Login.admin_pass.value == "")
	{
		alert("请输入密码！");
		document.Login.admin_pass.focus();
		return false;
	}
	if(document.Login.validateCode.value == "")
	{
		alert("请输入验证码！");
		document.Login.verify.focus();
		return false;
	}
	return true;
}

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
    alert("友情提示：\n    你使用的是Netscape浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      alert("友情提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  }
}
//-->
</script>
<style type="text/css">
<!--
body {
	background-color: #f2f2f2;
}
.errorfont {font-size: 12px}
-->
</style></head>
<body class="bgcolor">
<p>&nbsp;</p><p>&nbsp;</p>
<form name="Login" action="user?path=loginInAdmin" method="post" target="_parent">
  <div align="center"> 
    <p>&nbsp;</p>
    <span class="errorfont"><font color="red"><strong>${error}</strong></font></span><br/>
  </div>
  <table width="320" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC">
    <tr valign="middle">
      <td colspan="2" bgcolor="#F2f2f2"><div align="center"> --- &nbsp;&nbsp;<strong>BBS &nbsp;后台登录</strong>&nbsp;&nbsp;---&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">首页</a></div></td>
    </tr>
    <tr valign="middle">
      <td height="35" colspan="2" bgcolor="#FFFFFF">&nbsp;屏幕分辨率为 <font color="#FF0000"><strong>1024*768</strong></font> 或以上达到最佳浏览效果！</td>
    </tr>
    <tr> 
      <td align="right" bgcolor="#FFFFFF" width="70">用户名：</td>
      <td bgcolor="#FFFFFF"><input name="admin_name"  type="text"  id="admin_name" size="20" style="width:160px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onFocus="this.select(); " onMouseOver="this.style.background='#f9f9f9';" onMouseOut="this.style.background='#FFFFFF'" maxlength="20"></td>
    </tr>
    <tr> 
      <td align="right" bgcolor="#FFFFFF">密&nbsp;&nbsp;&nbsp;码：</td>
      <td bgcolor="#FFFFFF"><input name="admin_pass"  type="password" id="admin_pass" size="20" style="width:160px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onFocus="this.select(); " onMouseOver="this.style.background='#f9f9f9';" onMouseOut="this.style.background='#FFFFFF'" maxlength="20"></td>
    </tr>
	<tr> 
      <td align="right" bgcolor="#FFFFFF">验证码：</td>
      <td bgcolor="#FFFFFF"><input name="validateCode"  type="text" id="validateCode"  size="4" style="width:60px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onFocus="this.select(); " onMouseOver="this.style.background='#f9f9f9';" onMouseOut="this.style.background='#FFFFFF'" size="8" maxlength="8">
      &nbsp;
						<img src="enimg.jsp" alt="code..." name="randImage" width="55"
							height="16" border="1" align="absmiddle" class="box"
							id="randImage" />
						&nbsp;
						<a href="javascript:loadimage();"><font color="#808080">看不清,换一张</font>
						</a>
      </td>
    </tr>
    <tr valign="middle"> 
      <td height="35" colspan="2" bgcolor="#FFFFFF"> 
        <div align="center"> 
          <input   type="submit" name="Submit" value=" 确&nbsp;认 " style="font-size: 9pt; height: 19; width: 60; color: #000000; background-color: #f9f9f9; border: 1 solid #e1e1e1" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#f9f9f9'">
          &nbsp;&nbsp;&nbsp; 
          <input name="reset" type="reset"  id="reset" value=" 清&nbsp;除 " style="font-size: 9pt; height: 19; width: 60; color: #000000; background-color: #f9f9f9; border: 1 solid #e1e1e1" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#f9f9f9'">
          <br>
      </div></td>
    </tr>
    
  </table>
</form>
<script language="JavaScript" type="text/JavaScript">
CheckBrowser();
SetFocus(); 
</script>
</body>
</html>

