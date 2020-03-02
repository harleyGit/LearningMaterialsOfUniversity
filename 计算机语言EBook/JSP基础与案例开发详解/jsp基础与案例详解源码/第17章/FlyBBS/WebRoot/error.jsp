<%@ page contentType="text/html;charset=GBK"%>
<link rel="stylesheet" type="text/css" href="css/forum.css">
<html>
	<head>
		<title>${title }</title>
	</head>

	<BODY bgColor=#ffffff leftmargin="0" topmargin="0">
	<%@ include file="inc/top.jsp"%>
		<div>
			<div>
				<table width="716" border="0" align="center" cellpadding="4"
					cellspacing="6" background="images/blog_main.gif">
					<tr>
						<td width="128" align="center" valign="top">
							<br>
							<br>
							<br>
							<p>
								<img src="images/err.gif" width="65" height="64" align="middle">
								<br>
								<br>
							</p>
						</td>
						<td align="center">
							<br>
							<div class="msg_head">
								${title }
							</div>
							<div class="msg_content">
								<font color="red">${info }</font>
								<br>
								<br>
								<a href="${url }">返回上一页</a>
								<br>
								<br>
								<a href="index.jsp">点击返回首页</a>
							</div>
							<div class="msg_head">
								5秒钟后自动跳转到首页
							</div>
						</td>
					</tr>
					<tr>
					</tr>
				</table>
			</div>
		</div>
			<%@ include file="inc/foot.jsp"%>
	</body>
</html>
