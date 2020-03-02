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

import org.fly.beans.Config;
import org.fly.biz.ConfigBiz;
import org.fly.utils.ConvertUtil;

public class ConfigServlet extends HttpServlet {
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
		List listConfig = new ArrayList();
		ConfigBiz configbiz = new ConfigBiz();
		String tourl = "";
		if ("add".equals(path)) {
			tourl = "";
		} else if ("serch".equals(path)) {
			// 这里是查询所有的数据
			listConfig = configbiz.searchById();
			session.setAttribute("listAll", listConfig);
			tourl = "manager/admin_wealth.jsp";
		} else if ("dele".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = configbiz.delete(tmpid);
			listConfig = configbiz.searchById();
			tourl = "";
			session.setAttribute("listConfig", listConfig);
		} else if ("update".equals(path)) {
			// 更新金钱，魅力
			Config config = new Config();
			config.setWealthReg(Integer.parseInt(request
					.getParameter("wealthReg")));
			System.out.println(Integer.parseInt(request
					.getParameter("wealthReg")));
			config.setWealthLogin(Integer.parseInt(request
					.getParameter("wealthLogin")));
			config.setWealthAnnounce(Integer.parseInt(request
					.getParameter("wealthAnnounce")));
			config.setWealthReannounce(Integer.parseInt(request
					.getParameter("wealthReAnnounce")));
			config.setWealthDel(Integer.parseInt(request
					.getParameter("wealthDel")));
			config.setEpReg(Integer.parseInt(request.getParameter("epReg")));
			config
					.setEpLogin(Integer.parseInt(request
							.getParameter("epLogin")));
			config.setEpAnnounce(Integer.parseInt(request
					.getParameter("epAnnounce")));
			config.setEpReannounce(Integer.parseInt(request
					.getParameter("epReAnnounce")));
			config.setEpDel(Integer.parseInt(request.getParameter("epDel")));
			config.setCpReg(Integer.parseInt(request.getParameter("cpReg")));
			config
					.setCpLogin(Integer.parseInt(request
							.getParameter("cpLogin")));
			config.setCpAnnounce(Integer.parseInt(request
					.getParameter("cpAnnounce")));
			config.setCpReannounce(Integer.parseInt(request
					.getParameter("cpReAnnounce")));
			config.setCpDel(Integer.parseInt(request.getParameter("cpDel")));
			boolean falg = configbiz.updateWealth(config);
			if (falg) {
				tourl = "user?path=serch";
			} else {
				request.setAttribute("title", "修改查找出错");
				request.setAttribute("info", "修改查找出错，请返回重新修改!");
				request.setAttribute("url", "board?path=boardinfo");
			}
		} else if ("updateShezhi".equals(path)) {
			// 更新论坛变量设置
			Config config = new Config();
			config.setForumName(request.getParameter("forumName"));
			System.out.println(request.getParameter("forumName"));
			config.setForumURL(request.getParameter("forumURL"));
			config.setCompanyName(request.getParameter("companyName"));
			config.setHostUrl(request.getParameter("hostURL"));
			config.setSystemEmail(request.getParameter("systemEmail"));
			config.setLogo(request.getParameter("forumLogo"));
			config.setIpFlag(Integer.parseInt(request.getParameter("ipFlag")));
			config.setTitleFlag(request.getParameter("titleFlag"));
			config.setUploadFlag(request.getParameter("uploadFlag"));
			config.setGuestuser(Integer.parseInt(request
					.getParameter("guestUser")));
			config.setAds1(request.getParameter("ads1"));
			config.setAds2(request.getParameter("ads2"));
			config.setCopyright(request.getParameter("copyRight"));
			config.setVersion(request.getParameter("version"));
			boolean falg = configbiz.updateInfo(config);
			if (falg) {
				tourl = "user?path=serch";
			} else {
				request.setAttribute("title", "论坛设置出错");
				request.setAttribute("info", "论坛设置出错，请返回重新修改!");
				request.setAttribute("url", "board?path=boardinfo");
			}
		} else if ("toupdate".equals(path)) {
			// 查询金钱，魅力
			listConfig = configbiz.searchById();
			session.setAttribute("listallup", listConfig);
			tourl = "manager/admin_var.jsp";
		} else {
			listConfig = configbiz.searchById();
			tourl = "";
			session.setAttribute("listConfig", listConfig);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
