<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- 引入标签库 --%>
<%@ taglib uri="http://blog.csdn.net/qjyong/tags/pager" prefix="q"%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>自定义分页标签使用示例</title>
<style type="text/css">
body {
	margin-top: 20px;
	text-align: left;
	font-family: 宋体, Arial, Verdana;
	font-size: 13px;
	line-height: 150%;
	min-width:800px;
	word-break:break-all;
}
/* 分页标签样式 */
.pagination {
    padding: 5px;
    float: right;
}
.pagination a, .pagination a:link, .pagination a:visited {
    padding: 2px 5px 2px 5px;
    margin: 2px;
    border: 1px solid #aaaadd;
    text-decoration: none;
    color: #006699;
}
.pagination a:hover, .pagination a:active {
    border: 1px solid #ff0000;
    color: #000;
    text-decoration: none;
}
.pagination span.current {
    padding: 2px 5px 2px 5px;
    margin: 2px;
    border: 1px solid #ff0000;
    font-weight: bold;
    background-color: #ff0000;
    color: #FFF;
}
.pagination span.disabled {
    padding: 2px 5px 2px 5px;
    margin: 2px;
    border: 1px solid #eee;
    color: #ddd;
}
</style>
  </head>
  
  <body>
   <div style="margin: 0px auto; width:700px">
  	<div id="title">
  	  <h3>自定义数据分页标签的使用示例</h3><hr/>
  	</div>
  	<div id="data">
		<table border="1" width="600px" align="center">
		<%  //获取分页后的数据进行显示
			List<String> datas = (List<String>)request.getAttribute("datas");
			for(String str : datas){
		    out.println("<tr><td>" + str + "</td></tr>");
			} %>
		</table>
  	</div>
	<%-- 分页标签的使用 
	<q:pager pageNo='<%= ((Integer)request.getAttribute("pageNo")).intValue()%>'
	  pageSize='<%= ((Integer)request.getAttribute("pageSize")).intValue()%>'
	  recordCount='<%= ((Integer)request.getAttribute("recordCount")).intValue()%>'
	  url="TestPagerTagServlet" />
  --%>
	<%-- 使用EL表达式简化分页标签的使用--%>
	<q:pager pageNo="${pageNo}"
			 pageSize="${pageSize}"
			 recordCount="${recordCount}"
			 url="TestPagerTagServlet" />
	
   </div>
  </body>
</html>