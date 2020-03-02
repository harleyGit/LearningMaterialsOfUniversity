<%@page contentType="text/html; charset=GBK"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>preupdate.jsp</title>
<style>
.xmh{

font-size:12px}
</style>
</head>
<%String id = request.getParameter("id");%>
<jsp:useBean id="manage" scope="session" class="org.xmh.Manage.Manage"></jsp:useBean>
<c:set var="list" value="<%=manage.up_select(id)%>"></c:set>
<body>
<form action="isupdate.jsp?id=<%=id%>" method="post">
<table width="328" border="1" cellpadding="1" cellspacing="0" style=" border-style:inherit" bordercolordark="#FFFFFF" class="xmh">
  <c:forEach items="${list}" var="user">
    <tr>
      <td colspan="2">
        <h3 align="center">您的详细信息如下</h3>
      </td>
    </tr>
    <tr>
      <td>姓名：</td>
      <td>
        <input name="username" type="text" value="<c:out value='${user.name}'/>">
      </td>
    </tr>
    <tr>
      <td>班级：</td>
      <td>
        <input name="userclasses" type="text" value="<c:out value='${user.classes}'/>">
      </td>
    </tr>
    <tr>
      <td>成绩：</td>
      <td>
        <input name="userscore" type="text" value="<c:out value='${user.score}'/>">
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
        <input type="submit" name="Submit" value="确定"/>
        <input type="submit" name="Submit2" value="重置"/>
      </td>
    </tr>
  </c:forEach>
</table>
</form>
</body>
</html>
