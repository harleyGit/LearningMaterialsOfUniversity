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
  <c:when test="${isupdate}">�޸���Ϣ�ɹ���</c:when>
  <c:otherwise>�޸���Ϣʧ�ܣ�</c:otherwise>
</c:choose>
<a href="select.jsp">�鿴��Ϣ</a>
</body>
</html>
