<html>
<head>
<%@ page contentType="text/html;charset=GB2312" language="java"
	import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%
	String name = request.getParameter("name");
	System.out.println("------" + name);
	SmartUpload mySmartUpload = new SmartUpload();
	long file_size_max = 4000000;
	String fileName2 = "", ext = "", testvar = "";
	String url = "uploadfile/images/"; //应保证在根目录中有此目录的存在
	//初始化
	mySmartUpload.initialize(pageContext);
	//只允许上载此类文件
	try {
		mySmartUpload.setAllowedFilesList("jpg,gif");
		//上载文件 
		mySmartUpload.upload();
	} catch (Exception e) {
%>
<SCRIPT language=javascript>
  alert("只允许上传.jpg和.gif类型图片文件");
  window.location="upload.htm";
  </script>
<%
	}
	try {
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles()
				.getFile(0);
		if (myFile.isMissing()) {
%>
<SCRIPT language=javascript>
   alert("请先选择要上传的文件");
   window.location="upload.htm";
   </script>
<%
	} else {
			//String myFileName=myFile.getFileName(); //取得上载的文件的文件名
			ext = myFile.getFileExt(); //取得后缀名
			int file_size = myFile.getSize(); //取得文件的大小  
			String saveurl = "";
			if (file_size < file_size_max) {
				//更改文件名，取得当前上传时间的毫秒数值
				Calendar calendar = Calendar.getInstance();
				String filename = name;
				saveurl = request.getRealPath("/") + url;
				saveurl += filename + "." + ext; //保存路径
				myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
			} else {
				out.print("<SCRIPT language=''javascript''>");
				out.print("alert(''上传文件大小不能超过" + (file_size_max / 1000)
						+ "K'');");
				out.print("window.location=''upfile.jsp;''");
				out.print("</SCRIPT>");
			}
		}
	} catch (Exception e) {

		e.toString();
	}
	out.print("上传成功");
%>
<body>
</body>
</html>