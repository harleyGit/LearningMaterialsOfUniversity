<%@page contentType="text/html; charset=GBK"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>My JSP 'isinsert.jsp' starting page</title>
</head>
<%
  request.setCharacterEncoding("GBK");
  String name = request.getParameter("username");
  String classes = request.getParameter("classes");
  String score = request.getParameter("score");
%>
<body bgcolor="#ffffff">
<jsp:useBean id="manage" scope="session" class="org.xmh.Manage.Manage"></jsp:useBean>
<%
  boolean isinsert = manage.insert(name, classes, score);
  pageContext.setAttribute("isinsert", new Boolean(isinsert));
%>
<c:choose>
  <c:when test="${isinsert}">�����Ϣ�ɹ���</c:when>
  <c:otherwise>�����Ϣʧ�ܣ�</c:otherwise>
</c:choose>
<a href="select.jsp">�鿴��Ϣ</a>
</body>
</html>
