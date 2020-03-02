<%@ page language="java" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用tagdir属性来指定要引用的标签文件所在目录的Web应用上下文相对路径;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>处理片段属性的标签文件实现的自定义标签</title>
  </head>
  <body>
    <h3>处理片段属性的标签文件实现的自定义标签的使用示例</h3>
	<%-- 调用标签文件定义的fragment标签 --%>
	<%-- 用attribute动作来定义片段属性
           片段属性名用name来指定,值是标签主体计算返回的内容
  --%>
	<q:fragment>
		<jsp:attribute name="href">
		  <a href="javascript:void(null)" target="_self" onClick="">加入收藏</a> - 
		  <a href="javascript:void(null)" target="_self" onClick="">设为首页</a> - 
		  <a href="javascript:void(null)" target="_blank">隐私保护</a> - 
		  <a href="javascript:void(null)" target="_blank">联系我们</a> - 
		  <a href="javascript:void(null)" target="_blank">获得帮助</a> - 
		  <a href="javascript:void(null)" target="_blank">投诉举报</a> 
		</jsp:attribute>
		<jsp:attribute name="siteTitle">
			JSP笔记——为Java人的成长添动力
		</jsp:attribute>
	</q:fragment>
  </body>
</html>
