<%@include file="../common/IncludeTop.jsp"%>


<form action="${pageContext.request.contextPath}/signon.do?path=signon"
	method="post">
	<table align="center" border="0">
		<tr>
			<td colspan="2">
				Please enter your username and password.
				<br />
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				Username:
			</td>
			<td>
				<input type="text" name="username" value="j2ee" />
			</td>
		</tr>
		<tr>
			<td>
				Password:
			</td>
			<td>
				<input type="password" name="password" value="j2ee" />
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<input type="image" border="0"
					src="${pageContext.request.contextPath}/images/button_submit.gif" />
			</td>
		</tr>
	</table>
</form>
<center>

	<a href="${pageContext.request.contextPath}/account/NewAccountForm.jsp">
		<img border="0"
			src="${pageContext.request.contextPath}/images/button_register_now.gif" />
	</a>

</center>


<%@include file="../common/IncludeBottom.jsp"%>

