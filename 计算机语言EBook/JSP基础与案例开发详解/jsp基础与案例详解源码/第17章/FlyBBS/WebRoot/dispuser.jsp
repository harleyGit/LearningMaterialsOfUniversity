<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>forumName--��ѯ��������</title>
			<link rel="stylesheet" type="text/css" href="css/forum.css">
	        <style type="text/css">
<!--
.STYLE2 {font-size: 12px}
-->
            </style>
</head>
	<body>
		<table cellpadding=0 cellspacing=0 border=0 width=700 bgcolor=#0099cc
			align=center>
			<tr>
				<td>
<c:forEach var="info" items="${listByName}">
  <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr>
      <td colspan="4" bgcolor=#99ccff><p align="center"> <font color="#000000"><b>${info.userName}�ĸ�������</b> </font> </td>
      <td bgcolor=#99ccff><div align="right"><span class="STYLE2"><a href="javascript:window.close();">�ر�</a>&nbsp;&nbsp;&nbsp;&nbsp;</span></div></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor=#f2f8ff><p align="center"> <font color="#000000"><b>��������</b> </font> </td>
      <td width="2%" bgcolor=#f2f8ff></td>
      <td colspan="2" bgcolor=#f2f8ff><p align="center"> <font color="#000000"><b>����ͷ��</b> </font></td>
    </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#e8f4ff><font color="#000000"><b>�ǳƣ�</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000">${info.nickName}</font> </td>
      <td width="2%" rowspan="14" bgcolor=#f2f8ff></td>
      <td colspan="2" rowspan="4" valign="top"
								bgcolor=#f2f8ff><font color="#000000"> </font> </td>
    </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#f2f8ff><font color="#000000"><b>�Ա�</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000"> ��� </font> </td>
    </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#e8f4ff>&nbsp;</td>
      <td width="34%" bgcolor=#f2f8ff>&nbsp;</td>
    </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#f2f8ff><font color="#000000"><b>�������£�</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000">${info.article}</font> </td>
      </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#e8f4ff><font color="#000000"><b>�Ʋ���</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000">${info.userWealth}</font> </td>
      <td colspan="2" align="right" bgcolor=#f2f8ff><div align="center"><font color="#000000"><b>��ϵ����</b></font></div></td>
      </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#f2f8ff><font color="#000000"><b>���飺</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000">${info.userEP}</font> </td>
      <td width="34%" align="right" bgcolor=#e8f4ff><font color="#000000"></font> <font color="#000000"><b>OICQ��</b></font></td>
      <td width="16%" bgcolor=#f2f8ff> ${info.qq}</td>
    </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#e8f4ff><font color="#000000"><b>������</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000">${info.userCP}</font></td>
      <td width="34%" align="right" bgcolor=#f2f8ff><font color="#000000"><b></b> </font> <font color="#000000"><b>Email��</b></font></td>
      <td width="16%" bgcolor=#f2f8ff><font color="#000000"></font> <font color="#000000"><a href="mailto:${info.userEmail}">${info.userEmail}</a></font></td>
    </tr>
    <tr>
      <td width="14%" align="right" bgcolor=#f2f8ff><font color="#000000"><b>��̳�ȼ���</b> </font> </td>
      <td width="34%" bgcolor=#f2f8ff><font color="#000000"> ${info.bbstype}</font> </td>
      <td colspan="2" bgcolor=#f2f8ff><p align="center"> <font color="#000000"><b>����˵��</b> </font></td>
    </tr>
    <tr>
    
      <td width="14%" rowspan="4" valign="top" bgcolor=#f2f8ff><p align="center"> <font color="#000000"><b>����ǩ����</b> </font></td>
      <td width="34%" rowspan="4" valign="top" bgcolor=#f2f8ff><font color="#000000"> </font>${info.sign} </td>
    </tr>
    <tr>
      <td width="34%" align="right" bgcolor=#f2f8ff><font color="#000000"><b>��½������</b> </font> </td>
      <td width="16%" bgcolor=#f2f8ff><font color="#000000">${info.logins}</font></td>
    </tr>
    <tr>
      <td width="34%" align="right" bgcolor=#e8f4ff><font color="#000000"><b>����½��</b> </font> </td>
      <td width="16%" bgcolor=#f2f8ff><font color="#000000">${info.addDate}</font></td>
    </tr>
    <tr>
      <td width="34%" align="right" bgcolor=#f2f8ff><font color="#000000"><b>ע��ʱ�䣺</b> </font> </td>
      <td width="16%" bgcolor=#f2f8ff><font color="#000000">${info.lastlogin}</font></td>
    </tr>
    <tr>
      <td colspan="5" bgcolor=#99ccff><p align="center"> <font color="#000000"><b><a href="mess?path=talk&userName=${userName}&uname=${info.userName}" target=_blank>�������� </a></b> </font></td>
    </tr>
  </table>
</c:forEach>				</td>
			</tr>
		</table>
	</body>
</html>

