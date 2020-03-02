<%@page contentType="text/html;charset=GB2312"%>
<%@page
	import="java.util.*,java.text.*,java.io.*,org.tjitcast.utils.DealString"%>
<%
	DealString ds = new DealString();

	String title = "";
	String strtype1 = ds.toString((String) request.getParameter("id"));
	String strclose = ds.toString((String) request
			.getParameter("close"));
	title = "图片上传";
	String name = ds.getDateTime();
	name = name.replaceAll("-", "");
	name = name.replaceAll(" ", "");
	name = name.replaceAll(":", "");
	if (strclose.equals("1")) {
%>
<script>
window.opener.document.all.img.value='<%=ds.toGBK((String) request.getParameter("filename"))%>';
window.close();
</script>
<%
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title><%=title%></title>
	</head>
	<BODY bgColor=menu topmargin=15 leftmargin=15 style="font: 9pt">


		<CENTER>
			<FIELDSET align=left>
				<LEGEND align=left><%=title%></LEGEND>
				<span style="font: 9pt">文件不要超过1024K</span>
				<form name="form" method="post"
					action="/jspupdemo/uploadimage.jsp?name=<%=name%>"
					enctype="multipart/form-data">
					文件：
					<input type="file" name="file11" size=20>
					<input type="hidden" name="txt_file11" size=20>
					<input type="hidden" name="txt_name11">
					<input type="hidden" name="txt_type1" value=<%=strtype1%>>
					<input type="submit" onclick="return submit111();" value="上传">
				</form>
			</fieldset>
	</body>
	<script>
function submit111()
{		
	document.all.txt_file11.value = document.all.file11.value;
	if(document.all.file11.value=="")
		return false;
	var name1 = document.all.txt_file11.value;
	var i = name1.lastIndexOf(".");
	name1 = name1.substring(i);
	var name = <%=name%>;
	document.all.txt_name11.value = name+name1;
	var name2=document.all.file11.value;
	var j=name2.lastIndexOf("\\");
	name2=name2.substring(j+1);
	if(document.all.txt_type1.value=="1")
	{
		if(window.opener.document.all.ORGID.value=="")
		{
			window.opener.document.all.ORGID.value=
document.all.txt_name11.value;
			window.opener.document.all.OLDORGID.value=name2;
		}
		else
			window.opener.document.all.ORGID.value=window.opener.document.all.ORGID.value+","+
document.all.txt_name11.value;
			window.opener.document.all.OLDORGID.value=window.opener.document.all.OLDORGID.value+","+name2;
	}
	if(document.all.txt_type1.value=="2")
	{
		if(name1!=".gif"&&name1!=".jpg"&&name1!=".png"&&name1!=".bmp"&&name1!=".jpeg"&&
name1!=".GIF"&&name1!=".JPG"&&name1!=".PNG"&&name1!=".BMP"&&name1!=".JPEG")
		{
			alert("图片格式不正确！");
			document.all.txt_file11.value="";
			document.all.txt_name11.value="";
			name = "";
			return false;
		}
		window.opener.document.all.picpath.value=document.all.txt_name11.value;
		
	}
	//window.close();
	//return true;
}

</script>
	
</html>
