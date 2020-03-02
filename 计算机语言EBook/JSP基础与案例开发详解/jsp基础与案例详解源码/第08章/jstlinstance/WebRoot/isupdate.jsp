<%@page contentType="text/html; charset=GBK"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>My JSP 'isupdate.jsp' starting page</title>
</head>
<%
  request.setCharacterEncoding("GBK");
  String id = request.getParameter("id");
  String name = request.getParameter("username");
  String classes = request.getParameter("userclasses");
  String score = request.getParameter("userscore");
%>
<body bgcolor="#ffffff">
<jsp:useBean id="manage" scope="session" class="org.xmh.Manage.Manage"></jsp:useBean>
<%
  boolean isupdate = manage.update(name, classes, score, id);
  pageContext.setAttribute("isupdate", new Boolean(isupdate));
%>
<c:choose>
  <c:when test="${isupdate}">修改信息成功！</c:when>
  <c:otherwise>修改信息失败！</c:otherwise>
</c:choose>
<a href="select.jsp">查看信息</a>
</body>
</html>
