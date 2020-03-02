package org.bzc.jpetstore.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bzc.jpetstore.utils.*;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.biz.*;

public class BannerdataServlet extends HttpServlet {
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
		List listBannerdata = new ArrayList();
		BannerdataBiz bannerdatabiz = new BannerdataBiz();
		String tourl = "";
		String error = "";
		if ("add".equals(path)) {
			tourl = "";
		} else if ("dele".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = bannerdatabiz.delete(tmpid);
			listBannerdata = bannerdatabiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listBannerdata", listBannerdata);
		} else if ("update".equals(path)) {
			Bannerdata bannerdata = new Bannerdata();
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = bannerdatabiz.update(bannerdata);
			listBannerdata = bannerdatabiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listBannerdata", listBannerdata);
		} else if ("toupdate".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			Bannerdata bannerdata = (Bannerdata) bannerdatabiz.searchById(0, 0)
					.get(0);
			tourl = "";
			session.setAttribute("bannerdata", bannerdata);
		} else {
			listBannerdata = bannerdatabiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listBannerdata", listBannerdata);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
