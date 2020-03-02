<%@include file="../common/IncludeTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="post" action="${pageContext.request.contextPath}/orders.do?path=newOrder">
<table  align="center"bgcolor="#008800" border=0 cellpadding=3 cellspacing=1 bgcolor=#FFFF88>
<tr bgcolor=#FFFF88><td colspan=2>

<FONT color=GREEN size=4><B>Billing Address</B></FONT>
</td></tr>

<tr bgcolor=#FFFF88><td>
First name:</td><td><input type="text" name="billToFirstName" value="${account.firstname }" />
</td></tr>
<tr bgcolor=#FFFF88><td>
Last name:</td><td><input type="text" name="billToLastName" value="${account.lastname }"/>
</td></tr>
<tr bgcolor=#FFFF88><td>
Address 1:</td><td><input type="text" name="billAddress1" value="${account.addr1 }"/>
</td></tr>
<tr bgcolor=#FFFF88><td>
Address 2:</td><td><input type="text" name="billAddress2" value="${account.addr2 }"/>
</td></tr>
<tr bgcolor=#FFFF88><td>
City: </td><td><input type="text" name="billCity" value="${account.city }"/>
</td></tr>
<tr bgcolor=#FFFF88><td>
State:</td><td><input type="text" name="billState" value="${account.state }"/>
</td></tr>
<tr bgcolor=#FFFF88><td>
Zip:</td><td><input type="text" name="billZip" value="${account.zip }"/>
</td></tr>
<tr bgcolor=#FFFF88><td>
Country: </td><td><input type="text" name="billCountry" value="${account.country }"/>
</td></tr>


</table>
<P>
<center>
<input  type="image" src="${pageContext.request.contextPath}/images/button_submit.gif">
</center>

</form>

<%@include file="../common/IncludeBottom.jsp"%>