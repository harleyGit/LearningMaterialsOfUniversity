package com.tjitcast.web.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, java.io.IOException {
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, java.io.IOException {
		//resp.setContentType("text/html;charset=utf-8");
		// PrintWriter out = resp.getWriter();
		// out.println("�����ҵĵ�һ��servlet����");
		// resp.sendRedirect("secServlet");
		// req.getRequestDispatcher("secServlet").forward(req,resp);
		String str = "��Servlet�д������������";
		req.setAttribute("string", str);
		req.getRequestDispatcher("secServlet").forward(req, resp);
	}

	public void init(ServletConfig config)
    throws ServletException{
//		String name = config.getInitParameter("personname");
//		System.out.println("���������init������ȡ����personname��ֵ��"+name);
	}

	public void destroy() {
		System.out.println("���������destroy����");
	}
}
