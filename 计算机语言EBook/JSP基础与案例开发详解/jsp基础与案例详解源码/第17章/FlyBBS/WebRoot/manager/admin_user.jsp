<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<title>admin--管理页面</title>
	<link rel="stylesheet" type="text/css" href="css/forum.css">

<BODY bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333" topmargin="20">

<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=#777777 align=center>
  <tr>
    <td>
      <table cellpadding=3 cellspacing=1 border=0 width=100%>
        <tr bgcolor='#99ccff'>
        <td align=center colspan="2">欢迎<b>${admin_name }</b>进入管理页面
        </td>
        </tr>
            <tr bgcolor='#f2f8ff'>
              <td width="20%" valign=top>
<%@include file="admin_left.jsp"%>
	      </td>
              <td width="80%" valign=top>

<div align="center">

<form name="searchuser" method="POST" action="user?path=sechByName">
<font color=red>点击用户名进行相应操作</font>，  查找用户:  <input type="text" name="txtitle" size="13"><input type="submit" value="查询" name="title">
</form>

    <div align="center">



      <div align="center"><center>
      <form method=Post action="user?path=dele">
<table border="0" cellspacing="0" width="100%"  cellpadding="0">
        <tr>
          <td width="200" align="center" bgcolor="#99ccff" height="20"><strong>ID号</strong></td>
          <td width="200" align="center" bgcolor="#99ccff"><strong>登录帐号</strong></td>
          <td width="200" align="center" bgcolor="#99ccff"><strong>昵称</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>密码</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>邮箱</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>注册时间</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>最后登陆时间</strong></td>
          <td width="200" align="center" bgcolor="#99ccff"><input type='submit'  value='删除'></td>
        </tr>
 <c:forEach var="userinfo" items="${finduser}">
        <tr>
          <td height="20" align="center" height="20">${userinfo.userID}</td>
          <td width="70"><a href="javascript:" onClick="window.open('user?path=seluser&username=${userinfo.userName}',350,300)">${userinfo.userName}</a></td>
          <td width="70"><a href="javascript:" onClick="window.open('user?path=seluser&username=${userinfo.userName}',350,300)">${userinfo.nickName}</a></td>
		  <td width="46">${userinfo.userPassword}</td>
		  <td width="46">${userinfo.userEmail}</td>
		  <td width="250">${userinfo.addDate}</td>
		  <td width="250">${userinfo.lastlogin}</td>
          <td width="50"><input type='checkbox' name='userID' value='${userinfo.userID}'></td>
        </tr>
 </c:forEach>
      </table>
      	  </form>
      </center></div>
	      </td>
            </tr>
      </table>

    </tr>
</table>
	
