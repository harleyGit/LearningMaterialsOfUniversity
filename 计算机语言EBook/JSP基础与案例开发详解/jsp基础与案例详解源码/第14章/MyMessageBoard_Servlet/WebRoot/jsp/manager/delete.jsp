<%@ page language="java" import="java.util.*,org.ly.dao.*,org.ly.dao.impl.*" pageEncoding="utf-8"%>
<%
 	LoginDAO impl = new LoginDAOImpl();		
	int id = Integer.parseInt(request.getParameter("id"));		
	if (impl.deleteMessage(id)) {				
		response.sendRedirect("../../index.html");
	} else {
		session.setAttribute("message", "删除留言失败！");
		response.sendRedirect("../../errors.jsp");
	}
	
%>