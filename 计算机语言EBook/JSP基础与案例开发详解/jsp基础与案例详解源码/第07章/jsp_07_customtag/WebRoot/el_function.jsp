<%@ page language="java" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用uri属性来引用此标签库的唯一标识URI;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib uri="http://blog.csdn.net/qjyong/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>把字符串内容转成大写的自定义EL函数</title>
  </head>
  <body>
    <h3>把字符串内容转成大写的自定义EL函数使用示例</h3><hr/>
    <%-- 注意EL函数的使用方式  --%>
	${q:toUpperCase("Hello,EL Function!")}
  </body>
</html>
