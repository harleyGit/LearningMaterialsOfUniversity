<%@ page contentType="text/html;charset=gbk" language="java"
	import="com.jspsmart.upload.*,java.util.*,com.sun.image.codec.jpeg.JPEGCodec"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.sun.image.codec.jpeg.JPEGImageEncoder"%>
<%@page import="java.awt.Image"%>
<script language=javascript>
<!--
function minipic(smileface)
{
	window.opener.document.getElementById

('littlepic').value=smileface;
}
function autopic(smileface)
{
	window.opener.document.getElementById

('phpath').value=smileface;
}
//-->
</script>
<%
	String img = null;
	SmartUpload mySmartUpload = new SmartUpload();
	long file_size_max = 4000000;
	String fileName2 = "", ext = "", testvar = "";
	String url = "uppic/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ���
	//��ʼ��
	mySmartUpload.initialize(pageContext);
	//ֻ�������ش����ļ�
	try {
		mySmartUpload.setAllowedFilesList("jpg,gif,JPG,GIF");
		//�����ļ� 
		mySmartUpload.upload();
	} catch (Exception e) {
		e.printStackTrace();
%>
<SCRIPT language=javascript>
  alert("ֻ�����ϴ�.jpg��.gif����ͼƬ�ļ�");
  window.location='up.jsp';
  </script>
<%
	}
	try {
		File myFile = mySmartUpload.getFiles().getFile(0);
		if (myFile.isMissing()) {
%>
<SCRIPT language=javascript>
   alert("����ѡ��Ҫ�ϴ����ļ�");
   window.location='upAD.jsp';
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
				String filename = String.valueOf(calendar
						.getTimeInMillis());
				saveurl = request.getRealPath("/") + url;
				saveurl += filename + "." + ext; //����·��
				myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
				//-----------------------�ϴ���ɣ���ʼ��������ͼ-------------------------    
				java.io.File file = new java.io.File(saveurl); //����ղ��ϴ����ļ�
				String newurl = request.getRealPath("/") + url
						+ filename + "_min." + ext; //�µ�����ͼ�����ַ
				Image src = javax.imageio.ImageIO.read(file); //����Image����
				int old_w = src.getWidth(null); //�õ�Դͼ��
				int old_h = src.getHeight(null);
				BufferedImage tag_o = new BufferedImage(old_w, old_h,
						BufferedImage.TYPE_INT_RGB);
				tag_o.getGraphics().drawImage(src, 0, 0, old_w, old_h,
						null); //������С���ͼ
				FileOutputStream newimage_o = new FileOutputStream(
						saveurl); //������ļ���
				JPEGImageEncoder encoder_o = JPEGCodec
						.createJPEGEncoder(newimage_o);
				encoder_o.encode(tag_o); //��JPEG����		
				newimage_o.close();
				img = saveurl.substring(saveurl.indexOf("/") + 1);
				String type = request.getParameter("falg");
				out.print("<SCRIPT language=''javascript''>");
				out.print("alert('��Ƭ " + img + " �ϴ��ɹ�');");
				out.print("</SCRIPT>");
				if ("1".equals(type)) {
					out.print("<SCRIPT language=''javascript''>");
					out.print("window.location='upAD.jsp';");
					out.print("</SCRIPT>");
					session.setAttribute("ad", img);
				} else {
					out.print("<SCRIPT language=''javascript''>");
					out.print("window.location='upLogo.jsp';");
					out.print("</SCRIPT>");
					session.setAttribute("logo", img);
				}

			} else {
				out.print("<SCRIPT language=''javascript''>");
				out.print("alert(''�ϴ��ļ���С���ܳ���" + (file_size_max / 1000)
						+ "K'');");
				out.print("</SCRIPT>");
			}
		}
	} catch (Exception e) {
		e.toString();
	} finally {
		//out.print("<script language:javascript>javascript:window.opener=null;window.close();</script>");
	}
%>
