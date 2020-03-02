<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用uri属性来引用此标签库的唯一标识URI;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib uri="http://blog.csdn.net/qjyong/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>支持动态属性的自定义标签</title>
  </head>
  <body>
    <h3>支持动态属性的自定义标签使用示例</h3><hr/>
    
    <!-- 第一种调用方式: 直接在开始标记中添加任意数量的属性 -->
	<q:dynaAdd x="10" y="100" z="1000"/>
	<hr/>
	<!-- 第二种调用方式：使用jsp:attribute来指定要添加的属性 -->
	<q:dynaAdd>
		<jsp:attribute name="x">10</jsp:attribute>
		<jsp:attribute name="y">100</jsp:attribute>
		<jsp:attribute name="z">1000</jsp:attribute>
	</q:dynaAdd>
  </body>
</html>