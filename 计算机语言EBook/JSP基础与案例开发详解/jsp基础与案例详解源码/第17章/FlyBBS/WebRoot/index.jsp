<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>首页</title>
		<script type="text/javascript">

 
 window.onbeforeunload = function() //author: meizz 
       { 
              var n = window.event.screenX - window.screenLeft; 
              var b = n > document.documentElement.scrollWidth-20; 
              if(b && window.event.clientY < 0 || window.event.altKey) 
              { 
              
                     location.href="SessionInvalidate"     ;// SessionInvalidate 是一个处理 session 失效的Servlet
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
