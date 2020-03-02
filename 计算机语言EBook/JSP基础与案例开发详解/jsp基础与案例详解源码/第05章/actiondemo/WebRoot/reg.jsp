<%@ page contentType="text/html; charset=GB2312"%>
<%
	request.setCharacterEncoding("GB2312");
%>
<jsp:useBean id="user" scope="session"
	class="com.tjitcast.action.Person">
	<jsp:setProperty name="user" property="*" />
	<jsp:setProperty name="user" property="email" param="mail" />
</jsp:useBean>
<%
	request.getRequestDispatcher("userinfo.jsp").forward(request,
			response);
%>
