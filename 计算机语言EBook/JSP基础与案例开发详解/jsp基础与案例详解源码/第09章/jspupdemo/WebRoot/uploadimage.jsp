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
	String url = "uploadfile/images/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ���
	//��ʼ��
	mySmartUpload.initialize(pageContext);
	//ֻ�������ش����ļ�
	try {
		mySmartUpload.setAllowedFilesList("jpg,gif");
		//�����ļ� 
		mySmartUpload.upload();
	} catch (Exception e) {
%>
<SCRIPT language=javascript>
  alert("ֻ�����ϴ�.jpg��.gif����ͼƬ�ļ�");
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
   alert("����ѡ��Ҫ�ϴ����ļ�");
   window.location="upload.htm";
   </script>
<%
	} else {
			//String myFileName=myFile.getFileName(); //ȡ�����ص��ļ����ļ���
			ext = myFile.getFileExt(); //ȡ�ú�׺��
			int file_size = myFile.getSize(); //ȡ���ļ��Ĵ�С  
			String saveurl = "";
			if (file_size < file_size_max) {
				//�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ
				Calendar calendar = Calendar.getInstance();
				String filename = name;
				saveurl = request.getRealPath("/") + url;
				saveurl += filename + "." + ext; //����·��
				myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
			} else {
				out.print("<SCRIPT language=''javascript''>");
				out.print("alert(''�ϴ��ļ���С���ܳ���" + (file_size_max / 1000)
						+ "K'');");
				out.print("window.location=''upfile.jsp;''");
				out.print("</SCRIPT>");
			}
		}
	} catch (Exception e) {

		e.toString();
	}
	out.print("�ϴ��ɹ�");
%>
<body>
</body>
</html>