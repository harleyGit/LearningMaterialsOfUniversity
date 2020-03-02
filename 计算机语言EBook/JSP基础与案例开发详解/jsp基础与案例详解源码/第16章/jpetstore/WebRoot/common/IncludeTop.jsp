<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>JPetStore Demo</title>
		<meta content="text/html; charset=windows-1252"
			http-equiv="Content-Type" />
		<META HTTP-EQUIV="Cache-Control" CONTENT="max-age=0">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
		<meta http-equiv="expires" content="0">
		<META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	</head>

	<body bgcolor="white">

		<table
			background="${pageContext.request.contextPath}/images/bkg-topbar.gif"
			border="0" cellspacing="0" cellpadding="5" width="100%">
			<tbody>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/index.do"><img
								border="0"
								src="${pageContext.request.contextPath}/images/logo-topbar.gif" />
						</a>
					</td>
					<td align="right">
						<a href="${pageContext.request.contextPath}/item.do?path=viewCart"><img
								border="0" name="img_cart"
								src="${pageContext.request.contextPath}/images/cart.gif" />
						</a>
						<img border="0"
							src="${pageContext.request.contextPath}/images/separator.gif" />
						<c:choose>
							<c:when test="${empty user}">
								<a
									href="${pageContext.request.contextPath}/signon.do?path=checkSignon">
									<img border="0" name="img_signin"
										src="${pageContext.request.contextPath}/images/sign-in.gif" />
								</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/signon.do?path=off">
									<img border="0" name="img_signout"
										src="${pageContext.request.contextPath}/images/sign-out.gif" />
								</a>
							</c:otherwise>
						</c:choose>
						<img border="0"
							src="${pageContext.request.contextPath}/images/separator.gif" />
						<a href="#">
							<img border="0" name="img_myaccount"
								src="${pageContext.request.contextPath}/images/my_account.gif" />
						</a>
						<img border="0"
							src="${pageContext.request.contextPath}/images/separator.gif" />
						<a href="${pageContext.request.contextPath}/help.html"><img
								border="0" name="img_help"
								src="${pageContext.request.contextPath}/images/help.gif" />
						</a>
					</td>
					<td align="left" valign="bottom">

						<form method="post" action="#">

							<input type="text" name="keyword" size="14" />
							&nbsp;
							<input border="0"
								src="${pageContext.request.contextPath}/images/search.gif"
								type="image" />
						</form>
					</td>
				</tr>
			</tbody>
		</table>

		<%@include file="../common/IncludeQuickHeader.jsp"%>