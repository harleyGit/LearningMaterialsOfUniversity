<%@page contentType="text/html; charset=GBK"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>My JSP 'delete.jsp' starting page</title>
<%String id = request.getParameter("id");%>
</head>
<body bgcolor="#ffffff">
<jsp:useBean id="manage" scope="session" class="org.xmh.Manage.Manage"></jsp:useBean>
<%
  boolean delete = manage.delete(id);
  pageContext.setAttribute("delete", new Boolean(delete));
%>
<c:choose>
  <c:when test="${delete}">ɾ����Ϣ�ɹ���</c:when>
  <c:otherwise>ɾ����Ϣʧ��</c:otherwise>
</c:choose>
<a href="select.jsp">�鿴��Ϣ</a>
</body>
</html>
