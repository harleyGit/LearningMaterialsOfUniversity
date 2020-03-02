<%@ page contentType="text/html;charset=GBK"%>
<html>
	<head>
		<title>${configlist.forumName }--『 ${boardinfo } 』 发布新贴</title>
		<link rel=stylesheet type=text/css href=css/forum.css>
		<link href="css/Editor.css" type="text/css" rel="stylesheet">

		<Script Language=Javascript>
function subchk() 
{ 
	document.frmAdd.content.value= document.frames("HTMLEditor").document.body.innerHTML;
	document.frmAdd.ftype.value=document.frmTmp.type.value;
	document.frmAdd.ftitle.value=document.frmTmp.title.value;
} 

<!--
var sPath = document.location.pathname;
sPath = sPath.substr(0, sPath.length-14);

var sLinkFieldName = "content1" ;
var sLinkOriginalFileName = "" ;
var sLinkSaveFileName = "" ;
var sLinkSavePathFileName = "" ;

// 全局设置对象
var config = new Object() ;
config.Version = "3.0.0" ;
config.ReleaseDate = "2008-09-04" ;
config.License = "" ;
config.StyleName = "White";
config.StyleMenuHeader = "<head><link href=\"css/MenuArea.css\" type=\"text/css\" rel=\"stylesheet\"></head><body scroll=\"no\" onConTextMenu=\"event.returnValue=false;\">"; //Menu CSS
config.StyleDir = "standard";
config.StyleUploadDir = "UploadFile/";
config.InitMode = "EDIT";
config.AutoDetectPasteFromWord = true;
config.BaseUrl = "0";
config.BaseHref = "/";
config.AutoRemote = "1";
config.ShowBorder = "0";

	sInitMode = "EDIT";


var sBaseHref = "";
if(config.BaseHref!=""){
	sBaseHref = "<base href=\"" + document.location.protocol + "//" + document.location.host + config.BaseHref + "\">";
}
config.StyleEditorHeader = "<head><link href=\"css/EditorArea.css\" type=\"text/css\" rel=\"stylesheet\">" + sBaseHref + "</head><body MONOSPACE>" ; //Menu CSS
//-->
</Script>


		<script language="javascript" event="onerror(msg, url, line)"
			for="window">
return true ;	 // 隐藏错误
</script>
		<script type="text/javascript">

var sCurrMode = null;
var bEditMode = null;

var oLinkField = null;


var BrowserInfo = new Object() ;
BrowserInfo.MajorVer = navigator.appVersion.match(/MSIE (.)/)[1] ;
BrowserInfo.MinorVer = navigator.appVersion.match(/MSIE .\.(.)/)[1] ;
BrowserInfo.IsIE55OrMore = BrowserInfo.MajorVer >= 6 || ( BrowserInfo.MajorVer >= 5 && BrowserInfo.MinorVer >= 5 ) ;

var yToolbars = new Array();  

var bInitialized = false;
function document.onreadystatechange(){
	if (document.readyState!="complete") return;
	if (bInitialized) return;
	bInitialized = true;

	var i, s, curr;


	for (i=0; i<document.body.all.length;i++){
		curr=document.body.all[i];
		if (curr.className == "yToolbar"){
			InitTB(curr);
			yToolbars[yToolbars.length] = curr;
		}
	}

	oLinkField = parent.document.getElementsByName(sLinkFieldName)[0];
	if (!config.License){
		try{
			HTMLEditor_License.innerHTML = "&copy; <a href='http://www.eWebSoft.com' target='_blank'><font color=#000000>eWebSoft.com</font></a>";
		}
		catch(e){
		}
	}

	if (!BrowserInfo.IsIE55OrMore){
		config.InitMode = "TEXT";
	}
	
	if (ContentFlag.value=="0") { 
		ContentEdit.value = oLinkField.value;
		ContentLoad.value = oLinkField.value;
		ModeEdit.value = config.InitMode;
		ContentFlag.value = "1";
	}

	setMode(ModeEdit.value);
	setLinkedField() ;
}

function InitBtn(btn) {
	btn.onmouseover = BtnMouseOver;
	btn.onmouseout = BtnMouseOut;
	btn.onmousedown = BtnMouseDown;
	btn.onmouseup = BtnMouseUp;
	btn.ondragstart = YCancelEvent;
	btn.onselectstart = YCancelEvent;
	btn.onselect = YCancelEvent;
	btn.YUSERONCLICK = btn.onclick;
	btn.onclick = YCancelEvent;
	btn.YINITIALIZED = true;
	return true;
}

function InitTB(y) {
	y.TBWidth = 0;
		
	if (! PopulateTB(y)) return false;
	
	y.style.posWidth = y.TBWidth;
	
	return true;
}


function YCancelEvent() {
	event.returnValue=false;
	event.cancelBubble=true;
	return false;
}

function BtnMouseOver() {
	if (event.srcElement.tagName != "IMG") return false;
	var image = event.srcElement;
	var element = image.parentElement;
	
	if (image.className == "Ico") element.className = "BtnMouseOverUp";
	else if (image.className == "IcoDown") element.className = "BtnMouseOverDown";

	event.cancelBubble = true;
}

function BtnMouseOut() {
	if (event.srcElement.tagName != "IMG") {
		event.cancelBubble = true;
		return false;
	}

	var image = event.srcElement;
	var element = image.parentElement;
	yRaisedElement = null;
	
	element.className = "Btn";
	image.className = "Ico";

	event.cancelBubble = true;
}

function BtnMouseDown() {
	if (event.srcElement.tagName != "IMG") {
		event.cancelBubble = true;
		event.returnValue=false;
		return false;
	}

	var image = event.srcElement;
	var element = image.parentElement;

	element.className = "BtnMouseOverDown";
	image.className = "IcoDown";

	event.cancelBubble = true;
	event.returnValue=false;
	return false;
}

function BtnMouseUp() {
	if (event.srcElement.tagName != "IMG") {
		event.cancelBubble = true;
		return false;
	}

	var image = event.srcElement;
	var element = image.parentElement;

	if (element.YUSERONCLICK) eval(element.YUSERONCLICK + "anonymous()");

	element.className = "BtnMouseOverUp";
	image.className = "Ico";

	event.cancelBubble = true;
	return false;
}

function PopulateTB(y) {
	var i, elements, element;

	elements = y.children;
	for (i=0; i<elements.length; i++) {
		element = elements[i];
		if (element.tagName == "SCRIPT" || element.tagName == "!") continue;
		
		switch (element.className) {
		case "Btn":
			if (element.YINITIALIZED == null) {
				if (! InitBtn(element)) {
					alert("Problem initializing:" + element.id);
					return false;
				}
			}
			
			element.style.posLeft = y.TBWidth;
			y.TBWidth += element.offsetWidth + 1;
			break;
			
		case "TBGen":
			element.style.posLeft = y.TBWidth;
			y.TBWidth += element.offsetWidth + 1;
			break;
			
		case "TBSep":
			element.style.posLeft = y.TBWidth + 2;
			y.TBWidth += 5;
			break;
			
		case "TBHandle":
			element.style.posLeft = 2;
			y.TBWidth += element.offsetWidth + 7;
			break;
			
		default:
			alert("Invalid class: " + element.className + " on Element: " + element.id + " <" + element.tagName + ">");
			return false;
		}
	}

	y.TBWidth += 1;
	return true;
}


function setLinkedField() {
	if (! oLinkField) return ;
	var oForm = oLinkField.form ;
	if (!oForm) return ;
	oForm.attachEvent("onsubmit", AttachSubmit) ;
	if (! oForm.submitEditor) oForm.submitEditor = new Array() ;
	oForm.submitEditor[oForm.submitEditor.length] = AttachSubmit ;
	if (! oForm.originalSubmit) {
		oForm.originalSubmit = oForm.submit ;
		oForm.submit = function() {
			if (this.submitEditor) {
				for (var i = 0 ; i < this.submitEditor.length ; i++) {
					this.submitEditor[i]() ;
				}
			}
			this.originalSubmit() ;
		}
	}
	oForm.attachEvent("onreset", AttachReset) ;
	if (! oForm.resetEditor) oForm.resetEditor = new Array() ;
	oForm.resetEditor[oForm.resetEditor.length] = AttachReset ;
	if (! oForm.originalReset) {
		oForm.originalReset = oForm.reset ;
		oForm.reset = function() {
			if (this.resetEditor) {
				for (var i = 0 ; i < this.resetEditor.length ; i++) {
					this.resetEditor[i]() ;
				}
			}
			this.originalReset() ;
		}
	}
}

function AttachSubmit() { 
	var oForm = oLinkField.form ;
	if (!oForm) return;
	var html = getHTML();
	ContentEdit.value = html;
	if (sCurrMode=="TEXT"){
		html = HTMLEncode(html);
	}
	splitTextField(oLinkField, html);
} 

function doSubmit(){
	var oForm = oLinkField.form ;
	if (!oForm) return ;
	oForm.submit();
}

function AttachReset() {
	if(bEditMode){
		HTMLEditor.document.body.innerHTML = ContentLoad.value;
	}else{
		HTMLEditor.document.body.innerText = ContentLoad.value;
	}
}

function onHelp(){
	ShowDialog('Dialog/Help.htm','400','300');
	return false;
}

function onPaste() {
	if (sCurrMode=="VIEW") return false;

	if (sCurrMode=="EDIT"){
		var sHTML = GetClipboardHTML() ;
		if (config.AutoDetectPasteFromWord && BrowserInfo.IsIE55OrMore) {
			var re = /<\w[^>]* class="?MsoNormal"?/gi ;
			if ( re.test(sHTML)){
				if ( confirm( "\u8981\u7C98\u8D34\u7684\u5185\u5BB9\u597D\u8C61\u662F\u4ECE Word \u4E2D\u590D\u5236\u7684\uFF0C\u662F\u5426\u8981\u5148\u6E05\u9664 Word \u683C\u5F0F\u518D\u7C98\u8D34\uFF1F" ) ){
					cleanAndPaste( sHTML ) ;
					return false ;
				}
			}
		}
		HTMLEditor.document.selection.createRange().pasteHTML(sHTML) ;
		return false;
	}else{
		HTMLEditor.document.selection.createRange().pasteHTML(HTMLEncode( clipboardData.getData("Text"))) ;
		return false;
	}
	
}

function onKeyDown(event){
	var key = String.fromCharCode(event.keyCode).toUpperCase();

	if (event.keyCode==113){
		showBorders();
		return false;
	}
	if (event.ctrlKey){
		if (event.keyCode==10){
			doSubmit();
			return false;
		}
		if (key=="+"){
			sizeChange(160);
			return false;
		}
		if (key=="-"){
			sizeChange(-160);
			return false;
		}
		if (key=="1"){
			setMode("CODE");
			return false;
		}
		if (key=="2"){
			setMode("EDIT");
			return false;
		}
		if (key=="3"){
			setMode("TEXT");
			return false;
		}
		if (key=="4"){
			setMode("VIEW");
			return false;
		}
	}

	switch(sCurrMode){
	case "VIEW":
		return true;
		break;
	case "EDIT":
		if (event.ctrlKey){
			if (key == "D"){
				PasteWord();
				return false;
			}
			if (key == "R"){
				findReplace();
				return false;
			}
			if (key == "Z"){
				goHistory(-1);
				return false;
			}
			if (key == "Y"){
				goHistory(1);
				return false;
			}
		}
		if(!event.ctrlKey && event.keyCode != 90 && event.keyCode != 89) {
			if (event.keyCode == 32 || event.keyCode == 13){
				saveHistory()
			}
		}
		return true;
		break;
	default:
		if (event.keyCode==13){
			var sel = HTMLEditor.document.selection.createRange();
			sel.pasteHTML("<BR>");
			event.cancelBubble = true;
			event.returnValue = false;
			sel.select();
			sel.moveEnd("character", 1);
			sel.moveStart("character", 1);
			sel.collapse(false);
			return false;
		}
		// \u5C4F\u853D\u4E8B\u4EF6
		if (event.ctrlKey){
			// Ctrl+B,I,U
			if ((key == "B")||(key == "I")||(key == "U")){
				return false;
			}
		}

	}
}

function GetClipboardHTML() {
	var oDiv = document.getElementById("HTMLEditor_Temp_HTML")
	oDiv.innerHTML = "" ;
	
	var oTextRange = document.body.createTextRange() ;
	oTextRange.moveToElementText(oDiv) ;
	oTextRange.execCommand("Paste") ;
	
	var sData = oDiv.innerHTML ;
	oDiv.innerHTML = "" ;
	
	return sData ;
}

function cleanAndPaste( html ) {
	html = html.replace(/<\/?SPAN[^>]*>/gi, "" );
	html = html.replace(/<(\w[^>]*) class=([^ |>]*)([^>]*)/gi, "<$1$3") ;
	html = html.replace(/<(\w[^>]*) style="([^"]*)"([^>]*)/gi, "<$1$3") ;
	html = html.replace(/<(\w[^>]*) lang=([^ |>]*)([^>]*)/gi, "<$1$3") ;
	html = html.replace(/<\\?\?xml[^>]*>/gi, "") ;
	html = html.replace(/<\/?\w+:[^>]*>/gi, "") ;
	html = html.replace(/&nbsp;/, " " );
	var re = new RegExp("(<P)([^>]*>.*?)(<\/P>)","gi") ;	// Different because of a IE 5.0 error
	html = html.replace( re, "<div$2</div>" ) ;
	
	insertHTML( html ) ;
}

function insertHTML(html) {
	if (isModeView()) return false;
	if (HTMLEditor.document.selection.type.toLowerCase() != "none"){
		HTMLEditor.document.selection.clear() ;
	}
	if (sCurrMode!="EDIT"){
		html=HTMLEncode(html);
	}
	HTMLEditor.document.selection.createRange().pasteHTML(html) ; 
}

function setHTML(html) {
	ContentEdit.value = html;
	switch (sCurrMode){
	case "CODE":
		HTMLEditor.document.designMode="On";
		HTMLEditor.document.open();
		HTMLEditor.document.write(config.StyleEditorHeader);
		HTMLEditor.document.body.innerText=html;
		HTMLEditor.document.body.contentEditable="true";
		HTMLEditor.document.close();
		bEditMode=false;
		break;
	case "EDIT":
		HTMLEditor.document.designMode="On";
		HTMLEditor.document.open();
		HTMLEditor.document.write(config.StyleEditorHeader+html);
		HTMLEditor.document.body.contentEditable="true";
		HTMLEditor.document.execCommand("2D-Position",true,true);
		HTMLEditor.document.execCommand("MultipleSelection", true, true);
		HTMLEditor.document.execCommand("LiveResize", true, true);
		HTMLEditor.document.close();
		doZoom(nCurrZoomSize);
		bEditMode=true;
		HTMLEditor.document.onselectionchange = function () { doToolbar();}
		break;
	case "TEXT":
		HTMLEditor.document.designMode="On";
		HTMLEditor.document.open();
		HTMLEditor.document.write(config.StyleEditorHeader);
		HTMLEditor.document.body.innerText=html;
		HTMLEditor.document.body.contentEditable="true";
		HTMLEditor.document.close();
		bEditMode=false;
		break;
	case "VIEW":
		HTMLEditor.document.designMode="off";
		HTMLEditor.document.open();
		HTMLEditor.document.write(config.StyleEditorHeader+html);
		HTMLEditor.document.body.contentEditable="false";
		HTMLEditor.document.close();
		bEditMode=false;
		break;
	}

	HTMLEditor.document.body.onpaste = onPaste ;
	HTMLEditor.document.body.onhelp = onHelp ;
	HTMLEditor.document.onkeydown = new Function("return onKeyDown(HTMLEditor.event);");
	HTMLEditor.document.oncontextmenu=new Function("return showContextMenu(HTMLEditor.event);");

	if ((borderShown != "0")&&bEditMode) {
		borderShown = "0";
		showBorders();
	}

	initHistory();
}

function getHTML() {
	var html;
	if((sCurrMode=="EDIT")||(sCurrMode=="VIEW")){
		html = HTMLEditor.document.body.innerHTML;
	}else{
		html = HTMLEditor.document.body.innerText;
	}
	if (sCurrMode!="TEXT"){
		if ((html.toLowerCase()=="<p>&nbsp;</p>")||(html.toLowerCase()=="<p></p>")){
			html = "";
		}
	}
	return html;
}

function appendHTML(html) {
	if (isModeView()) return false;
	if(sCurrMode=="EDIT"){
		HTMLEditor.document.body.innerHTML += html;
	}else{
		HTMLEditor.document.body.innerText += html;
	}
}

function PasteWord(){
	if (!validateMode()) return;
	HTMLEditor.focus();
	if (BrowserInfo.IsIE55OrMore)
		cleanAndPaste( GetClipboardHTML() ) ;
	else if ( confirm( "\u9700\u8981 Internet Explorer 5.5 \u7248\u672C\u4EE5\u4E0A\u7684\u652F\u6301..\u662F\u5426\u4EE5\u5E38\u89C4\u7C98\u8D34..." ) )
		format("paste") ;
	HTMLEditor.focus();
}

function PasteText(){
	if (!validateMode()) return;
	HTMLEditor.focus();
	var sText = HTMLEncode( clipboardData.getData("Text") ) ;
	insertHTML(sText);
	HTMLEditor.focus();
}

function validateMode() {
	if (sCurrMode=="EDIT") return true;
	alert("\u7F16\u8F91\u6A21\u5F0F \u4E0B\u624D\u80FD\u4F7F\u7528\u7F16\u8F91\u529F\u80FD...");
	HTMLEditor.focus();
	return false;
}

function isModeView(){
	if (sCurrMode=="VIEW"){
		alert("\u7F16\u8F91\u6A21\u5F0F \u4E0B\u624D\u80FD\u4F7F\u7528\u7F16\u8F91\u529F\u80FD...");
		return true;
	}
	return false;
}

function format(what,opt) {
	if (!validateMode()) return;
	HTMLEditor.focus();
	if (opt=="RemoveFormat") {
		what=opt;
		opt=null;
	}
	if (opt==null) HTMLEditor.document.execCommand(what);
	else HTMLEditor.document.execCommand(what,"",opt);
	HTMLEditor.focus();
}

function VerifyFocus() {
	if ( HTMLEditor )
		HTMLEditor.focus();
}

function setMode(NewMode){
	if (NewMode!=sCurrMode){
		
		if (!BrowserInfo.IsIE55OrMore){
			if ((NewMode=="CODE") || (NewMode=="EDIT") || (NewMode=="VIEW")){
				alert("HTMLEditor \u7F16\u8F91\u6A21\u5F0F\u9700\u8981 Internet Explorer 5.5 \u7248\u672C\u4EE5\u4E0A\u7684\u652F\u6301...");
				return false;
			}
		}

		if (NewMode=="TEXT"){
			if (sCurrMode==ModeEdit.value){
				if (!confirm("\u5207\u6362\u5230 \u6587\u672C\u6A21\u5F0F \u4F1A\u6E05\u9664\u6240\u6709\u7684 HTML \u683C\u5F0F\uFF0C\u786E\u8BA4\u5417\uFF1F")){
					return false;
				}
			}
		}

		var sBody = "";
		switch(sCurrMode){
		case "CODE":
			if (NewMode=="TEXT"){
				HTMLEditor_Temp_HTML.innerHTML = HTMLEditor.document.body.innerText;
				sBody = HTMLEditor_Temp_HTML.innerText;
			}else{
				sBody = HTMLEditor.document.body.innerText;
			}
			break;
		case "TEXT":
			sBody = HTMLEditor.document.body.innerText;
			sBody = HTMLEncode(sBody);
			break;
		case "EDIT":
		case "VIEW":
			if (NewMode=="TEXT"){
				sBody = HTMLEditor.document.body.innerText;
			}else{
				sBody = HTMLEditor.document.body.innerHTML;
			}
			break;
		default:
			sBody = ContentEdit.value;
			break;
		}

		try{
			document.all["HTMLEditor_CODE"].className = "StatusBarBtnOff";
			document.all["HTMLEditor_EDIT"].className = "StatusBarBtnOff";
			document.all["HTMLEditor_TEXT"].className = "StatusBarBtnOff";
			document.all["HTMLEditor_VIEW"].className = "StatusBarBtnOff";
			document.all["HTMLEditor_"+NewMode].className = "StatusBarBtnOn";
			}
		catch(e){
			}
		
		sCurrMode = NewMode;
		ModeEdit.value = NewMode;
		setHTML(sBody);
		disableChildren(HTMLEditor_Toolbar);

	}
}

function disableChildren(obj){
	if (obj){
		obj.disabled=(!bEditMode);
		for (var i=0; i<obj.children.length; i++){
			disableChildren(obj.children[i]);
		}
	}
}



function ShowDialog(url, width, height, optValidate) {
	if (optValidate) {
		if (!validateMode()) return;
	}
	HTMLEditor.focus();
	var arr = showModalDialog(url, window, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;help:no;scroll:no;status:no");
	HTMLEditor.focus();
}

function Maximize() {
	if (!validateMode()) return;
	window.open("Dialog/Fullscreen.htm?style="+config.StyleName, 'FullScreen'+sLinkFieldName, 'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,fullscreen=yes');
}

function createLink(){
	if (!validateMode()) return;
	
	if (HTMLEditor.document.selection.type == "Control") {
		var oControlRange = HTMLEditor.document.selection.createRange();
		if (oControlRange(0).tagName.toUpperCase() != "IMG") {
			alert("\u94FE\u63A5\u53EA\u80FD\u662F\u56FE\u7247\u6216\u6587\u672C...");
			return;
		}
	}
	
	ShowDialog("Dialog/HyperLink.htm", 350, 195, true);
}

function HTMLEncode(text){
	text = text.replace(/&/g, "&amp;") ;
	text = text.replace(/"/g, "&quot;") ;
	text = text.replace(/</g, "&lt;") ;
	text = text.replace(/>/g, "&gt;") ;
	text = text.replace(/'/g, "&#146;") ;
	text = text.replace(/\ /g,"&nbsp;");
	text = text.replace(/\n/g,"<br>");
	text = text.replace(/\t/g,"&nbsp;&nbsp;&nbsp;&nbsp;");
	return text;
}

function insert(what) {
	if (!validateMode()) return;
	HTMLEditor.focus();
	var sel = HTMLEditor.document.selection.createRange();

	switch(what){
	case "excel":		
		insertHTML("<object classid='clsid:0002E510-0000-0000-C000-000000000046' id='Spreadsheet1' codebase='file:\\Bob\software\office2000\msowc.cab' width='100%' height='250'><param name='HTMLURL' value><param name='HTMLData' value='&lt;html xmlns:x=&quot;urn:schemas-microsoft-com:office:excel&quot;xmlns=&quot;http://www.w3.org/TR/REC-html40&quot;&gt;&lt;head&gt;&lt;style type=&quot;text/css&quot;&gt;&lt;!--tr{mso-height-source:auto;}td{black-space:nowrap;}.wc4590F88{black-space:nowrap;font-family:\u5B8B\u4F53;mso-number-format:General;font-size:auto;font-weight:auto;font-style:auto;text-decoration:auto;mso-background-source:auto;mso-pattern:auto;mso-color-source:auto;text-align:general;vertical-align:bottom;border-top:none;border-left:none;border-right:none;border-bottom:none;mso-protection:locked;}--&gt;&lt;/style&gt;&lt;/head&gt;&lt;body&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;&lt;x:ExcelWorkbook&gt;&lt;x:ExcelWorksheets&gt;&lt;x:ExcelWorksheet&gt;&lt;x:OWCVersion&gt;9.0.0.2710&lt;/x:OWCVersion&gt;&lt;x:Label Style='border-top:solid .5pt silver;border-left:solid .5pt silver;border-right:solid .5pt silver;border-bottom:solid .5pt silver'&gt;&lt;x:Caption&gt;Microsoft Office Spreadsheet&lt;/x:Caption&gt; &lt;/x:Label&gt;&lt;x:Name&gt;Sheet1&lt;/x:Name&gt;&lt;x:WorksheetOptions&gt;&lt;x:Selected/&gt;&lt;x:Height&gt;7620&lt;/x:Height&gt;&lt;x:Width&gt;15240&lt;/x:Width&gt;&lt;x:TopRowVisible&gt;0&lt;/x:TopRowVisible&gt;&lt;x:LeftColumnVisible&gt;0&lt;/x:LeftColumnVisible&gt; &lt;x:ProtectContents&gt;False&lt;/x:ProtectContents&gt; &lt;x:DefaultRowHeight&gt;210&lt;/x:DefaultRowHeight&gt; &lt;x:StandardWidth&gt;2389&lt;/x:StandardWidth&gt; &lt;/x:WorksheetOptions&gt; &lt;/x:ExcelWorksheet&gt;&lt;/x:ExcelWorksheets&gt; &lt;x:MaxHeight&gt;80%&lt;/x:MaxHeight&gt;&lt;x:MaxWidth&gt;80%&lt;/x:MaxWidth&gt;&lt;/x:ExcelWorkbook&gt;&lt;/xml&gt;&lt;![endif]--&gt;&lt;table class=wc4590F88 x:str&gt;&lt;col width=&quot;56&quot;&gt;&lt;tr height=&quot;14&quot;&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/body&gt;&lt;/html&gt;'> <param name='DataType' value='HTMLDATA'> <param name='AutoFit' value='0'><param name='DisplayColHeaders' value='-1'><param name='DisplayGridlines' value='-1'><param name='DisplayHorizontalScrollBar' value='-1'><param name='DisplayRowHeaders' value='-1'><param name='DisplayTitleBar' value='-1'><param name='DisplayToolbar' value='-1'><param name='DisplayVerticalScrollBar' value='-1'> <param name='EnableAutoCalculate' value='-1'> <param name='EnableEvents' value='-1'><param name='MoveAfterReturn' value='-1'><param name='MoveAfterReturnDirection' value='0'><param name='RightToLeft' value='0'><param name='ViewableRange' value='1:65536'></object>");
		break;
	case "nowdate":		
		var d = new Date();
		insertHTML(d.toLocaleDateString());
		break;
	case "nowtime":		
		var d = new Date();
		HTML(d.toLocaleTimeString());
		break;
	case "br":		
		insertHTML("<br>")
		break;
	case "code":		
		insertHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #CCCCCC; TABLE-LAYOUT: fixed"><tr><td bgcolor=#FDFDDF style="WORD-WRAP: break-word"><font style="color: #990000;font-weight:bold">\u4EE5\u4E0B\u662F\u4EE3\u7801\u7247\u6BB5\uFF1A</font><br>'+HTMLEncode(sel.text)+'</td></tr></table>');
		break;
	case "quote":		
		insertHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #CCCCCC; TABLE-LAYOUT: fixed"><tr><td bgcolor=#F3F3F3 style="WORD-WRAP: break-word"><font style="color: #990000;font-weight:bold">\u4EE5\u4E0B\u662F\u5F15\u7528\u7247\u6BB5\uFF1A</font><br>'+HTMLEncode(sel.text)+'</td></tr></table>');
		break;
	case "big":		
		insertHTML("<big>" + sel.text + "</big>");
		break;
	case "small":		
		insertHTML("<small>" + sel.text + "</small>");
		break;
	default:
		alert("\u9519\u8BEF\u53C2\u6570\u8C03\u7528\uFF01");
		break;
	}
	sel=null;
}

var borderShown = config.ShowBorder;
function showBorders() {
	if (!validateMode()) return;
	
	var allForms = HTMLEditor.document.body.getElementsByTagName("FORM");
	var allInputs = HTMLEditor.document.body.getElementsByTagName("INPUT");
	var allTables = HTMLEditor.document.body.getElementsByTagName("TABLE");
	var allLinks = HTMLEditor.document.body.getElementsByTagName("A");

	for (a=0; a < allForms.length; a++) {
		if (borderShown == "0") {
			allForms[a].runtimeStyle.border = "1px dotted #FF0000"
		} else {
			allForms[a].runtimeStyle.cssText = ""
		}
	}

	for (b=0; b < allInputs.length; b++) {
		if (borderShown == "0") {
			if (allInputs[b].type.toUpperCase() == "HIDDEN") {
				allInputs[b].runtimeStyle.border = "1px dashed #000000"
				allInputs[b].runtimeStyle.width = "15px"
				allInputs[b].runtimeStyle.height = "15px"
				allInputs[b].runtimeStyle.backgroundColor = "#FDADAD"
				allInputs[b].runtimeStyle.color = "#FDADAD"
			}
		} else {
			if (allInputs[b].type.toUpperCase() == "HIDDEN")
				allInputs[b].runtimeStyle.cssText = ""
		}
	}

	for (i=0; i < allTables.length; i++) {
			if (borderShown == "0") {
				allTables[i].runtimeStyle.border = "1px dotted #BFBFBF"
			} else {
				allTables[i].runtimeStyle.cssText = ""
			}

			allRows = allTables[i].rows
			for (y=0; y < allRows.length; y++) {
			 	allCellsInRow = allRows[y].cells
					for (x=0; x < allCellsInRow.length; x++) {
						if (borderShown == "0") {
							allCellsInRow[x].runtimeStyle.border = "1px dotted #BFBFBF"
						} else {
							allCellsInRow[x].runtimeStyle.cssText = ""
						}
					}
			}
	}

	for (a=0; a < allLinks.length; a++) {
		if (borderShown == "0") {
			if (allLinks[a].href.toUpperCase() == "") {
				allLinks[a].runtimeStyle.borderBottom = "1px dashed #000000"
			}
		} else {
			allLinks[a].runtimeStyle.cssText = ""
		}
	}

	if (borderShown == "0") {
		borderShown = "1"
	} else {
		borderShown = "0"
	}

	scrollUp()
}

function scrollUp() {
	HTMLEditor.scrollBy(0,0);
}

var nCurrZoomSize = 100;
var aZoomSize = new Array(10, 25, 50, 75, 100, 150, 200, 500);
function doZoom(size) {
	HTMLEditor.document.body.runtimeStyle.zoom = size + "%";
	nCurrZoomSize = size;
}

function spellCheck(){
	ShowDialog('Dialog/Spellcheck.htm', 300, 220, true)
}

function findReplace(){
	ShowDialog('Dialog/FindReplace.htm', 326, 182, true)
}

function absolutePosition(){
	var objReference	= null;
	var RangeType		= HTMLEditor.document.selection.type;
	if (RangeType != "Control") return;
	var selectedRange	= HTMLEditor.document.selection.createRange();
	for (var i=0; i<selectedRange.length; i++){
		objReference = selectedRange.item(i);
		if (objReference.style.position != 'absolute') {
			objReference.style.position='absolute';
		}else{
			objReference.style.position='static';
		}
	}
}

function zIndex(action){
	var objReference	= null;
	var RangeType		= HTMLEditor.document.selection.type;
	if (RangeType != "Control") return;
	var selectedRange	= HTMLEditor.document.selection.createRange();
	for (var i=0; i<selectedRange.length; i++){
		objReference = selectedRange.item(i);
		if (action=='forward'){
			objReference.style.zIndex  +=1;
		}else{
			objReference.style.zIndex  -=1;
		}
		objReference.style.position='absolute';
	}
}

function isControlSelected(tag){
	if (HTMLEditor.document.selection.type == "Control") {
		var oControlRange = HTMLEditor.document.selection.createRange();
		if (oControlRange(0).tagName.toUpperCase() == tag) {
			return true;
		}	
	}
	return false;
}

function sizeChange(size){
	if (!BrowserInfo.IsIE55OrMore){
		alert("HTMLEditor \u7F16\u8F91\u6A21\u5F0F\u9700\u8981 Internet Explorer 5.5 \u7248\u672C\u4EE5\u4E0A\u7684\u652F\u6301...");
		return false;
	}
	for (var i=0; i<parent.frames.length; i++){
		if (parent.frames[i].document==self.document){
			var obj=parent.frames[i].frameElement;
			var height = parseInt(obj.offsetHeight);
			if (height+size>=160){
				obj.height=height+size;
			}
			break;
		}
	}
}

function mapEdit(){
	if (!validateMode()) return;
	
	var b = false;
	if (HTMLEditor.document.selection.type == "Control") {
		var oControlRange = HTMLEditor.document.selection.createRange();
		if (oControlRange(0).tagName.toUpperCase() == "IMG") {
			b = true;
		}
	}
	if (!b){
		alert("\u70ED\u70B9\u94FE\u63A5\u53EA\u80FD\u5E94\u7528\u4E8E\u56FE\u7247...");
		return;
	}

	window.open("Dialog/Map.htm", 'mapEdit'+sLinkFieldName, 'toolbar=no,location=no,directories=no,status=not,menubar=no,scrollbars=no,resizable=yes,width=450,height=300');
}

function addUploadFile(originalFileName, saveFileName, savePathFileName){
	doInterfaceUpload(sLinkOriginalFileName, originalFileName);
	doInterfaceUpload(sLinkSaveFileName, saveFileName);
	doInterfaceUpload(sLinkSavePathFileName, savePathFileName);
}

function doInterfaceUpload(strLinkName, strValue){
	if (strValue=="") return;

	if (strLinkName){
		var objLinkUpload = parent.document.getElementsByName(strLinkName)[0];
		if (objLinkUpload){
			if (objLinkUpload.value!=""){
				objLinkUpload.value = objLinkUpload.value + "|";
			}
			objLinkUpload.value = objLinkUpload.value + strValue;
			objLinkUpload.fireEvent("onchange");
		}
	}
}

function splitTextField(objField, html) { 
	var strFieldName = objField.name;
	var objForm = objField.form;
	var objDocument = objField.document;
	objField.value = html;

	var FormLimit = 50000 ;

	for (var i=1;i<objDocument.getElementsByName(strFieldName).length;i++) {
		objDocument.getElementsByName(strFieldName)[i].value = "";
	}

	if (html.length > FormLimit) { 
		objField.value = html.substr(0, FormLimit) ;
		html = html.substr(FormLimit) ;

		while (html.length > 0) { 
			var objTEXTAREA = objDocument.createElement("TEXTAREA") ;
			objTEXTAREA.name = strFieldName ;
			objTEXTAREA.style.display = "none" ;
			objTEXTAREA.value = html.substr(0, FormLimit) ;
			objForm.appendChild(objTEXTAREA) ;

			html = html.substr(FormLimit) ;
		} 
	} 
} 

var sEventUploadAfter;
function remoteUpload(strEventUploadAfter) { 
	if (config.AutoRemote!="1") return;
	if (sCurrMode=="TEXT") return;
	
	sEventUploadAfter = strEventUploadAfter;
	var objField = document.getElementsByName("HTMLEditor_UploadText")[0];
	splitTextField(objField, getHTML());

	divProcessing.style.top = (document.body.clientHeight-parseFloat(divProcessing.style.height))/2;
	divProcessing.style.left = (document.body.clientWidth-parseFloat(divProcessing.style.width))/2;
	divProcessing.style.display = "";
	HTMLEditor_UploadForm.submit();
} 

function remoteUploadOK() {
	divProcessing.style.display = "none";
	if (oLinkField){
		if (sEventUploadAfter){
			eval("parent."+sEventUploadAfter);
		}
	}
}

var history = new Object;
history.data = [];
history.position = 0;
history.bookmark = [];

function saveHistory() {
	if (bEditMode){
		if (history.data[history.position] != HTMLEditor.document.body.innerHTML){
			var nBeginLen = history.data.length;
			var nPopLen = history.data.length - history.position;
			for (var i=1; i<nPopLen; i++){
				history.data.pop();
				history.bookmark.pop();
			}

			history.data[history.data.length] = HTMLEditor.document.body.innerHTML;

			if (HTMLEditor.document.selection.type != "Control"){
				history.bookmark[history.bookmark.length] = HTMLEditor.document.selection.createRange().getBookmark();
			} else {
				var oControl = HTMLEditor.document.selection.createRange();
				history.bookmark[history.bookmark.length] = oControl[0];
			}

			if (nBeginLen!=0){
				history.position++;
			}
		}
	}
}

function initHistory() {
	history.data.length = 0;
	history.bookmark.length = 0;
	history.position = 0;
}

function goHistory(value) {
	saveHistory();
	if (value == -1){
		if (history.position > 0){
			HTMLEditor.document.body.innerHTML = history.data[--history.position];
			setHistoryCursor();
		}
	} else {
		if (history.position < history.data.length -1){
			HTMLEditor.document.body.innerHTML = history.data[++history.position];
			setHistoryCursor();
		}
	}
}

function setHistoryCursor() {
	if (history.bookmark[history.position]){
		r = HTMLEditor.document.body.createTextRange()
		if (history.bookmark[history.position] != "[object]"){
			if (r.moveToBookmark(history.bookmark[history.position])){
				r.collapse(false);
				r.select();
			}
		}
	}
}

function doToolbar(){
	if (bEditMode){
		saveHistory();
	}
}


var sMenuHr = "<tr><td align=center valign=middle height=2><TABLE border=0 cellpadding=0 cellspacing=0 width=128 height=2><tr><td height=1 class=HrShadow></td></tr><tr><td height=1 class=HrHighLight></td></tr></TABLE></td></tr>";
var sMenu1 = "<TABLE border=0 cellpadding=0 cellspacing=0 class=Menu width=150><tr><td width=18 valign=bottom align=center style='background:url(Img/ContextMenu.gif);background-position:bottom;'></td><td width=132 class=RightBg><TABLE border=0 cellpadding=0 cellspacing=0>";
var sMenu2 = "</TABLE></td></tr></TABLE>";

var oPopupMenu = null;
if (BrowserInfo.IsIE55OrMore) {
	oPopupMenu = window.createPopup();
}


function getMenuRow(s_Disabled, s_Event, s_Image, s_Html) {
	var s_MenuRow = "";
	s_MenuRow = "<tr><td align=center valign=middle><TABLE border=0 cellpadding=0 cellspacing=0 width=132><tr " + s_Disabled + "><td valign=middle height=20 class=MouseOut onMouseOver=this.className='MouseOver'; onMouseOut=this.className='MouseOut';";
	if (s_Disabled == "") {
		s_MenuRow += " onclick=\"parent." + s_Event + ";parent.oPopupMenu.hide();\"";
	}
	s_MenuRow += ">";
	if (s_Image != "") {
		s_MenuRow += "&nbsp;<img border=0 src='Img/" + s_Image + "' width=20 height=20 align=absmiddle " + s_Disabled + ">&nbsp;";
	} else {
		s_MenuRow += "&nbsp;";
	}
	s_MenuRow += s_Html + "</td></tr></TABLE></td></tr>";
	return s_MenuRow;
}


function getFormatMenuRow(menu, html, image) {
	var s_Disabled = "";
	if (!HTMLEditor.document.queryCommandEnabled(menu)) {
		s_Disabled = "disabled";
	}
	var s_Event = "format('" + menu + "')";
	var s_Image = menu + ".gif";
	if (image) {
		s_Image = image;
	}
	return getMenuRow(s_Disabled, s_Event, s_Image, html);
}


function getTableMenuRow(what) {
	var s_Menu = "";
	var s_Disabled = "disabled";
	switch (what) {
	  case "TableInsert":
		if (!isTableSelected()) {
			s_Disabled = "";
		}
		s_Menu += getMenuRow(s_Disabled, "TableInsert()", "Tableinsert.gif", "\u63D2\u5165\u8868\u683C...");
		break;
	  case "TableProp":
		if (isTableSelected() || isCursorInTableCell()) {
			s_Disabled = "";
		}
		s_Menu += getMenuRow(s_Disabled, "TableProp()", "Tableprop.gif", "\u8868\u683C\u5C5E\u6027...");
		break;
	  case "TableCell":
		if (isCursorInTableCell()) {
			s_Disabled = "";
		}
		s_Menu += getMenuRow(s_Disabled, "TableCellProp()", "Tablecellprop.gif", "\u5355\u5143\u683C\u5C5E\u6027...");
		s_Menu += getMenuRow(s_Disabled, "TableCellSplit()", "Tablecellsplit.gif", "\u62C6\u5206\u5355\u5143\u683C...");
		s_Menu += sMenuHr;
		s_Menu += getMenuRow(s_Disabled, "TableRowProp()", "Tablerowprop.gif", "\u8868\u683C\u884C\u5C5E\u6027...");
		s_Menu += getMenuRow(s_Disabled, "TableRowInsertAbove()", "Tablerowinsertabove.gif", "\u63D2\u5165\u884C(\u5728\u4E0A\u65B9)");
		s_Menu += getMenuRow(s_Disabled, "TableRowInsertBelow()", "Tablerowinsertbelow.gif", "\u63D2\u5165\u884C(\u5728\u4E0B\u65B9)");
		s_Menu += getMenuRow(s_Disabled, "TableRowMerge()", "Tablerowmerge.gif", "\u5408\u5E76\u884C(\u5411\u4E0B\u65B9)");
		s_Menu += getMenuRow(s_Disabled, "TableRowSplit(2)", "Tablerowsplit.gif", "\u62C6\u5206\u884C");
		s_Menu += getMenuRow(s_Disabled, "TableRowDelete()", "Tablerowdelete.gif", "\u5220\u9664\u884C");
		s_Menu += sMenuHr;
		s_Menu += getMenuRow(s_Disabled, "TableColInsertLeft()", "Tablecolinsertleft.gif", "\u63D2\u5165\u5217(\u5728\u5DE6\u4FA7)");
		s_Menu += getMenuRow(s_Disabled, "TableColInsertRight()", "Tablecolinsertright.gif", "\u63D2\u5165\u5217(\u5728\u53F3\u4FA7)");
		s_Menu += getMenuRow(s_Disabled, "TableColMerge()", "Tablecolmerge.gif", "\u5408\u5E76\u5217(\u5411\u53F3\u4FA7)");
		s_Menu += getMenuRow(s_Disabled, "TableColSplit(2)", "Tablecolsplit.gif", "\u62C6\u5206\u5217");
		s_Menu += getMenuRow(s_Disabled, "TableColDelete()", "Tablecoldelete.gif", "\u5220\u9664\u5217");
		break;
	}
	return s_Menu;
}


function showContextMenu(event) {
	if (!bEditMode) {
		return false;
	}
	var width = 150;
	var height = 0;
	var lefter = event.clientX;
	var topper = event.clientY;
	var oPopDocument = oPopupMenu.document;
	var oPopBody = oPopupMenu.document.body;
	var sMenu = "";
	sMenu += getFormatMenuRow("Cut", "\u526A\u8D34");
	sMenu += getFormatMenuRow("Copy", "\u590D\u5236");
	sMenu += getFormatMenuRow("Paste", "\u7C98\u8D34");
	sMenu += getFormatMenuRow("Delete", "\u5220\u9664");
	sMenu += getFormatMenuRow("Selectall", "\u5168\u9009");
	sMenu += sMenuHr;
	height += 98;
	if (isCursorInTableCell()) {
		sMenu += getTableMenuRow("TableProp");
		sMenu += getTableMenuRow("TableCell");
		sMenu += sMenuHr;
		height += 286;
	}
	if (isControlSelected("TABLE")) {
		sMenu += getTableMenuRow("TableProp");
		sMenu += sMenuHr;
		height += 22;
	}
	if (isControlSelected("IMG")) {
		sMenu += getMenuRow("", "ShowDialog('Dialog/Img.htm', 350, 315, true)", "Img.gif", "\u56FE\u7247\u5C5E\u6027...");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "zIndex('forward')", "Forward.gif", "\u4E0A\u4E00\u5C42");
		sMenu += getMenuRow("", "zIndex('backward')", "Backward.gif", "\u4E0B\u4E00\u5C42");
		sMenu += sMenuHr;
		height += 64;
	}
	sMenu += getMenuRow("", "findReplace()", "Findreplace.gif", "\u67E5\u627E\u66FF\u6362...");
	height += 24;
	sMenu = sMenu1 + sMenu + sMenu2;
	oPopDocument.open();
	oPopDocument.write(config.StyleMenuHeader + sMenu);
	oPopDocument.close();
	height += 2;
	if (lefter + width > document.body.clientWidth) {
		lefter = lefter - width;
	}
	//if(topper+height > document.body.clientHeight) topper=topper-height;
	oPopupMenu.show(lefter, topper, width, height, HTMLEditor.document.body);
	return false;
}

function showToolMenu(menu) {
	if (!bEditMode) {
		return false;
	}
	var sMenu = "";
	var width = 150;
	var height = 0;
	var lefter = event.clientX;
	var leftoff = event.offsetX;
	var topper = event.clientY;
	var topoff = event.offsetY;
	var oPopDocument = oPopupMenu.document;
	var oPopBody = oPopupMenu.document.body;
	switch (menu) {
	  case "font":	
		sMenu += getFormatMenuRow("Bold", "\u7C97\u4F53", "Bold.gif");
		sMenu += getFormatMenuRow("Italic", "\u659C\u4F53", "Italic.gif");
		sMenu += getFormatMenuRow("Underline", "\u4E0B\u5212\u7EBF", "Underline.gif");
		sMenu += getFormatMenuRow("Strikethrough", "\u4E2D\u5212\u7EBF", "Strikethrough.gif");
		sMenu += sMenuHr;
		sMenu += getFormatMenuRow("Superscript", "\u4E0A\u6807", "Superscript.gif");
		sMenu += getFormatMenuRow("Subscript", "\u4E0B\u6807", "Subscript.gif");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "ShowDialog('Dialog/SelColor.htm?action=forecolor', 298, 265, true)", "Forecolor.gif", "\u5B57\u4F53\u989C\u8272");
		sMenu += getMenuRow("", "ShowDialog('Dialog/SelColor.htm?action=backcolor', 298, 265, true)", "Backcolor.gif", "\u5B57\u4F53\u80CC\u666F\u8272");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "insert('big')", "Tobig.gif", "\u5B57\u4F53\u589E\u5927");
		sMenu += getMenuRow("", "insert('small')", "Tosmall.gif", "\u5B57\u4F53\u51CF\u5C0F");
		height = 206;
		break;
	  case "paragraph":	
		sMenu += getMenuRow("", "insert('br')", "Br.gif", "\u63D2\u5165\u6362\u884C\u7B26");
		sMenu += getFormatMenuRow("Insertparagraph", "\u63D2\u5165\u6BB5\u843D", "Insertparagraph.gif");
		sMenu += sMenuHr;
		sMenu += getFormatMenuRow("JustifyLeft", "\u5DE6\u5BF9\u9F50", "Justifyleft.gif");
		sMenu += getFormatMenuRow("JustifyCenter", "\u5C45\u4E2D\u5BF9\u9F50", "Justifycenter.gif");
		sMenu += getFormatMenuRow("JustifyRight", "\u53F3\u5BF9\u9F50", "Justifyright.gif");
		sMenu += getFormatMenuRow("JustifyFull", "\u4E24\u7AEF\u5BF9\u9F50", "Justifyfull.gif");
		sMenu += sMenuHr;
		sMenu += getFormatMenuRow("Insertorderedlist", "\u7F16\u53F7", "Insertorderedlist.gif");
		sMenu += getFormatMenuRow("Insertunorderedlist", "\u9879\u76EE\u7B26\u53F7", "Insertunorderedlist.gif");
		sMenu += getFormatMenuRow("Indent", "\u589E\u52A0\u7F29\u8FDB\u91CF", "Indent.gif");
		sMenu += getFormatMenuRow("Outdent", "\u51CF\u5C11\u7F29\u8FDB\u91CF", "Outdent.gif");
		height = 204;
		break;
	  case "edit":		
		var s_Disabled = "";
		if (history.data.length <= 1 || history.position <= 0) {
			s_Disabled = "disabled";
		}
		sMenu += getMenuRow(s_Disabled, "goHistory(-1)", "Undo.gif", "\u64A4\u6D88");
		if (history.position >= history.data.length - 1 || history.data.length == 0) {
			s_Disabled = "disabled";
		}
		sMenu += getMenuRow(s_Disabled, "goHistory(1)", "Redo.gif", "\u6062\u590D");
		sMenu += sMenuHr;
		sMenu += getFormatMenuRow("Cut", "\u526A\u5207", "Cut.gif");
		sMenu += getFormatMenuRow("Copy", "\u590D\u5236", "Copy.gif");
		sMenu += getFormatMenuRow("Paste", "\u5E38\u89C4\u7C98\u8D34", "Paste.gif");
		sMenu += getMenuRow("", "PasteText()", "Pastetext.gif", "\u7EAF\u6587\u672C\u7C98\u8D34");
		sMenu += getMenuRow("", "PasteWord()", "Pasteword.gif", "\u4ECEWord\u4E2D\u7C98\u8D34");
		sMenu += sMenuHr;
		sMenu += getFormatMenuRow("Delete", "\u5220\u9664", "Delete.gif");
		sMenu += getFormatMenuRow("RemoveFormat", "\u5220\u9664\u6587\u5B57\u683C\u5F0F", "Removeformat.gif");
		sMenu += sMenuHr;
		sMenu += getFormatMenuRow("SelectAll", "\u5168\u90E8\u9009\u4E2D", "Selectall.gif");
		sMenu += getFormatMenuRow("Unselect", "\u53D6\u6D88\u9009\u62E9", "Unselect.gif");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "findReplace()", "Findreplace.gif", "\u66FF\u6362\u67E5\u627E");
		height = 248;
		break;
	  case "object":		
		sMenu += getMenuRow("", "ShowDialog('Dialog/SelColor.htm?action=bgcolor', 280, 250, true)", "Bgcolor.gif", "\u5BF9\u8C61\u80CC\u666F\u8272");
		sMenu += getMenuRow("", "ShowDialog('Dialog/BackImage.htm', 360, 210, true)", "Bgpic.gif", "\u80CC\u666F\u56FE\u7247");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "absolutePosition()", "Abspos.gif", "\u7EDD\u5BF9\u6216\u76F8\u5BF9\u4F4D\u7F6E");
		sMenu += getMenuRow("", "zIndex('forward')", "Forward.gif", "\u4E0A\u79FB\u4E00\u5C42");
		sMenu += getMenuRow("", "zIndex('backward')", "Backward.gif", "\u4E0B\u79FB\u4E00\u5C42");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "showBorders()", "Showborders.gif", "\u663E\u793A\u9690\u85CF\u6307\u5BFC\u65B9\u9488");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "insert('quote')", "Quote.gif", "\u5F15\u7528\u6837\u5F0F");
		sMenu += getMenuRow("", "insert('code')", "Code.gif", "\u4EE3\u7801\u6837\u5F0F");
		height = 166;
		break;
	  case "component":	
		sMenu += getMenuRow("", "ShowDialog('Dialog/Img.htm', 350, 310, true)", "Img.gif", "\u63D2\u5165\u6216\u4FEE\u6539\u56FE\u7247");
		sMenu += getMenuRow("", "ShowDialog('Dialog/Flash.htm', 350, 200, true)", "Flash.gif", "\u63D2\u5165Flash\u52A8\u753B");
		sMenu += getMenuRow("", "ShowDialog('Dialog/Media.htm', 360, 210, true)", "Media.gif", "\u63D2\u5165\u81EA\u52A8\u64AD\u653E\u5A92\u4F53");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "ShowDialog('Dialog/Fieldset.htm', 370, 200, true)", "Fieldset.gif", "\u63D2\u5165\u4FEE\u6539\u680F\u76EE\u6846");
		sMenu += getMenuRow("", "ShowDialog('Dialog/Iframe.htm', 360, 220, true)", "Iframe.gif", "\u63D2\u5165\u6216\u4FEE\u6539\u7F51\u9875\u5E27");
		sMenu += getFormatMenuRow("InsertHorizontalRule", "\u63D2\u5165\u6C34\u5E73\u5C3A", "Inserthorizontalrule.gif");
		sMenu += getMenuRow("", "ShowDialog('Dialog/Marquee.htm', 395, 170, true)", "Marquee.gif", "\u63D2\u5165\u6216\u4FEE\u6539\u5B57\u5E55");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "createLink()", "Createlink.gif", "\u63D2\u5165\u6216\u4FEE\u6539\u8D85\u94FE\u63A5");
		sMenu += getMenuRow("", "ShowDialog('Dialog/Anchor.htm', 280, 250, true)", "Anchor.gif", "\u4E66\u7B7E\u7BA1\u7406");
		sMenu += getMenuRow("", "mapEdit()", "Map.gif", "\u56FE\u5F62\u70ED\u70B9\u94FE\u63A5");
		sMenu += getFormatMenuRow("UnLink", "\u53D6\u6D88\u8D85\u94FE\u63A5\u6216\u6807\u7B7E", "Unlink.gif");
		height = 224;
		break;
	  case "tool":		
		sMenu += getMenuRow("", "format('Refresh')", "Refresh.gif", "\u65B0\u5EFA");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "ShowDialog('Dialog/Symbol.htm', 360, 230, true)", "Symbol.gif", "\u63D2\u5165\u7279\u6B8A\u5B57\u7B26");
		sMenu += getMenuRow("", "insert('Excel')", "Excel.gif", "\u63D2\u5165Exc\u8868\u683C");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "insert('Nowtime')", "Time.gif", "\u63D2\u5165\u5F53\u524D\u65F6\u95F4");
		sMenu += getMenuRow("", "insert('Nowdate')", "Date.gif", "\u63D2\u5165\u5F53\u524D\u65E5\u671F");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "setMode('EDIT')", "Modeeditbtn.gif", "\u7F16\u8F91\u6A21\u5F0F");
		sMenu += getMenuRow("", "setMode('CODE')", "Modecodebtn.gif", "\u4EE3\u7801\u6A21\u5F0F");
		sMenu += getMenuRow("", "setMode('TEXT')", "Modetextbtn.gif", "\u6587\u672C\u6A21\u5F0F");
		sMenu += getMenuRow("", "setMode('VIEW')", "Modeviewbtn.gif", "\u9884\u89C8\u6A21\u5F0F");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "sizeChange(160)", "Sizeplus.gif", "\u589E\u8BBE\u7F16\u8F91\u533A");
		sMenu += getMenuRow("", "sizeChange(-160)", "Sizeminus.gif", "\u51CF\u5C11\u7F16\u8F91\u533A");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "format('Print')", "Print.gif", "\u6253\u5370");
		height = 250;
		break;
	  case "file":		
		sMenu += getMenuRow("", "format('Refresh')", "Refresh.gif", "\xd0\xc2\xbd\xa8");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "setMode('EDIT')", "Modeeditbtn.gif", "\xb1\xe0\xbc\xc4\xa3\xca\xbd");
		sMenu += getMenuRow("", "setMode('CODE')", "Modecodebtn.gif", "\xb4\xfa\xc2\xeb\xc4\xa3\xca\xbd");
		sMenu += getMenuRow("", "setMode('TEXT')", "Modetextbtn.gif", "\xce\xc4\xb1\xbe\xc4\xa3\xca\xbd");
		sMenu += getMenuRow("", "setMode('VIEW')", "Modeviewbtn.gif", "\xd4\xa4\xc0\xc0\xc4\xa3\xca\xbd");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "sizeChange(160)", "Sizeplus.gif", "\xd4\xf6\xb8\xdf\xb1\xe0\xbc\xc7\xf8");
		sMenu += getMenuRow("", "sizeChange(-160)", "Sizeminus.gif", "\xbc\xf5\xd0\xa1\xb1\xe0\xbc\xc7\xf8");
		sMenu += sMenuHr;
		sMenu += getMenuRow("", "format('Print')", "Print.gif", "\xb4\xf2\xd3\xa1");
		height = 228;
		break;
	  case "table":		
		sMenu += getTableMenuRow("TableInsert");
		sMenu += getTableMenuRow("TableProp");
		sMenu += sMenuHr;
		sMenu += getTableMenuRow("TableCell");
		height = 306;
		break;
	  case "form":	
		sMenu += getFormatMenuRow("InsertInputText", "\u63D2\u5165\u8F93\u5165\u6846", "Formtext.gif");
		sMenu += getFormatMenuRow("InsertTextArea", "\u8868\u683C\u8F93\u5165\u533A", "Formtextarea.gif");
		sMenu += getFormatMenuRow("InsertInputRadio", "\u63D2\u5165\u5355\u9009\u94AE", "Formradio.gif");
		sMenu += getFormatMenuRow("InsertInputCheckbox", "\u63D2\u5165\u590D\u9009\u94AE", "Formcheckbox.gif");
		sMenu += getFormatMenuRow("InsertSelectDropdown", "\u63D2\u5165\u4E0B\u62C9\u6846", "Formdropdown.gif");
		sMenu += getFormatMenuRow("InsertButton", "\u63D2\u5165\u6309\u94AE", "Formbutton.gif");
		height = 120;
		break;
	  case "zoom":	
		for (var i = 0; i < aZoomSize.length; i++) {
			if (aZoomSize[i] == nCurrZoomSize) {
				sMenu += getMenuRow("", "doZoom(" + aZoomSize[i] + ")", "Checked.gif", aZoomSize[i] + "%");
			} else {
				sMenu += getMenuRow("", "doZoom(" + aZoomSize[i] + ")", "Space.gif", aZoomSize[i] + "%");
			}
			height += 20;
		}
		break;
	}
	sMenu = sMenu1 + sMenu + sMenu2;
	oPopDocument.open();
	oPopDocument.write(config.StyleMenuHeader + sMenu);
	oPopDocument.close();
	height += 2;
	if (lefter + width > document.body.clientWidth) {
		lefter = lefter - width;
	}
	oPopupMenu.show(lefter - leftoff - 2, topper - topoff + 22, width, height, document.body);
	return false;
}


var selectedTD
var selectedTR
var selectedTBODY
var selectedTable


function TableInsert(){
	if (!isTableSelected()){
		ShowDialog('Dialog/Table.htm', 370, 394, true);
	}
}


function TableProp(){
	if (isTableSelected()||isCursorInTableCell()){
		ShowDialog('Dialog/Table.htm?action=modify', 370, 394, true);
	}
}


function TableCellProp(){
	if (isCursorInTableCell()){
		ShowDialog('Dialog/TableCell.htm', 370, 314, true);
	}
}


function TableCellSplit(){
	if (isCursorInTableCell()){
		ShowDialog('Dialog/Tablecellsplit.htm', 210, 168, true);
	}
}


function TableRowProp(){
	if (isCursorInTableCell()){
		ShowDialog('Dialog/TableCell.htm?action=row', 373, 310, true);
	}
}


function TableRowInsertAbove() {

	if (isCursorInTableCell()){
		var numCols = 0

		allCells = selectedTR.cells
		for (var i=0;i<allCells.length;i++) {
		 	numCols = numCols + allCells[i].getAttribute('colSpan')
		}

		var newTR = selectedTable.insertRow(selectedTR.rowIndex)
	
		for (i = 0; i < numCols; i++) {
		 	newTD = newTR.insertCell()
			newTD.innerHTML = "&nbsp;"

			if (borderShown == "yes") {
				newTD.runtimeStyle.border = "1px dotted #BFBFBF"
			}
		}
	}	
}


function TableRowInsertBelow() {

	if (isCursorInTableCell()){
		
		var numCols = 0

		allCells = selectedTR.cells
		for (var i=0;i<allCells.length;i++) {
		 	numCols = numCols + allCells[i].getAttribute('colSpan')
		}

		var newTR = selectedTable.insertRow(selectedTR.rowIndex+1)

		for (i = 0; i < numCols; i++) {
		 	newTD = newTR.insertCell()
			newTD.innerHTML = "&nbsp;"
			
			if (borderShown == "yes") {
				newTD.runtimeStyle.border = "1px dotted #BFBFBF"
			}
		}
	}
}


function TableRowMerge() {
	if (isCursorInTableCell()) {

		var rowSpanTD = selectedTD.getAttribute('rowSpan')
		allRows = selectedTable.rows
		if (selectedTR.rowIndex +1 != allRows.length) {

			var allCellsInNextRow = allRows[selectedTR.rowIndex+selectedTD.rowSpan].cells
			var addRowSpan = allCellsInNextRow[selectedTD.cellIndex].getAttribute('rowSpan')
			var moveTo = selectedTD.rowSpan

			if (!addRowSpan) addRowSpan = 1;

			selectedTD.rowSpan = selectedTD.rowSpan + addRowSpan
			allRows[selectedTR.rowIndex + moveTo].deleteCell(selectedTD.cellIndex)
		}
	}

}


function TableRowSplit(nRows){
	if (!isCursorInTableCell()) return;
	if (nRows<2) return;

	var addRows = nRows - 1;
	var addRowsNoSpan = addRows;

	var nsLeftColSpan = 0;
	for (var i=0; i<selectedTD.cellIndex; i++){
		nsLeftColSpan += selectedTR.cells[i].colSpan;
	}

	var allRows = selectedTable.rows;


	while (selectedTD.rowSpan > 1 && addRowsNoSpan > 0){
		var nextRow = allRows[selectedTR.rowIndex+selectedTD.rowSpan-1];
		selectedTD.rowSpan -= 1;

		var ncLeftColSpan = 0;
		var position = -1;
		for (var n=0; n<nextRow.cells.length; n++){
			ncLeftColSpan += nextRow.cells[n].getAttribute('colSpan');
			if (ncLeftColSpan>nsLeftColSpan){
				position = n;
				break;
			}
		}

		var newTD=nextRow.insertCell(position);
		newTD.innerHTML = "&nbsp;";

		if (borderShown == "yes") {
			newTD.runtimeStyle.border = "1px dotted #BFBFBF";
		}
			
		addRowsNoSpan -= 1;
	}


	for (var n=0; n<addRowsNoSpan; n++){
		var numCols = 0

		allCells = selectedTR.cells
		for (var i=0;i<allCells.length;i++) {
			numCols = numCols + allCells[i].getAttribute('colSpan')
		}

		var newTR = selectedTable.insertRow(selectedTR.rowIndex+1)


		for (var j=0; j<selectedTR.rowIndex; j++){
			for (var k=0; k<allRows[j].cells.length; k++){
				if ((allRows[j].cells[k].rowSpan>1)&&(allRows[j].cells[k].rowSpan>=selectedTR.rowIndex-allRows[j].rowIndex+1)){
					allRows[j].cells[k].rowSpan += 1;
				}
			}
		}

		for (i = 0; i < allCells.length; i++) {
			if (i!=selectedTD.cellIndex){
				selectedTR.cells[i].rowSpan += 1;
			}else{
				newTD = newTR.insertCell();
				newTD.colSpan = selectedTD.colSpan;
				newTD.innerHTML = "&nbsp;";

				if (borderShown == "yes") {
					newTD.runtimeStyle.border = "1px dotted #BFBFBF";
				}
			}
		}
	}

}


function TableRowDelete() {
	if (isCursorInTableCell()) {
		selectedTable.deleteRow(selectedTR.rowIndex)
	}
}


function TableColInsertLeft() {
   	if (isCursorInTableCell()) {
		moveFromEnd = (selectedTR.cells.length-1) - (selectedTD.cellIndex)
		allRows = selectedTable.rows
		for (i=0;i<allRows.length;i++) {
			rowCount = allRows[i].cells.length - 1
			position = rowCount - moveFromEnd
			if (position < 0) {
				position = 0
			}
			newCell = allRows[i].insertCell(position)
			newCell.innerHTML = "&nbsp;"

			if (borderShown == "yes") {
				newCell.runtimeStyle.border = "1px dotted #BFBFBF"
			}
		}
   	}
}


function TableColInsertRight() {
   	if (isCursorInTableCell()) {
		moveFromEnd = (selectedTR.cells.length-1) - (selectedTD.cellIndex)
		allRows = selectedTable.rows
		for (i=0;i<allRows.length;i++) {
			rowCount = allRows[i].cells.length - 1
			position = rowCount - moveFromEnd
			if (position < 0) {
				position = 0
			}
			newCell = allRows[i].insertCell(position+1)
			newCell.innerHTML = "&nbsp;"

			if (borderShown == "yes") {
				newCell.runtimeStyle.border = "1px dotted #BFBFBF"
			}
		}	
   	}
}


function TableColMerge() {
	if (isCursorInTableCell()) {

		var colSpanTD = selectedTD.getAttribute('colSpan')
		allCells = selectedTR.cells

		if (selectedTD.cellIndex + 1 != selectedTR.cells.length) {
			var addColspan = allCells[selectedTD.cellIndex+1].getAttribute('colSpan')
			selectedTD.colSpan = colSpanTD + addColspan
			selectedTR.deleteCell(selectedTD.cellIndex+1)
		}	
	}

}

function TableColDelete() {
   	if (isCursorInTableCell()) {
		moveFromEnd = (selectedTR.cells.length-1) - (selectedTD.cellIndex)
		allRows = selectedTable.rows
		for (var i=0;i<allRows.length;i++) {
			endOfRow = allRows[i].cells.length - 1
			position = endOfRow - moveFromEnd
			if (position < 0) {
				position = 0
			}
				

			allCellsInRow = allRows[i].cells
				
			if (allCellsInRow[position].colSpan > 1) {
				allCellsInRow[position].colSpan = allCellsInRow[position].colSpan - 1
			} else { 
				allRows[i].deleteCell(position)
			}

		}

	}

}


function TableColSplit(nCols){
	if (!isCursorInTableCell()) return;
	if (nCols<2) return;

	var addCols = nCols - 1;
	var addColsNoSpan = addCols;
	var newCell;

	var nsLeftColSpan = 0;
	var nsLeftRowSpanMoreOne = 0;
	for (var i=0; i<selectedTD.cellIndex; i++){
		nsLeftColSpan += selectedTR.cells[i].colSpan;
		if (selectedTR.cells[i].rowSpan > 1){
			nsLeftRowSpanMoreOne += 1;
		}
	}

	var allRows = selectedTable.rows

	while (selectedTD.colSpan > 1 && addColsNoSpan > 0) {
		newCell = selectedTR.insertCell(selectedTD.cellIndex+1);
		newCell.innerHTML = "&nbsp;"
		if (borderShown == "yes") {
			newCell.runtimeStyle.border = "1px dotted #BFBFBF"
		}
		selectedTD.colSpan -= 1;
		addColsNoSpan -= 1;
	}
	
	for (i=0;i<allRows.length;i++) {
		var ncLeftColSpan = 0;
		var position = -1;
		for (var n=0; n<allRows[i].cells.length; n++){
			ncLeftColSpan += allRows[i].cells[n].getAttribute('colSpan');
			if (ncLeftColSpan+nsLeftRowSpanMoreOne>nsLeftColSpan){
				position = n;
				break;
			}
		}
		
		if (selectedTR.rowIndex!=i){
			if (position!=-1){
				allRows[i].cells[position+nsLeftRowSpanMoreOne].colSpan += addColsNoSpan;
			}
		}else{
			for (var n=0; n<addColsNoSpan; n++){
				newCell = allRows[i].insertCell(selectedTD.cellIndex+1)
				newCell.innerHTML = "&nbsp;"
				newCell.rowSpan = selectedTD.rowSpan;

				if (borderShown == "yes") {
					newCell.runtimeStyle.border = "1px dotted #BFBFBF"
				}
			}
		}
	}
}


function isTableSelected() {
	if (HTMLEditor.document.selection.type == "Control") {
		var oControlRange = HTMLEditor.document.selection.createRange();
		if (oControlRange(0).tagName.toUpperCase() == "TABLE") {
			selectedTable = HTMLEditor.document.selection.createRange()(0);
			return true;
		}	
	}
} 


function isCursorInTableCell() {
	if (HTMLEditor.document.selection.type != "Control") {
		var elem = HTMLEditor.document.selection.createRange().parentElement()
		while (elem.tagName.toUpperCase() != "TD" && elem.tagName.toUpperCase() != "TH"){
			elem = elem.parentElement
			if (elem == null)
                break
		}
		if (elem) {
			selectedTD = elem
			selectedTR = selectedTD.parentElement
			selectedTBODY =  selectedTR.parentElement
			selectedTable = selectedTBODY.parentElement
			return true
		}
	}
}
</script>
	</head>


	<!-- 论坛正文 -->
	<body bgcolor=#ffffff alink=#333333 vlink=#333333 link=#333333
		topmargin=0 onload="setMode('EDIT')">
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
						&nbsp;&nbsp;
						<a href=${url}>『 ${boardInfo } 』</a>
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<img src=pic/bar.gif border=0 width=15 height=15>
						<img src=pic/openfold.gif border=0>
						&nbsp;&nbsp;&nbsp;&nbsp;发布新贴
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		<br>

		<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
			<tr>
				<td bgcolor="#0099cc" valign=middle width=1 height=24>
				</td>
				<td bgcolor="#99ccff" colspan=2 align=left valign=middle width=*>
					<table cellpadding=0 cellspacing=1 border=0 width="100%">
						<tr>
							<td align=left valign=middle bgcolor="#99ccff">
								<font color="#000000">&nbsp; </font><span class="t">发表新贴</span>
							</td>
						</tr>
					</table>
				</td>
				<td bgcolor="&tableBackColor&" valign=middle width=1 height=24>
				</td>
			</tr>
		</table>
		<table cellpadding=0 cellspacing=0 border=0 width=""
			95%"" bgcolor="&tableBackColor&" align=center>
			<tr>
				<td height=1>
				</td>
			</tr>
		</table>

		<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
			<tr>
				<td bgcolor="#0099cc" valign=middle width=1 height=24>
				</td>
				<td bgcolor="#f2f8ff">
					<table width="100%" cellpadding=4 cellspacing=0>
						<tr>
							<td bgcolor="#f2f8ff" valign=top width="20%">
								<img src="" width=0 height=4>
								<BR>
								<BR>
							</td>
							<td bgcolor=#f2f8ff width="100%" height=100%>

								<table width="100%" border="0" height="500">
									<tr>
										<td>
											<table border=0 cellpadding=0 cellspacing=0 width="100%"
												height="100%">
												<tr bgcolor="#F2F8FF">
													<td>
														<table width="67%" border=0 cellpadding=0 cellspacing=0
															class='Toolbar' id='HTMLEditor_Toolbar'
															name="HTMLEditor_Toolbar">
															<tr>
																<form name="frmTmp">
																<td>
																	请输入标题:
																	<input name="title" type="text" id="title" />
																	帖子类型
																	<select name="type" id="type">
																		<option value="原创">
																			原创
																		</option>
																		<option value="转贴">
																			转贴
																		</option>
																		<option value="讨论">
																			讨论
																		</option>
																		<option value="提问">
																			提问
																		</option>
																		<option value="杂谈">
																			杂谈
																		</option>
																		<option value="其它">
																			其它
																		</option>
																	</select>
																</td>
															</tr>
															</form>
															<tr>
																<td>
																	<div class=yToolbar>
																		<div class="Btn" title="编辑菜单"
																			onClick="showToolMenu('edit')">
																			<img class="Ico" src="Img/Editmenu.gif">
																		</div>
																		<div class="Btn" title="复制" onClick="format('copy')">
																			<img class="Ico" src="Img/Copy.gif">
																		</div>
																		<div class="Btn" title="剪切" onClick="format('cut')">
																			<img class="Ico" src="Img/Cut.gif">
																		</div>
																		<div class="Btn" title="常规粘贴"
																			onClick="format('paste')">
																			<img class="Ico" src="Img/Paste.gif">
																		</div>
																		<div class="Btn" title="撤消" onClick="goHistory(-1)">
																			<img class="Ico" src="Img/Undo.gif">
																		</div>
																		<div class="Btn" title="恢复" onClick="goHistory(1)">
																			<img class="Ico" src="Img/Redo.gif">
																		</div>
																		<div class="Btn" title="查找替换" onClick="findReplace()">
																			<img class="Ico" src="Img/Findreplace.gif">
																		</div>
																		<div class="Btn" title="全部选中"
																			onClick="format('SelectAll')">
																			<img class="Ico" src="Img/Selectall.gif">
																		</div>
																		<div class="Btn" title="删除文字格式"
																			onClick="format('RemoveFormat')">
																			<img class="Ico" src="Img/Removeformat.gif">
																		</div>
																		<div class="Btn" title="删除" onClick="format('delete')">
																			<img class="Ico" src="Img/Delete.gif">
																		</div>
																		<div class="Btn" title="插入或修改超级链接"
																			onClick="createLink()">
																			<img class="Ico" src="Img/Createlink.gif">
																		</div>
																		<div class="Btn" title="插入或修改图片"
																			onClick="ShowDialog('Dialog/Img.htm', 360, 310, true)">
																			<img class="Ico" src="Img/Img.gif">
																		</div>
																		<div class="Btn" title="对象效果菜单"
																			onClick="showToolMenu('object')">
																			<img class="Ico" src="Img/Objectmenu.gif">
																		</div>
																		<div class="Btn" title="插入 Flash 动画"
																			onClick="ShowDialog('Dialog/Flash.htm', 360, 200, true)">
																			<img class="Ico" src="Img/Flash.gif">
																		</div>
																		<div class="Btn" title="插入自动播放的媒体文件"
																			onClick="ShowDialog('Dialog/Media.htm', 360, 210, true)">
																			<img class="Ico" src="Img/Media.gif">
																		</div>
																		<div class="Btn" title="插入水平尺"
																			onClick="format('InsertHorizontalRule')">
																			<img class="Ico" src="Img/Inserthorizontalrule.gif">
																		</div>
																		<div class="Btn" title="插入或修改字幕"
																			onClick="ShowDialog('Dialog/Marquee.htm', 395, 170, true)">
																			<img class="Ico" src="Img/Marquee.gif">
																		</div>
																		<div class="Btn" title="组件菜单"
																			onClick="showToolMenu('component')">
																			<img class="Ico" src="Img/Componentmenu.gif">
																		</div>
																		<div class="Btn" title="插入表格" onClick="TableInsert()">
																			<img class="Ico" src="Img/Tableinsert.gif">
																		</div>
																		<div class="Btn" title="表格菜单"
																			onClick="showToolMenu('table')">
																			<img class="Ico" src="Img/Tablemenu.gif">
																		</div>
																		<div class="Btn" title="表单菜单"
																			onClick="showToolMenu('form')">
																			<img class="Ico" src="Img/Formmenu.gif">
																		</div>
																		<div class="Btn" title="工具菜单"
																			onClick="showToolMenu('tool')">
																			<img class="Ico" src="Img/Toolmenu.gif">
																		</div>
																	</div>
																</td>
															</tr>
															<tr>
																<td bgcolor="#F2F8FF">
																	<div class=yToolbar>
																		<select name="select" class="TBGen" style="width: 85;"
																			onChange="format('FormatBlock',this[this.selectedIndex].value);this.selectedIndex=0">
																			<option selected>
																				段落样式
																			</option>
																			<option value="&lt;P&gt;">
																				普通
																			</option>
																			<option value="&lt;H1&gt;">
																				标题一
																			</option>
																			<option value="&lt;H2&gt;">
																				标题二
																			</option>
																			<option value="&lt;H3&gt;">
																				标题三
																			</option>
																			<option value="&lt;H4&gt;">
																				标题四
																			</option>
																			<option value="&lt;H5&gt;">
																				标题五
																			</option>
																			<option value="&lt;H6&gt;">
																				标题六
																			</option>
																			<option value="&lt;p&gt;">
																				段落
																			</option>
																			<option value="&lt;dd&gt;">
																				定义
																			</option>
																			<option value="&lt;dt&gt;">
																				术语定义
																			</option>
																			<option value="&lt;dir&gt;">
																				目录列表
																			</option>
																			<option value="&lt;menu&gt;">
																				菜单列表
																			</option>
																			<option value="&lt;PRE&gt;">
																				已编排格式
																			</option>
																		</select>
																		<select name="select2" class="TBGen"
																			style="width: 100;"
																			onChange="format('fontname',this[this.selectedIndex].value);this.selectedIndex=0">
																			<option selected>
																				字体
																			</option>
																			<option value="宋体">
																				宋体
																			</option>
																			<option value="黑体">
																				黑体
																			</option>
																			<option value="楷体_GB2312">
																				楷体
																			</option>
																			<option value="仿宋_GB2312">
																				仿宋
																			</option>
																			<option value="隶书">
																				隶书
																			</option>
																			<option value="幼圆">
																				幼圆
																			</option>
																			<option value="Arial">
																				Arial
																			</option>
																			<option value="Arial Black">
																				Arial Black
																			</option>
																			<option value="Arial Narrow">
																				Arial Narrow
																			</option>
																			<option value="Brush Script	MT">
																				Brush Script MT
																			</option>
																			<option value="Century Gothic">
																				Century Gothic
																			</option>
																			<option value="Comic Sans MS">
																				Comic Sans MS
																			</option>
																			<option value="Courier">
																				Courier
																			</option>
																			<option value="Courier New">
																				Courier New
																			</option>
																			<option value="MS Sans Serif">
																				MS Sans Serif
																			</option>
																			<option value="Script">
																				Script
																			</option>
																			<option value="System">
																				System
																			</option>
																			<option value="Times New Roman">
																				Times New Roman
																			</option>
																			<option value="Verdana">
																				Verdana
																			</option>
																			<option value="Wide Latin">
																				Wide Latin
																			</option>
																			<option value="Wingdings">
																				Wingdings
																			</option>
																		</select>
																		<select name="select2" class="TBGen"
																			onChange="format('fontsize',this[this.selectedIndex].value);this.selectedIndex=0">
																			<option selected>
																				字号
																			</option>
																			<option value="1">
																				一号
																			</option>
																			<option value="2">
																				二号
																			</option>
																			<option value="3">
																				三号
																			</option>
																			<option value="4">
																				四号
																			</option>
																			<option value="5">
																				五号
																			</option>
																			<option value="6">
																				六号
																			</option>
																			<option value="7">
																				七号
																			</option>
																		</select>
																		<div class="Btn" title="字体菜单"
																			onClick="showToolMenu('font')">
																			<img class="Ico" src="Img/Fontmenu.gif">
																		</div>
																		<div class="Btn" title="字体颜色"
																			onClick="ShowDialog('Dialog/SelColor.htm?action=forecolor', 298, 265, true)">
																			<img class="Ico" src="Img/Forecolor.gif">
																		</div>
																		<div class="Btn" title="字体背景颜色"
																			onClick="ShowDialog('Dialog/SelColor.htm?action=backcolor', 298, 265, true)">
																			<img class="Ico" src="Img/Backcolor.gif">
																		</div>
																		<div class="Btn" title="对象背景颜色"
																			onClick="ShowDialog('Dialog/SelColor.htm?action=bgcolor', 298, 265, true)">
																			<img class="Ico" src="Img/Bgcolor.gif">
																		</div>
																		<div class="Btn" title="段落菜单"
																			onClick="showToolMenu('paragraph')">
																			<img class="Ico" src="Img/Paragraphmenu.gif">
																		</div>
																		<div class="Btn" title="减小编辑区"
																			onClick="sizeChange(-200)">
																			<img class="Ico" src="Img/Sizeminus.gif">
																		</div>
																		<div class="Btn" title="增高编辑区"
																			onClick="sizeChange(200)">
																			<img class="Ico" src="Img/Sizeplus.gif">
																		</div>
																		<div class="Btn" title="编辑模式"
																			onClick="setMode('EDIT')">
																			<img class="Ico" src="Img/Modeeditbtn.gif">
																		</div>
																		<div class="Btn" title="代码模式"
																			onClick="setMode('CODE')">
																			<img class="Ico" src="Img/Modecodebtn.gif">
																		</div>
																		<div class="Btn" title="文本模式"
																			onClick="setMode('TEXT')">
																			<img class="Ico" src="Img/Modetextbtn.gif">
																		</div>
																		<div class="Btn" title="预览模式"
																			onClick="setMode('VIEW')">
																			<img class="Ico" src="Img/Modeviewbtn.gif">
																		</div>
																	</div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td height="100%">
														<table border=0 cellpadding=0 cellspacing=0 width="100%"
															height="100%">
															<tr>
																<td height="100%">
																	<input name="hidden" type="hidden" id="ContentEdit"
																		value="">
																	<input name="hidden" type="hidden" id="ModeEdit"
																		value="">
																	<input name="hidden" type="hidden" id="ContentLoad"
																		value="">
																	<input name="hidden" type="hidden" id="ContentFlag"
																		value="0">
																	<form action="bbs?path=add" name="frmAdd" method="post"
																		onsubmit="subchk()">
																		<iframe id="HTMLEditor" width="500" height="80%"
																			scrolling="yes">
																		</iframe>
																		<p align="left">
																			请选择心情：
																			<img src="pic/face3.gif" width="15" height="15">
																			<input name="heart" type="radio" value="face3.gif"
																				checked>
																			<img src="pic/face6.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face6.gif">
																			<img src="pic/face7.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face7.gif">
																			<img src="pic/face8.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face3.gif">
																			<img src="pic/face9.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face9.gif">
																			<img src="pic/face10.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face10.gif">
																			<img src="pic/face11.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face11.gif">
																			<img src="pic/face12.gif" width="15" height="15">
																			<input type="radio" name="heart" value="face12.gif">
																		</p>
																		<p align="center">
																			<input name="enter" type="submit" value="　提 交　">
																		</p>
																		<input type="hidden" name="ftype">
																		<input type="hidden" name="ftitle">
																		<input type="hidden" name="content">
																		<input type="hidden" name="boardid" value="${boardid}">
																		<input type="hidden" name="parentid"
																			value="${parentid}">
																		<input type="hidden" name="child" value="0">
																		<input type="hidden" name="isvote" value="0">
																	</form>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>

							</td>
						</tr>
					</table>
				</td>
				<td bgcolor=#0099cc valign=middle width=1 height=24>
				</td>
			</tr>
		</table>
	</body>
	<%@ include file="inc/foot.jsp"%>
</html>

