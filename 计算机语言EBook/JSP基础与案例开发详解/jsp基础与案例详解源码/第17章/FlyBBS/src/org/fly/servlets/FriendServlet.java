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

public class FriendServlet extends HttpServlet {
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
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		String path = request.getParameter("path");
		HttpSession session = request.getSession();
		ConvertUtil cutils = new ConvertUtil();
		List listFriend = new ArrayList();
		FriendBiz friendbiz = new FriendBiz();
		String tourl = "";
		String error = "";
		if ("add".equals(path)) {
			tourl = "";
		} else if ("dele".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = friendbiz.delete(tmpid);
			listFriend = friendbiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listFriend", listFriend);
		} else if ("update".equals(path)) {
			Friend friend = new Friend();
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = friendbiz.update(friend);
			listFriend = friendbiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listFriend", listFriend);
		} else if ("toupdate".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			Friend friend = (Friend) friendbiz.searchById(0, 0).get(0);
			tourl = "";
			session.setAttribute("friend", friend);
		} else {
			listFriend = friendbiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listFriend", listFriend);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
