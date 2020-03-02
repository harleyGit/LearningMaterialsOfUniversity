<%@ page contentType="text/html; charset=utf-8"%>
<link href="../css/message.css" rel="stylesheet" type="text/css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>上传广告图片</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

	</head>
	<body>
		<form action="uppicture.jsp?falg=1" method="post"
			enctype="multipart/form-data" name="form1">
			<div align="center" id="php1ath" method="post"
				enctype="multipart/form-data">
				<p>&nbsp;
					
				</p>
				<p>
					请选择要上传的图片
					<br />
					<input type="file" name="file">
					<input type="submit" name="Submit2" value="上 传" onClick="doup();">
					<br />
				</p>	
				<c:if test="${ad!=null}">
				out.print("<script language:javascript>window.opener.document.getElementById('banner').value='${ad }'</script>");
				out.print("<script language:javascript>javascript:window.opener=null;window.close();</script>");
				<%session.removeAttribute("ad"); %>
				</c:if>			
			</div>
		</form>
	</body>
</html>
