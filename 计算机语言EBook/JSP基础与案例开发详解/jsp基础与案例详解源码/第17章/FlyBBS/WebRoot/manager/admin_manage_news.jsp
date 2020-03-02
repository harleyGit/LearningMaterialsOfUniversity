<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty admin_name}">
<script language="javascript" type="text/javascript">
        window.location.href="${pageContext.request.contextPath}/admin_login.jsp";
    </script>
</c:if>
<title>admin--管理页面</title>
<link rel="stylesheet" type="text/css" href="css/forum.css">

<BODY bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333"
	topmargin="20">

	<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=#777777
		align=center>
		<tr>
         <td>
         <table cellpadding=3 cellspacing=1 border=0 width=100%>
         <tr bgcolor='#99ccff'>
						<td align=center colspan="2">
							欢迎
							<b> ${admin_name }</b>进入管理页面
						</td>
					</tr>
                    <tr bgcolor='#f2f8ff'>
                    <td width="20%" valign=top>
							<%@include file="admin_left.jsp"%>
						</td>
                        <td width="80%" valign=top>
                        <div align="center">
                        <form method=Post action="bbs?path=dele">
                        <table border="0" cellspacing="0" width="100%" cellpadding="0">
                        <input type="hidden" name="bid" value="${bid }">
                        <input type="hidden" name="cid" value="${cid }">
                        <tr>
												<td width="200" align="center" bgcolor="#99ccff" height="20">
													<strong>ID号</strong>												</td>
												<td width="200" align="center" bgcolor="#99ccff">
													<strong>标题</strong>												</td>
												<td width="200" align="center" bgcolor="#99ccff">
													<strong>发布者</strong>												</td>
												<td width="200" align="center" bgcolor="#99ccff">
													<strong>发布时间</strong>												</td>
												<td width="200" align="center" bgcolor="#99ccff">
													<input type='submit' value='删除'>												</td>
											</tr>
                                            <c:forEach var="bbs" items="${bbsList}">
												<tr>
												<td width="200" align="center"  height="20">
													${bbs.announceID}												</td>
												<td width="200" align="center" >
													<a href = "#">${bbs.title}</a>												</td>
												<td width="200" align="center" >
													${bbs.userName}												</td>
												<td width="200" align="center" >
													${bbs.dateAndTime}												</td>
												<td width="200" align="center" >
													<input type='checkbox' name='bbsid' value='${bbs.announceID}'>												</td>
											</tr>
                                        </c:forEach>
                        </table>
                        </form>
                        </div>
                        </td>
                    </tr>
         </table>
         </td>
        </tr>
	</table>
</body>