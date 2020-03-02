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
      <strong>姓名</strong>
    </td>
    <td>
      <strong>班级</strong>
    </td>
    <td>
      <strong>成绩</strong>
    </td>
    <td>
      <strong>修改</strong>
    </td>
    <td>
      <strong>删除</strong>
    </td>
    <td>
      <strong>添加学员</strong>
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
        <a href="preupdate.jsp?id=${user.id}">编辑信息</a>
      </td>
      <td>
        <a href="delete.jsp?id=${user.id}">删除信息</a>
      </td>
      <td>
        <a href="insert.jsp">添加信息</a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
