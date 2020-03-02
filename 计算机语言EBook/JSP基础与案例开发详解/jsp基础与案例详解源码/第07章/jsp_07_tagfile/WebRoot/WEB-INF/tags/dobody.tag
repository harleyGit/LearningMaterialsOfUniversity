<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<!-- 将标签主体计算的结果保存为一个字符串,并用var指定的变量名存放于页面使用域中 -->
<jsp:doBody var="siteTitle" scope="page"/>
<div style="font-size: 13px;text-align:center;line-height: 1.5;" id="footer">
  <div id="copyright">
    <hr/>
  <a href="javascript:void(null)" target="_self" onClick="">加入收藏</a> - 
  <a href="javascript:void(null)" target="_self" onClick="">设为首页</a> - 
  <a href="javascript:void(null)" target="_blank">隐私保护</a> - 
  <a href="javascript:void(null)" target="_blank">联系我们</a> - 
  <a href="javascript:void(null)" target="_blank">获得帮助</a> - 
  <a href="javascript:void(null)" target="_blank">投诉举报</a> 
    <br/>${siteTitle}
    <BR>版权所有&copy;2009，
  <a href="http://blog.csdn.net/qjyong" target="_blank">++YONG</a>
  </div>
</div>