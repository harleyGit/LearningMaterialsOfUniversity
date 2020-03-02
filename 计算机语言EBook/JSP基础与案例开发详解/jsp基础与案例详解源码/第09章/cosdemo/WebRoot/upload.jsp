<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page contentType="text/html; charset=gb2312"%>
<%
	//文件上传后，保存在c:\\upload
String saveDirectory = "c:\\upload";
	//每个文件最大5m,最多3个文件,所以...
	int maxPostSize = 3 * 500 * 1024 * 1024;
	//response的编码为"gb2312",同时采用缺省的文件名冲突解决策略,实现上传
	MultipartRequest multi = new MultipartRequest(request,
			saveDirectory, maxPostSize, "gb2312");
	//输出反馈信息
	Enumeration files = multi.getFileNames();
	while (files.hasMoreElements()) {
		System.err.println("ccc");
		String name = (String) files.nextElement();
		File f = multi.getFile(name);
		if (f != null) {
			String fileName = multi.getFilesystemName(name);
			String lastFileName = saveDirectory + "\\" + fileName;
			out.println("上传的文件:" + lastFileName);
			out.println("<hr>");
		}
	}
%>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
