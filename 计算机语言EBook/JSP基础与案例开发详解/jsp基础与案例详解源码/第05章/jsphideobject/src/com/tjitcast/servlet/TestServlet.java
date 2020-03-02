package com.tjitcast.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取表单信息
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String[] likes = request.getParameterValues("likes");
		String URL = "index.jsp";
		String likes2 = "";
		if (null != likes) {
			for (String string : likes) {
				likes2 += string + "  ";
			}
		}
		if (null != name && !name.equals("")) {
			// 把从页面获取的内容放入request中
			request.setAttribute("name", name);
			request.setAttribute("sex", sex);
			request.setAttribute("address", address);
			request.setAttribute("likes", likes2);
			URL = "result.jsp";
		}
		request.getRequestDispatcher(URL).forward(request, response);
	}

	public void init() throws ServletException {
	}
}