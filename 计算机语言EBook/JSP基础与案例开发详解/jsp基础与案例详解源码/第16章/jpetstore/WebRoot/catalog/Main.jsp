<%@include file="../common/IncludeTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="0" cellspacing="2" cellpadding="0" width="100%">
	<tr>
		<td valign="top" width="100%">

			<table align="left" border="0" cellspacing="0" width="80%">
				<tbody>
					<tr>
						<td valign="top">
							<table bgcolor="#5A8C29" border="0" cellspacing="2"
								cellpadding="0" width="100%">
								<tr>
									<td>
										<table bgcolor="#FFFF88" border="0" cellspacing="0"
											cellpadding="5" width="200">
											<tbody>
												<tr>
													<td>

														<b><i><font size="2" color="BLACK">Welcome
																	${account.firstname}</font> </i> </b> &nbsp;
													</td>
												</tr>
												<c:forEach items="${categroyList}" var="category">
												<tr>
													<td>
														<a
															href="${pageContext.request.contextPath}/category.do?path=show&categoryId=${category.catid}">
															<c:out value="${category.descn}" escapeXml="false"/>
														</a>
														<br>
														<font size="2"><i>${category.name}</i> </font>
													</td>
												</tr>
												</c:forEach>
												
											</tbody>
										</table>
									</td>
								</tr>
							</table>

						</td>
						<td align="center" bgcolor="white" height="300" width="100%">

							<!-- MAIN IMAGE -->

							<map name="estoremap">
								<area alt="Birds" coords="72,2,280,250"
									href="${pageContext.request.contextPath}/category.do?path=show&categoryId=BIRDS"
									shape="RECT" />
								<area alt="Fish" coords="4,182,74,252"
									href="${pageContext.request.contextPath}/category.do?path=show&categoryId=FISH"
									shape="RECT" />
								<area alt="Dogs" coords="61,249,131,319"
									href="${pageContext.request.contextPath}/category.do?path=show&categoryId=DOGS"
									shape="RECT" />
								<area alt="Reptiles" coords="140,270,210,340"
									href="${pageContext.request.contextPath}/category.do?path=show&categoryId=REPTILES"
									shape="RECT" />
								<area alt="Cats" coords="225,240,295,310"
									href="${pageContext.request.contextPath}/category.do?path=show&categoryId=CATS"
									shape="RECT" />
								<area alt="Birds" coords="279,182,349,252"
									href="${pageContext.request.contextPath}/category.do?path=show&categoryId=BIRDS"
									shape="RECT" />
							</map>
							<img border="0" height="355"
								src="${pageContext.request.contextPath}/images/splash.gif"
								align="center" usemap="#estoremap" width="350" />
						</td>
					</tr>
				</tbody>
			</table>
		</td>
	</tr>

</table>

<%@include file="../common/IncludeBanner.jsp"%>
<%@include file="../common/IncludeBottom.jsp"%>

