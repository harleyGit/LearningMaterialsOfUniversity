<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page contentType="text/html; charset=gb2312"%>
<%
	//�ļ��ϴ��󣬱�����c:\\upload
String saveDirectory = "c:\\upload";
	//ÿ���ļ����5m,���3���ļ�,����...
	int maxPostSize = 3 * 500 * 1024 * 1024;
	//response�ı���Ϊ"gb2312",ͬʱ����ȱʡ���ļ�����ͻ�������,ʵ���ϴ�
	MultipartRequest multi = new MultipartRequest(request,
			saveDirectory, maxPostSize, "gb2312");
	//���������Ϣ
	Enumeration files = multi.getFileNames();
	while (files.hasMoreElements()) {
		System.err.println("ccc");
		String name = (String) files.nextElement();
		File f = multi.getFile(name);
		if (f != null) {
			String fileName = multi.getFilesystemName(name);
			String lastFileName = saveDirectory + "\\" + fileName;
			out.println("�ϴ����ļ�:" + lastFileName);
			out.println("<hr>");
		}
	}
%>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
