<%@page contentType="text/html; charset=GBK" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>select</title>
<style>
.xmh{

font-size:12px}
</style>
</head>
<jsp:useBean id="manage" scope="session" class="org.xmh.Manage.Manage"></jsp:useBean>
<c:set var="list" value="<%=manage.select()%>"></c:set>
<body bgcolor="#ffffff">
<table width="442" border="1"  cellpadding="1" cellspacing="0" style=" border-style:inherit" bordercolordark="#FFFFFF" class="xmh">
  <tr>
    <td>
      <strong>����</strong>
    </td>
    <td>
      <strong>�༶</strong>
    </td>
    <td>
      <strong>�ɼ�</strong>
    </td>
    <td>
      <strong>�޸�</strong>
    </td>
    <td>
      <strong>ɾ��</strong>
    </td>
    <td>
      <strong>���ѧԱ</strong>
    </td>
  </tr>
  <c:forEach items="${list}" var="user">
    <tr>
      <td>
        <c:out value="${user.name}"></c:out>
      </td>
      <td>
        <c:out value="${user.classes}"></c:out>
      </td>
      <td>
        <c:out value="${user.score}"></c:out>
      </td>
      <td>
        <a href="preupdate.jsp?id=${user.id}">�༭��Ϣ</a>
      </td>
      <td>
        <a href="delete.jsp?id=${user.id}">ɾ����Ϣ</a>
      </td>
      <td>
        <a href="insert.jsp">�����Ϣ</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
