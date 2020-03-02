<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<title>forumName--管理页面</title>
	<link rel="stylesheet" type="text/css" href="css/forum.css">

<BODY bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333" topmargin="20">

<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=#0099cc align=center>
  <tr>
    <td>
      <table cellpadding=3 cellspacing=1 border=0 width=100%>
        <tr bgcolor='#0099cc'>
        <td colspan="2" align=center bgcolor="#99ccff">欢迎<b>${admin_name }</b>进入管理页面        </td>
        </tr>
            <tr bgcolor=#0099cc>
              <td width="20%" valign=top bgcolor="#e8f4ff">
<%@include file="admin_left.jsp"%>
	      </td>
              <td width="80%" valign=top bgcolor="#e8f4ff">
	     




<form method="POST" action="config?path=updateShezhi">
 <c:forEach var="info" items="${listallup}">
<table width="95%" border="0" cellspacing="1" cellpadding="3"  align=center bgcolor="#e8f4ff">
<tr bgcolor=#0099cc> 
<td height="23" colspan="2" bgcolor="#e8f4ff" ><font color=#000000><b>论坛变量设置</b></font></td>
</tr>
<tr> 
<td width="41%">论坛名称</td>
<td width="59%"> 
<input type="text" name="forumName" size="35" value="${info.forumName}"></td>
</tr>
<tr> 
<td width="41%">论坛的url</td>
<td width="59%"> 
<input type="text" name="forumURL" size="35" value="${info.forumURL}"></td>
</tr>
<tr> 
<td width="41%">主页名称</td>
<td width="59%"> 
<input type="text" name="companyName" size="35" value="${info.companyName}"></td>
</tr>
<tr> 
<td width="41%">主页URL</td>
<td width="59%"> 
<input type="text" name="hostURL" size="35" value="${info.hostUrl}"></td>
</tr>
<tr> 
<td width="41%">论坛管理员Email</td>
<td width="59%"> 
<input type="text" name="systemEmail" size="35" value="${info.systemEmail}"></td>
</tr>
<tr> 
<td width="41%">论坛forumLogo地址</td>
<td width="59%"> 
<input type="text" name="forumLogo" size="35" value="${info.logo}"></td>
</tr>
<tr> 
<td width="41%">用户IP</td>
<td width="59%"> 
<select name="ipFlag">
<option value="0" <c:if test="${info.ipFlag == 0}">selected</c:if>>保密 
<option value="1" <c:if test="${info.ipFlag == 1}">selected</c:if>>公开 
</select></td>
</tr>
<tr> 
<td width="41%">头像上传</td>
<td width="59%">
<select name="uploadFlag">
<option value="0" <c:if test="${info.uploadFlag == 0}">selected</c:if>>否 
<option value="1" <c:if test="${info.uploadFlag == 1}">selected</c:if>>是 
</select></td>
</tr>
<tr> 
<td width="41%">用户头衔</td>
<td width="59%"> 
<select name="titleFlag">
<option value="0" <c:if test="${info.titleFlag == 0}">selected</c:if>>隐藏 
<option value="1" <c:if test="${info.titleFlag == 1}">selected</c:if>>显示 
</select></td>
</tr>
<tr> 
<td width="41%">在线名单显示客人在线</td>
<td width="59%"> 
<select name="guestUser">
<option value="0" <c:if test="${info.guestuser == 0}">selected</c:if>>否 
<option value="1"  <c:if test="${info.guestuser == 1}">selected</c:if>>是 
</select></td>
</tr>

<tr bgcolor=#e8f4ff> 
<td height="23" colspan="2" bgcolor="#e8f4ff" ><font color=#000000><b>版权广告信息</b></font></td>
</tr>
<tr> 
<td width="41%">论坛页首广告代码</td>
<td width="59%"> 
<input type="text" name="ads1" size="35" value="${info.ads1}"></td>
</tr>
<tr> 
<td width="41%">论坛页尾广告代码</td>
<td width="59%"> 
<input type="text" name="ads2" size="35" value="${info.ads2}"></td>
</tr>
<tr> 
<td width="41%">版权信息</td>
<td width="59%"> 
<input type="text" name="copyRight" size="35" value="${info.copyright}"></td>
</tr>
<tr> 
<td width="41%">版本信息</td>
<td width="59%"> 
<input type="text" name="version" size="35" value="${info.version}"></td>
</tr>
<tr bgcolor=#000000> 
<td colspan="2" bgcolor="#99ccff"> 
  <div align="center"> 
    <input type="submit" name="Submit" value="提 交">
  </div></td>
</tr>
</table>
 </c:forEach>
</form>
 </td>
            </tr>
        </table>
        </td>
    </tr>
</table>
