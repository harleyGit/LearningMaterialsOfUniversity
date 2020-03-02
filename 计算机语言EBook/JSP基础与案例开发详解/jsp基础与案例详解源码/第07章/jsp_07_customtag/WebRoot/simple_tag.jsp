<%@ page language="java" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用uri属性来引用此标签库的唯一标识URI;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib uri="http://blog.csdn.net/qjyong/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用简单标签方式开发的把主体返回的内容转成大写的自定义标签</title>
  </head>
  <body>
    <h3>用简单标签方式开发的把主体返回的内容转成大写的自定义标签使用示例</h3><hr/>
    <% //创建一个字符串用于测试
      String str = "Hello,World!"; 
      pageContext.setAttribute("str", str); 
    %>
	<q:mySimpleTag counts="3">
		${str}<br/>
	</q:mySimpleTag>
  </body>
</html>
