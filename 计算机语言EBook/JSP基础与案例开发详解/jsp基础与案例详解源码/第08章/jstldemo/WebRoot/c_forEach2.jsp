<%@page contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,org.bzc.bean.UserBean"%>
<html>
	<body>
		<%
			Collection list = new ArrayList();
			for (int i = 1; i < 6; i++) {
				UserBean user = new UserBean();
				user.setUsername("user: bzc" + i);
				user.setPassword("pass: pass" + i);
				list.add(user);
			}
			session.setAttribute("list", list);
		%>
		<table width="219" height="113" border="1" align="center"
			cellpadding="0" cellspacing="0" bordercolor="#99CCFF">
			<tr>
				<td colspan="2" align="center">
					UserBean List
				</td>
			</tr>
			<tr>
				<td width="107" align="center">
					ÓÃ»§Ãû
				</td>
				<td width="106" align="center">
					ÃÜÂë
				</td>
			</tr>
			<c:forEach var="user" items="${list}" varStatus="varStatus">
				<tr>
					<td align="center">
						${user.username}
					</td>
					<td align="center">
						${user.password}
					</td>
				</tr>
			</c:forEach>
		</table>

	</body>
</html>