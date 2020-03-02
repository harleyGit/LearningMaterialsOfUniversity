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
		// out.println("这是我的第一个servlet程序");
		// resp.sendRedirect("secServlet");
		// req.getRequestDispatcher("secServlet").forward(req,resp);
		String str = "在Servlet中存放请求域数据";
		req.setAttribute("string", str);
		req.getRequestDispatcher("secServlet").forward(req, resp);
	}

	public void init(ServletConfig config)
    throws ServletException{
//		String name = config.getInitParameter("personname");
//		System.out.println("这里调用了init方法获取参数personname的值："+name);
	}

	public void destroy() {
		System.out.println("这里调用了destroy方法");
	}
}
