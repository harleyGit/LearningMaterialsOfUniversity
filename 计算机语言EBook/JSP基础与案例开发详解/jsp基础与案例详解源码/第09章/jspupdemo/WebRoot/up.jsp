<%@ page contentType="text/html;charset=gb2312"%>
<html>
	<head>
	</head>
	<body>
		<jsp:useBean id="TheBean" scope="page"  class="org.tjitcast.demo.UploadBean" />
		<%
		    try{
			TheBean.doUpload(request);
			}catch(Exception e){
			out.print("sorry,�ϴ�ʧ��!!");
			}
			out.print("thanks,�ϴ��ɹ�!!");
		%>
	</body>
</html>
