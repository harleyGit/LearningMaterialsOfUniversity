<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<html>
	<title>后台--管理页面</title>
	<link rel="stylesheet" type="text/css" href="css/forum.css">

	<BODY bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333"
		topmargin="20">

		<table cellpadding=0 cellspacing=0 border=0 width=95%
			bgcolor='#777777' align=center>
			<tr>
				<td>
					<table cellpadding=3 cellspacing=1 border=0 width=100%>
						<tr bgcolor='#99ccff'>
							<td colspan="2" align=center bgcolor="#99ccff">
								欢迎
								<b>${admin_name }</b>进入管理页面							</td>
						</tr>
						<tr bgcolor='#e8f4ff'>
							<td width="20%" valign=top>
								<%@ include file="admin_left.jsp"%>
							</td>

							<td width="80%" valign=top bgcolor="#e8f4ff">&nbsp;							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>


		<%@ include file="../inc/foot.jsp"%>