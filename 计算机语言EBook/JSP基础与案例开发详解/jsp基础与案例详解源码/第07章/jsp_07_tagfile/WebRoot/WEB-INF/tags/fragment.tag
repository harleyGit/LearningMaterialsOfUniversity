<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%-- 用attribute指令声明要使用的片段属性 --%>
<%@ attribute name="href" fragment="true" required="true" %>
<%@ attribute name="siteTitle" fragment="true" required="true" %>
<div style="font-size: 13px;text-align:center;line-height: 1.5;" id="footer">
  <div id="copyright">
    <hr/>
      <%-- 调用指定名称的片段属性 --%>
	  <jsp:invoke fragment="href"/>
    <br/>
      <%-- 调用指定名称的片段属性 --%>
      <jsp:invoke fragment="siteTitle"/>
    <BR>版权所有&copy;2009，
  <a href="http://blog.csdn.net/qjyong" target="_blank">++YONG</a>
  </div>
</div>