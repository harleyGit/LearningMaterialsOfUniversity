package org.fly.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.fly.utils.*;
import org.fly.beans.*;
import org.fly.biz.*;

public class ClasstypeServlet extends HttpServlet {
	public void init() throws ServletException {
	}

	public void destroy() {
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String path = request.getParameter("path");
		HttpSession session = request.getSession();
		ConvertUtil cutils = new ConvertUtil();
		List listClasstype = new ArrayList();
		ClasstypeBiz classtypebiz = new ClasstypeBiz();
		String tourl = "";
		String error = "";
		if ("add".equals(path)) {
			Classtype classtype = new Classtype();
			classtype.setId(cutils.strToInt(request.getParameter("id")));
			classtype.setClassType(request.getParameter("classtype"));
			classtypebiz.add(classtype);
			tourl = "board?path=boardinfo";
		} else if ("toadd".equals(path)) {
			request.setAttribute("action", "addclasstype");
			tourl = "manager/admin_board.jsp";
		} else if ("dele".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = classtypebiz.delete(tmpid);

			tourl = "board?path=boardinfo";
			session.setAttribute("listClasstype", listClasstype);
			// } else if ("update".equals(path)) {
			// Classtype classtype = new Classtype();
			// int tmpid = cutils.strToInt(request.getParameter("id"));
			// boolean flag = classtypebiz.update(classtype);
			// listClasstype = classtypebiz.searchById(0, 0);
			// tourl = "";
			// session.setAttribute("listClasstype", listClasstype);
			// } else if ("toupdate".equals(path)) {
			// int tmpid = cutils.strToInt(request.getParameter("id"));
			// Classtype classtype = (Classtype) classtypebiz.searchById(0, 0)
			// .get(0);
			// tourl = "";
			// session.setAttribute("classtype", classtype);
			// } else {
			// listClasstype = classtypebiz.searchById(0, 0);
			// tourl = "";
			// session.setAttribute("listClasstype", listClasstype);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
