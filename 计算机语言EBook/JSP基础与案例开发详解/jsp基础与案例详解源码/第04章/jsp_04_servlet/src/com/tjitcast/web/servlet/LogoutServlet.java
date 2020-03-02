package com.tjitcast.web.servlet;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

//处理用户注销会话的Servlet
public class LogoutServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//销毁会话,会触发SessionLinstener中的sessionDestroyed方法
	    request.getSession().invalidate(); 
	    
	    //从应用上下文中获取在线用户名列表
	    List<String> online = (List<String>)getServletContext().getAttribute("online");
	    
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>用户列表</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    <h3>在线用户列表</h3>");

		int size = online == null ? 0 : online.size();
		for (int i = 0; i < size; i++) {
			if(i > 0){
				out.println("<br/>");
			}
			out.println(i + 1 + "." + online.get(i));
		}
		
		out.println("<hr/><a href=\"index.html\">主页</a>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}
