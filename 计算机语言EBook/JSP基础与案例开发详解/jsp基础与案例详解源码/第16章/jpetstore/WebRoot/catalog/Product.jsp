<%@include file="../common/IncludeTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<table align="left" bgcolor="#008800" border="0" cellspacing="2" cellpadding="2">
<tr><td bgcolor="#FFFF88">
<a href="${pageContext.request.contextPath}/category.do?path=show&categoryId=${product.category}">   <b><font color="BLACK" size="2">&lt;&lt;${product.category} </font></b></a>
</td></tr>
</table>

<p>

<center>
  <b><font size="4">${product.name}</font></b>
</center>

<table align="center" bgcolor="#008800" border="0" cellspacing="2" cellpadding="3">
  <tr bgcolor="#CCCCCC">  <td><b>Item ID</b></td>  <td><b>Product ID</b></td>  <td><b>Description</b></td>  <td><b>List Price</b></td>  <td>&nbsp;</td>  </tr>
 
 <c:forEach items="${itemList}" var="item">
 
  <tr bgcolor="#FFFF88">
  <td><b>
<a href="${pageContext.request.contextPath}/item.do?path=addItemToCart&itemId=${item.itemid}">
 
 ${item.itemid}></a></b></td>
  <td>${item.productid}</td>
  <td>
  ${item.attr1}
  ${item.attr2}
  ${item.attr3}
  ${item.attr4}
  ${item.attr5}
  ${product.name}
    
   </td>
  <td>${item.listprice}</td>
  <td><a href="${pageContext.request.contextPath}/item.do?path=addItemToCart&itemId=${item.itemid}&product"> 
  <img border="0" src="${pageContext.request.contextPath}/images/button_add_to_cart.gif" /></a></td>
  </tr>
</c:forEach>
  <tr><td bgcolor="#FFFFFF" colspan="2">
 
    <a href="#"><img src="${pageContext.request.contextPath}/images/button_prev.gif" border="0"></a>

 
    <a href="#"><img src="${pageContext.request.contextPath}/images/button_next.gif" border="0"></a>
  </td></tr>
</table>

<%@include file="../common/IncludeBottom.jsp"%>




