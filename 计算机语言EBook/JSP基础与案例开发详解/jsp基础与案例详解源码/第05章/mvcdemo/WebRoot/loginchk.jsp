<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="com.tjitcast.mvc.UserCheckBean" %>

<%request.setCharacterEncoding("GB2312");%>

<jsp:useBean id="user" scope="session" class="com.tjitcast.mvc.UserBean"/>
<jsp:setProperty name="user" property="*"/>

<%
    UserCheckBean uc=new UserCheckBean(user);
    if(uc.validate())
    {
%>
<jsp:forward page="welcome.jsp"/>
<%
    }
    else
    {
        out.println("�û��������������<a href=\"login.html\">���µ�¼</a>");
    }
%>
