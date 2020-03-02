<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="user" scope="session"
	class="com.tjitcast.action.Person" />
your name is:<jsp:getProperty name="user" property="name" /><br>
your sex is:<jsp:getProperty name="user" property="sex" /><br>
your caducation:<jsp:getProperty name="user" property="education" /><br>
your email:<jsp:getProperty name="user" property="email" /><br>

