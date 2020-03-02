<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>el_scope</title>
		<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
}
.STYLE2 {font-size: 12px}
-->
</style>
	</head>
	<body>
		<%
			String username = "bzc";
			pageContext.setAttribute("user", username);
			request.setAttribute("user", username);
			session.setAttribute("user", username);
			application.setAttribute("user", username);
		%>
		<table width="509" height="204" border="1" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" align="center"><span class="STYLE1">JSP EL隐式对象 </span></td>
  </tr>
  <tr>
    <td width="199" align="center"><span class="STYLE2">隐式对象</span></td>
    <td width="153" align="center"><span class="STYLE2">操作</span></td>
    <td width="207" align="center"><span class="STYLE2">结果</span></td>
  </tr>
  <tr>
<td align="center">
<span class="STYLE2">pageContext</span></td>
    <td align="center"><span class="STYLE2">取值</span></td>
<td align="center">
<span class="STYLE2">
${pageContext.request.requestURI }</span>
</td>
  </tr>
      <tr>
      <td align="center">
<span class="STYLE2">pageScope</span></td>
      <td align="center"><span class="STYLE2">取值</span></td>
      <td align="center">
<span class="STYLE2">${pageScope.user }</span></td>
    </tr>
    <tr>
<td align="center">
<span class="STYLE2">sessionScope</span></td>
    <td align="center"><span class="STYLE2">取值</span></td>
<td align="center">
<span class="STYLE2">${sessionScope.user }</span></td>
  </tr>
    <tr>
<td align="center">
<span class="STYLE2">requestScope</span></td>
    <td align="center"><span class="STYLE2">取值</span></td>
<td align="center">
<span class="STYLE2">${requestScope.user }</span></td>
  </tr>  
    <tr>
      <td align="center">
<span class="STYLE2">applicationScope</span></td>
      <td align="center"><span class="STYLE2">取值</span></td>
      <td align="center">
<span class="STYLE2">${applicationScope.user }</span></td>
    </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td align="center"><span class="STYLE2"><a href="elScope2.jsp">下一页</a></span></td>
    <td align="center">&nbsp;</td>
  </tr>  
</table>
	</body>
</html>
