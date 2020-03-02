<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<title>admin--管理版主页面</title>
	<link rel="stylesheet" type="text/css" href="css/forum.css">
<script language="javascript">
  function setUserID(uID){
    document.moderform.userID.value=uID;
  }
</script>
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

<form name="searchuser" method="POST" action="user?path=sechByName&type=1">
<font color=red>点击用户名进行相应操作</font>，  查找用户:  <input type="text" name="txtitle" size="13"><input type="submit" value="查询" name="title">
</form></div>
      <div align="center"><center>
      <form method=Post name="moderform" action="user?path=edit_moder">
<table border="0" cellspacing="0" width="100%"  cellpadding="0">
<input type="hidden" name="boardid" value="${boardid }"/>
<input type="hidden" name="userID" />
        <tr>
          <td width="200" align="center" bgcolor="#99ccff" height="20"><strong>ID号</strong></td>
          <td width="200" align="center" bgcolor="#99ccff"><strong>用户名</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>邮箱</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>注册时间</strong></td>
		  <td width="200" align="center" bgcolor="#99ccff"><strong>最后登录时间</strong></td>
          <td width="200" align="center" bgcolor="#99ccff"><input type='submit'  value='设为版主'></td>
        </tr>
 <c:forEach var="userinfo" items="${finduser}">
 
        <tr>
          <td height="20" align="center" height="20">${userinfo.userID}</td>
          <td width="70"><a href="javascript:" onClick="window.open('user?path=seluser&username=${userinfo.userName}',350,300)">${userinfo.userName}</a></td>
		  <td width="46">${userinfo.userEmail}</td>
		  <td width="250">${userinfo.addDate}</td>
		  <td width="250">${userinfo.lastlogin}</td>
          <td width="50"><input type='radio' name='userName' value='${userinfo.userName}' onClick="setUserID(${userinfo.userID});"></td>
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
</body>
