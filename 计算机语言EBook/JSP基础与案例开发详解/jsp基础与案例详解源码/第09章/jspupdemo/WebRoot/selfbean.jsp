<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="TheBean" scope="page"
	class="org.tjitcast.demo.FileUploadBean" />
<%
	TheBean.doUpload(request);
	out.println("Filename:" + TheBean.getFilename());
	out.println("<BR>��������:" + TheBean.getContentType());
	out.println("<BR>����:" + TheBean.getFieldValue("author"));
	out.println("<BR>��˾:" + TheBean.getFieldValue("company"));
	out.println("<BR>˵��:" + TheBean.getFieldValue("comment"));
%>
