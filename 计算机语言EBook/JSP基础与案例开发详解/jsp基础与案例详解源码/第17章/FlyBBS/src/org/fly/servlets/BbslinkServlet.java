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

public class BbslinkServlet extends HttpServlet {

	ConvertUtil cutils = new ConvertUtil();

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
		List listBbslink = new ArrayList();
		BbslinkBiz bbslinkbiz = new BbslinkBiz();
		String tourl = "error.jsp";

		if ("add".equals(path)) {
			Bbslink bbslink = new Bbslink();
			bbslink.setBoardname(cutils.IsoToGBK(request.getParameter("name")));
			bbslink.setUrl(cutils.IsoToGBK("http://"
					+ request.getParameter("url")));
			bbslink.setReadme(cutils.IsoToGBK(request.getParameter("readme")));
			if (bbslinkbiz.add(bbslink)) {
				tourl = "bbslink?path=tolink";
			} else {
				request.setAttribute("title", "添加出错");
				request.setAttribute("info", "添加联盟论坛出错，请返回重新添加!");
				request.setAttribute("url", "bbslink?path=toadd");
			}
		} else if ("del".equals(path)) {// 删除信息
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = bbslinkbiz.delete(tmpid);
			if (flag) {
				tourl = "bbslink?path=tolink";
			} else {
				request.setAttribute("title", "删除出错");
				request.setAttribute("info", "删除联盟论坛出错，请返回重新添加!");
				request.setAttribute("url", "bbslink?path=tolink");
			}
		} else if ("update".equals(path)) {// 更新联盟论坛信息
			Bbslink bbslink = new Bbslink();
			int tmpid = cutils.strToInt(request.getParameter("id"));
			bbslink.setBoardname(cutils.IsoToGBK(request.getParameter("name")));
			bbslink.setUrl(cutils.IsoToGBK("http://"
					+ request.getParameter("url")));
			bbslink.setReadme(cutils.IsoToGBK(request.getParameter("readme")));
			bbslink.setId(tmpid);
			if (bbslinkbiz.update(bbslink)) {
				tourl = "bbslink?path=tolink";
			} else {
				request.setAttribute("title", "更新出错");
				request.setAttribute("info", "更新联盟论坛出错，请返回重新修改!");
				request
						.setAttribute("url", "bbslink?path=toupdate&id="
								+ tmpid);
			}

		} else if ("toupdate".equals(path)) {// 预处理更新
			int tmpid = cutils.strToInt(request.getParameter("id"));
			Bbslink bbslink = (Bbslink) bbslinkbiz.searchById(1, tmpid).get(0);
			request.setAttribute("action", "edit");
			tourl = "manager/admin_link.jsp";
			request.setAttribute("bbslink", bbslink);
		} else if ("tolink".equals(path)) {// 跳转至联盟论坛页面
			listBbslink = bbslinkbiz.searchById(0, 0);
			tourl = "manager/admin_link.jsp";
			request.setAttribute("action", "manager");
			request.setAttribute("bbslink", listBbslink);
		} else {
			listBbslink = bbslinkbiz.searchById(0, 0);
			tourl = "";
			session.setAttribute("listBbslink", listBbslink);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
