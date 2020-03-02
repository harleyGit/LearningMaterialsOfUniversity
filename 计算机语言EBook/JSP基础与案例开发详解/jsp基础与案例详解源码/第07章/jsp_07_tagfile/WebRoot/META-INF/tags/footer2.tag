<!-- tag指令定义标签文件自身的一些信息 -->
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<!-- attribute指令声明本标签文件所需要的属性 -->
<%@ attribute name="siteName" required="true" %>
<%@ attribute name="year" type="java.lang.Integer"%>
<div style="font-size: 13px;text-align:center;line-height: 1.5;" id="footer">
  <div id="copyright">
    <hr/>
  <a href="javascript:void(null)" target="_self" onClick="">加入收藏</a> - 
  <a href="javascript:void(null)" target="_self" onClick="">设为首页</a> - 
  <a href="javascript:void(null)" target="_blank">隐私保护</a> - 
  <a href="javascript:void(null)" target="_blank">联系我们</a> - 
  <a href="javascript:void(null)" target="_blank">获得帮助</a> - 
  <a href="javascript:void(null)" target="_blank">投诉举报</a> 
    <br/>${siteName}——为Java人的成长添动力
    <BR>版权所有&copy;${year}，
  <a href="http://blog.csdn.net/qjyong" target="_blank">++YONG</a>
  </div>
</div>