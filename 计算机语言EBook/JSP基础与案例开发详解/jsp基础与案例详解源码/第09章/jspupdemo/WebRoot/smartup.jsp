<%@ page import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>smartup's demo</title>
		<script>
function upload(id)
{	
	var go = "upload_pic.jsp?id="+id;
	var oawin =
 window.open(go,"_blank","toolbar=0,location=0,status=0,menubar=0,scrollbars=no,resizable=0,width=400,height=120");
	oawin.focus();
	oawin.opener=window;
}
</script>

	</head>

	<body>
		<form>
			<input type=text id=a name=picpath size=25 readonly>
			&nbsp;
			<input type=button value="ÉÏ´«Í¼Æ¬" onclick="upload('2');">

		</form>
	</body>
</html>
