package com.tjitcast.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//�����û���¼��Servlet
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String username= request.getParameter("username");
		
		//��session���������,�ᴥ��HttpSessionAttributeListener�е�attributeAdded����
	    if(username != null && !username.equals("")) {   
	        request.getSession().setAttribute("username",username);     
	    }
	    //��Ӧ���������л�ȡ�����û����б�
	    List<String> online = (List<String>)getServletContext().getAttribute("online");   
	    
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>�û��б�</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("��ǰ�û��ǣ�" + username);
		out.print("    <hr/><h3>�����û��б�</h3>");

		int size = online == null ? 0 : online.size();
		for (int i = 0; i < size; i++) {
			if(i > 0){
				out.println("<br/>");
			}
			out.println(i + 1 + "." + online.get(i));
		}
		
		//ע��: Ҫ������URL�����Զ���д����
		out.println("<hr/><a href=\"" + response.encodeURL("logout") + "\">ע��</a>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}
