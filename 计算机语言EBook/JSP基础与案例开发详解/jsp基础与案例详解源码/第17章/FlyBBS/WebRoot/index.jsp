<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>��ҳ</title>
		<script type="text/javascript">

 
 window.onbeforeunload = function() //author: meizz 
       { 
              var n = window.event.screenX - window.screenLeft; 
              var b = n > document.documentElement.scrollWidth-20; 
              if(b && window.event.clientY < 0 || window.event.altKey) 
              { 
              
                     location.href="SessionInvalidate"     ;// SessionInvalidate ��һ������ session ʧЧ��Servlet
              } 

}

</script>
	</head>

	<body>
		<%
			request.getRequestDispatcher("control?path=index").forward(request,
					response);
		%>
		<br>
	</body>
</html>
