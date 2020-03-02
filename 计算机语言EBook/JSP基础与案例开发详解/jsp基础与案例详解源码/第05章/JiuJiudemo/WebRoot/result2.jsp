<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<html>
  <head>
     <title>³Ë·¨±í</title>
    
  </head>
  
  <body>
   <%
      int c = Integer.parseInt(request.getParameter("c"));
      int d = Integer.parseInt(request.getParameter("d"));        
        for(int i=0; i<=c;i++){
           for(int j=d;j<=i;j++){
           out.print(j+" * "+ i +" = "+ i*j );
            out.print("&nbsp;&nbsp;&nbsp;");
           }
           out.print("<br/>");
        } 
   
   %>
  </body>
</html>
