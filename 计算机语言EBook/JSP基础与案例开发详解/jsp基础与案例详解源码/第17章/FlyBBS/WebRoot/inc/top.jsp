<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel=stylesheet type=text/css href=/FlyBBS/css/forum.css>

<table width=95% align=center cellspacing=0 cellpadding=1 border=0
	bgcolor="#0099cc">
	<tr>
		<td>
			<table style="color: #000000" width=100% cellspacing=0 cellpadding=4
				border=0>
				<tr bgcolor="#99ccff">
					<td valign=middle>
						<c:if test="${userName!=null}">
							<FONT COLOR="#000000"> >>��ӭ ${userName} ���ٱ�վ| </FONT>
							<a href="user?path=preedit&username=${userName}"><font color="#000000">�޸ĸ�����Ϣ</font>
							</a> |<a href="mess?path=select&incept=${userName}">
							<c:choose>
							<c:when test="${news>0}">
							<bgsound src="images/sms.wav" loop=1>
								<font color="red">����Ϣ</font>
							</c:when>
							<c:otherwise>����Ϣ</c:otherwise>
							</c:choose>
							
							
							</a>|
							<a href="user?path=serch&type=top"> <font color="#000000">��Ա�б�</font>
							</a>|
 <font color="#000000">����</font>| 
  <a href=user?path=logout><font color="#000000">�˳���½</font> </a>
						</c:if>
						<c:if test="${userName==null}">
							<a href="login.jsp"><FONT COLOR="#000000"> >>��½</FONT>
							</a>								
 |<a href="register.jsp">ע�����û�</a>|<a href="user?path=serch&type=top"> <font color="#000000">��Ա�б�</font> </a>
 |<a href="help.jsp"><font color="#000000">����</font> </a>| 
      </c:if>
					</td>
					<td valign=middle align=right>
						<FONT COLOR=#000000><a href='index.jsp'><img
									src=pic/gohome.gif border=0></a> </FONT>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



