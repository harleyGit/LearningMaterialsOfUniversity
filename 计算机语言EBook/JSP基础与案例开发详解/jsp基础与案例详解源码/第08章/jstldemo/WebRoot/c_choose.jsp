<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>JSTL_c_choose</title>
  </head>
  
  <body>
    <c:set var="score" value="89"/>
 	<c:choose>
 	  <c:when test="${score>90}">
 	    成绩优秀！
 	  </c:when>
 	  <c:when test="${score>80&&score<90}">
 	    成绩优良！
 	  </c:when>
 	  <c:when test="${score>70&&score<80}">
 	    成绩一般！
 	  </c:when>
 	  <c:otherwise>成绩较差！</c:otherwise>
 	</c:choose>
  </body>
</html>