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
        <h3 align="center">������ϸ��Ϣ����</h3>
      </td>
    </tr>
    <tr>
      <td>������</td>
      <td>
        <input name="username" type="text" value="<c:out value='${user.name}'/>">
      </td>
    </tr>
    <tr>
      <td>�༶��</td>
      <td>
        <input name="userclasses" type="text" value="<c:out value='${user.classes}'/>">
      </td>
    </tr>
    <tr>
      <td>�ɼ���</td>
      <td>
        <input name="userscore" type="text" value="<c:out value='${user.score}'/>">
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>
        <input type="submit" name="Submit" value="ȷ��"/>
        <input type="submit" name="Submit2" value="����"/>
      </td>
    </tr>
  </c:forEach>
</table>
</form>
</body>
</html>
