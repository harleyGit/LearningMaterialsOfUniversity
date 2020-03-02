<%@page contentType="text/html; charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
	<head>
		<title>fmt_demo</title>
		<style>
.bzc {
	font-size: 12px
}
</style>
	</head>
	<fmt:bundle basename="labels">
	<body>
			<table width="402" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#B7B3DB" bordercolordark="#FFFFFF" class="bzc"
				style="border-style: inherit">
				<tr>
					<td width="115">
						<fmt:message key="username"/>
						£º
					</td>
					<td width="280">
						<label>
							<input type="text" name="username" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<fmt:message key="password" />
						£º
					</td>
					<td>
						<label>
							<input type="password" name="password" />
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<fmt:message key="age" />
						£º
					</td>
					<td>
						<label>
							<input type="text" name="age" />
						</label>
					</td>
				</tr>
				<tr>
					<td>&nbsp;		
				  </td>
					<td>
						<input type="submit" name="Submit"
							value="<fmt:message key="submit"/>" />
						<input type="reset" name="Reset"
							value="<fmt:message key="reset"/>" />
						<input type="hidden" name="path" value="insert" />
					</td>
				</tr>
		  </table>	  
	</body>
	</fmt:bundle>
</html>
