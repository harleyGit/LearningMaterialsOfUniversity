<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用uri属性来引用此标签库的唯一标识URI;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib uri="http://blog.csdn.net/qjyong/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>自定义嵌套标签if-then-else</title>
  </head>
  <body>
    <h3>自定义嵌套标签if-then-else的使用示例</h3><hr/>
	<q:if test="<%= 5 + 3 - 2 * 4 > 0 %>">
		<q:then>test的值为true</q:then>
		<q:else>test的值为false</q:else>
	</q:if>
  </body>
</html>
