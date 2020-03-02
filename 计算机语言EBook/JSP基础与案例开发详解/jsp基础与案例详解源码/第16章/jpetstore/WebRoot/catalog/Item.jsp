<%@include file="../common/IncludeTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table align="left" bgcolor="#008800" border="0" cellspacing="2"
	cellpadding="2">
	<tr>
		<td bgcolor="#FFFF88">
			<a
				href="${pageContext.request.contextPath}/product.do?path=show&productId=${product.productid}">
				<b><font color="BLACK" size="2">&lt;&lt; ${product.name}</font>
			</b>
			</a>
		</td>
	</tr>
</table>

<p>
<table align="center" bgcolor="#008800" cellspacing="2" cellpadding="3"
	border="0" width="60%">
	<tr bgcolor="#FFFF88">
		<td bgcolor="#FFFFFF">
			${product.descn}

		</td>
	</tr>
	<tr bgcolor="#FFFF88">
		<td width="100%" bgcolor="#cccccc">
			${item.itemid}
			<b></b>
		</td>
	</tr>
	<tr bgcolor="#FFFF88">
		<td>
			<b><font size="4"> ${item.attr1} ${item.attr2}
					${item.attr3} ${item.attr4} ${item.attr5} ${product.name} </font>
			</b>
		</td>
	</tr>
	<tr bgcolor="#FFFF88">
		<td>
			<font size="3"><i>${product.name}</i>
			</font>
		</td>
	</tr>
	<tr bgcolor="#FFFF88">
		<td>
			<c:choose>
				<c:when test="item.quantity==0">
					<font color="RED" size="2"><i>Back ordered.</i>
					</font>
				</c:when>
				<c:otherwise>
					<font size="2">in stock.</font>
				</c:otherwise>
			</c:choose>

		</td>
	</tr>
	<tr bgcolor="#FFFF88">
		<td>
			${item.listprice}

		</td>
	</tr>

	<tr bgcolor="#FFFF88">
		<td>
			<a
				href="${pageContext.request.contextPath}/item.do?path=addItemToCart&itemId=${item.itemid}">

				<img border="0"
					src="${pageContext.request.contextPath}/images/button_add_to_cart.gif" />
			</a>
		</td>
	</tr>
</table>


<p><%@include file="../common/IncludeBottom.jsp"%></p>


