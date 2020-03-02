<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- 使用taglib指令引入标签库描述符文件
      用uri属性来引用此标签库的唯一标识URI;
      用prefix属性来指定引用此标签库中的标签的前缀为q
--%>
<%@ taglib uri="http://blog.csdn.net/qjyong/tags" prefix="q" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>对集合元素进行循环显示的自定义标签</title>
  </head>
  <body>
    <h3>对集合元素进行循环显示的自定义标签使用示例</h3><hr/>
    <%-- 用代码片段来创建一个演示用的集合 --%>
    <% 
       Collection<String> strs = new ArrayList<String>();
       strs.add("第一个元素");
       strs.add("second");
       strs.add("NO.3");
       strs.add("肆");
       //存放到页面上下文中
       pageContext.setAttribute("coll", strs);
    %>
    
    <%-- 使用代码片段来遍历集合 
    <% 
    	Collection coll = (Collection)pageContext.getAttribute("coll");
    	Iterator it = coll.iterator();
    	while(it.hasNext()){
    		out.print(it.next());
    		out.println("<br/>");
    	}
    %>
    --%>
    
    <%-- 调用自定义标签来遍历集合--%>
<q:loop items='<%= pageContext.getAttribute("coll")%>' var="str">
	<%= pageContext.getAttribute("str") %><br/>
</q:loop>
     
    <%-- 使用后面章节介绍的EL表达式可进一步简化这个自定义标签的使用  
    <q:loop items="${coll}" var="str">
    	${str}<br/>
    </q:loop>
   --%>
  </body>
</html>
