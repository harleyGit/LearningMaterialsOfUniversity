package com.tjitcast.web.servlet;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

//�����û�ע���Ự��Servlet
public class LogoutServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//���ٻỰ,�ᴥ��SessionLinstener�е�sessionDestroyed����
	    request.getSession().invalidate(); 
	    
	    //��Ӧ���������л�ȡ�����û����б�
	    List<String> online = (List<String>)getServletContext().getAttribute("online");
	    
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>�û��б�</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    <h3>�����û��б�</h3>");

		int size = online == null ? 0 : online.size();
		for (int i = 0; i < size; i++) {
			if(i > 0){
				out.println("<br/>");
			}
			out.println(i + 1 + "." + online.get(i));
		}
		
		out.println("<hr/><a href=\"index.html\">��ҳ</a>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}
