<%@ page pageEncoding="utf-8"%>
<html>
	<body>
		<%
			String[] strlen = { "hello", "error", "beijing" };
			for (int i = 0; i < 10; i++) {
				out.println(strlen[i] + "--test");
				i++;
			}
		%>
	</body>

</html>