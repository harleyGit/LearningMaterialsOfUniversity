<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>****��ӭע�᱾��̳****</title>
		<link rel=stylesheet type=text/css href=css/forum.css>
	</head>
	<body>
<%@ include file="inc/top.jsp"%>
		<TABLE border=0 width="95%" align=center>
			<TBODY>
				<TR>
					<TD vAlign=top width="30%">
						<img border=0 src=pic/LOGO.GIF>
					</TD>
					<TD valign=middle align=top>
						&nbsp;&nbsp;
						<img src=pic/closedfold.gif border=0>
						&nbsp;&nbsp;
						<a href=index.jsp>${configlist.forumName }</a>
						<br>
						&nbsp;&nbsp;
						<img src=pic/bar.gif border=0 width=15 height=15>
						<img src=pic/closedfold.gif border=0>
						&nbsp;&nbsp; ע���˺�
						<a name=top></a>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<form action="control?path=reg" method="post" name="agree">
			<table cellpadding=3 cellspacing=1 align=center class=Table>
				<tr>
					<td align=center></td>
				<tr>
					<td  bgcolor=#99ccff align=center>
						�������������
					</td>
				</tr>
				<tr>
					<td class=tablebody1 align=left>
						<b>����ע��ǰ�����Ķ���${configlist.forumName }����̳Э��</b>
						<BR>
						<BR>
						��ӭ�����롾${configlist.forumName }���μӽ��������ۣ���${configlist.forumName }��Ϊ������̳��Ϊά�����Ϲ������������ȶ��������Ծ������������
						<BR>
						<BR>
						һ���������ñ�վΣ�����Ұ�ȫ��й¶�������ܣ������ַ�������Ἧ��ĺ͹���ĺϷ�Ȩ�棬�������ñ�վ���������ƺʹ���������Ϣ��
						<BR>
						<BR>
						��һ��ɿ�����ܡ��ƻ��ܷ��ͷ��ɡ���������ʵʩ�ģ�
						<BR>
						������ɿ���߸�������Ȩ���Ʒ���������ƶȵģ�
						<BR>
						������ɿ�����ѹ��ҡ��ƻ�����ͳһ�ģ�
						<BR>
						���ģ�ɿ�������ޡ��������ӣ��ƻ������Ž�ģ�
						<BR>
						���壩�������������ʵ��ɢ��ҥ�ԣ������������ģ�
						<BR>
						����������⽨���š����ࡢɫ�顢�Ĳ�����������ɱ���ֲ�����������ģ�
						<BR>
						���ߣ���Ȼ�������˻���������ʵ�̰����˵ģ����߽����������⹥���ģ�
						<BR>
						���ˣ��𺦹��һ��������ģ�
						<BR>
						���ţ�����Υ���ܷ��ͷ�����������ģ�
						<BR>
						��ʮ��������ҵ�����Ϊ�ġ�
						<BR>
						<BR>
						�����������أ����Լ������ۺ���Ϊ����
						<BR>
						<BR>
						�������������Ա�����ڲ�֪ͨ�����˵�����£��޸Ļ�ɾ�����ӣ�����Ա��Ȩ�������ջ�����˻���
						<BR>
						<BR>
						�ġ���${configlist.forumName }����ע�����������ǣ�
						<BR>
						<BR>
						��һ������ʹ���κβ��������֣��磺ɫ�顢�������ڽ����š�α��ѧ���к���������顢������Լ������ƽ�����֣�
						<BR>
						����������ע�Ậ�У������쵼�ˡ�������֪����ʿ���Ļ��Ų�����Ҫ��ʩ�Լ������������ص����ֵ��û�����
						<BR>
						����������ע�����⹥�����˵�ע������
						<BR>
						���ģ�ע�����ڲ��ܰ����пո��Լ�������ţ��������ض��ַ���ע����ɺ��뼰ʱ�޸�������ϸ���ϣ��Ա���ϵ��
						<BR>
						<BR>
						<br>
						<br>
					</td>
				</tr>
				<tr>
					<td class=tablebody2 bgcolor=#99ccff align=center>
						<center>
							<input type="submit" value="������鿴<���������> (10 ������)" name="agreeb" class='bianhui'>
							<input onclick=history.back(-1) type="reset" value=" �� �� ͬ �� " class='bianhui'>
						</center>
					</td>

				</tr>
			</table>

		</form>
		<SCRIPT language=javascript> var secs = 10; document.agree.agreeb.disabled=true; for(i=1;i<=secs;i++){window.setTimeout("update(" + i + ")", i * 1000); } function update(num) { if(num == secs) { document.agree.agreeb.value =" �� ͬ �� "; document.agree.agreeb.disabled=false; } else { printnr = secs-num; document.agree.agreeb.value = "������鿴<���������> (" + printnr +" ������)"; } }  </SCRIPT>

	</body>
	<%@ include file="inc/foot.jsp"%>
</html>