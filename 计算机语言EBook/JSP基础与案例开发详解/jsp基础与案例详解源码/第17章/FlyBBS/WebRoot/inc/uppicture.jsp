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
	String url = "uppic/"; //应保证在根目录中有此目录的存在
	//初始化
	mySmartUpload.initialize(pageContext);
	//只允许上载此类文件
	try {
		mySmartUpload.setAllowedFilesList("jpg,gif,JPG,GIF");
		//上载文件 
		mySmartUpload.upload();
	} catch (Exception e) {
		e.printStackTrace();
%>
<SCRIPT language=javascript>
  alert("只允许上传.jpg和.gif类型图片文件");
  window.location='up.jsp';
  </script>
<%
	}
	try {
		File myFile = mySmartUpload.getFiles().getFile(0);
		if (myFile.isMissing()) {
%>
<SCRIPT language=javascript>
   alert("请先选择要上传的文件");
   window.location='upAD.jsp';
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
				String filename = String.valueOf(calendar
						.getTimeInMillis());
				saveurl = request.getRealPath("/") + url;
				saveurl += filename + "." + ext; //保存路径
				myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
				//-----------------------上传完成，开始生成缩略图-------------------------    
				java.io.File file = new java.io.File(saveurl); //读入刚才上传的文件
				String newurl = request.getRealPath("/") + url
						+ filename + "_min." + ext; //新的缩略图保存地址
				Image src = javax.imageio.ImageIO.read(file); //构造Image对象
				int old_w = src.getWidth(null); //得到源图宽
				int old_h = src.getHeight(null);
				BufferedImage tag_o = new BufferedImage(old_w, old_h,
						BufferedImage.TYPE_INT_RGB);
				tag_o.getGraphics().drawImage(src, 0, 0, old_w, old_h,
						null); //绘制缩小后的图
				FileOutputStream newimage_o = new FileOutputStream(
						saveurl); //输出到文件流
				JPEGImageEncoder encoder_o = JPEGCodec
						.createJPEGEncoder(newimage_o);
				encoder_o.encode(tag_o); //近JPEG编码		
				newimage_o.close();
				img = saveurl.substring(saveurl.indexOf("/") + 1);
				String type = request.getParameter("falg");
				out.print("<SCRIPT language=''javascript''>");
				out.print("alert('相片 " + img + " 上传成功');");
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
				out.print("alert(''上传文件大小不能超过" + (file_size_max / 1000)
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
