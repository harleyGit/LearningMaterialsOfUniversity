<%@ page language="java" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用tagdir属性来指定要引用的标签文件所在目录的Web应用上下文相对路径;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>带标签主体的标签文件实现的自定义标签</title>
  </head>
  <body>
    <h3>带标签主体的标签文件实现的自定义标签的使用示例</h3>
	<q:dobody>
		<i>JSP笔记——为Java人的成长添动力!</i>
	</q:dobody>
  </body>
</html>
