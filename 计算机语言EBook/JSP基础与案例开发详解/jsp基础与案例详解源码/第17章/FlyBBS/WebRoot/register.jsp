<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>****欢迎注册本论坛****</title>
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
						&nbsp;&nbsp; 注册账号
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
						服务条款和声明
					</td>
				</tr>
				<tr>
					<td class=tablebody1 align=left>
						<b>继续注册前请先阅读【${configlist.forumName }】论坛协议</b>
						<BR>
						<BR>
						欢迎您加入【${configlist.forumName }】参加交流和讨论，【${configlist.forumName }】为公共论坛，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：
						<BR>
						<BR>
						一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：
						<BR>
						<BR>
						（一）煽动抗拒、破坏宪法和法律、行政法规实施的；
						<BR>
						（二）煽动颠覆国家政权，推翻社会主义制度的；
						<BR>
						（三）煽动分裂国家、破坏国家统一的；
						<BR>
						（四）煽动民族仇恨、民族歧视，破坏民族团结的；
						<BR>
						（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；
						<BR>
						（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；
						<BR>
						（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；
						<BR>
						（八）损害国家机关信誉的；
						<BR>
						（九）其他违反宪法和法律行政法规的；
						<BR>
						（十）进行商业广告行为的。
						<BR>
						<BR>
						二、互相尊重，对自己的言论和行为负责。
						<BR>
						<BR>
						三、版主或管理员可以在不通知发贴人的情况下，修改或删除贴子，管理员有权无条件收回你的账户。
						<BR>
						<BR>
						四、【${configlist.forumName }】对注册名的限制是：
						<BR>
						<BR>
						（一）不能使用任何不良的文字，如：色情、反动、宗教迷信、伪科学、有害于民族感情、正常邦交以及世界和平等文字；
						<BR>
						（二）不能注册含有：国家领导人、海内外知名人士、文化遗产、重要设施以及国家政府机关等文字的用户名；
						<BR>
						（三）不能注册蓄意攻击他人的注册名；
						<BR>
						（四）注册名内不能包含有空格以及特殊符号，及其它特定字符。注册完成后请及时修改您的详细资料，以备连系。
						<BR>
						<BR>
						<br>
						<br>
					</td>
				</tr>
				<tr>
					<td class=tablebody2 bgcolor=#99ccff align=center>
						<center>
							<input type="submit" value="请认真查看<条款和声明> (10 秒后继续)" name="agreeb" class='bianhui'>
							<input onclick=history.back(-1) type="reset" value=" 我 不 同 意 " class='bianhui'>
						</center>
					</td>

				</tr>
			</table>

		</form>
		<SCRIPT language=javascript> var secs = 10; document.agree.agreeb.disabled=true; for(i=1;i<=secs;i++){window.setTimeout("update(" + i + ")", i * 1000); } function update(num) { if(num == secs) { document.agree.agreeb.value =" 我 同 意 "; document.agree.agreeb.disabled=false; } else { printnr = secs-num; document.agree.agreeb.value = "请认真查看<条款和声明> (" + printnr +" 秒后继续)"; } }  </SCRIPT>

	</body>
	<%@ include file="inc/foot.jsp"%>
</html>