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

public class BbsnewsServlet extends HttpServlet {
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
		List listBbsnews = new ArrayList();
		BbsnewsBiz bbsnewsbiz = new BbsnewsBiz();
		String tourl = "error.jsp";
		if ("add".equals(path)) {// 清加新的公告
			Bbsnews bbsnews = new Bbsnews();
			String title = request.getParameter("name");
			int type = Integer.parseInt(request.getParameter("select"));
			String content = request.getParameter("content");
			bbsnews.setTitle(title);
			bbsnews.setBoardid(type);
			bbsnews.setContent(content);
			bbsnews.setUsername("admin");
			bbsnews.setAddtime(cutils.getTime());
			boolean flag = bbsnewsbiz.add(bbsnews);
			if (flag) {// 添加成功
				listBbsnews = bbsnewsbiz.searchById(2, bbsnews);
				request.setAttribute("action", "manager");
				request.setAttribute("listBbsnews", listBbsnews);
				tourl = "manager/admin_news.jsp";
			}
		} else if ("toadd".equals(path)) {// 预处理添加信息,主要是为了获取已有公告类型。
			session.setAttribute("action", "add");
			ClasstypeBiz classtype = new ClasstypeBiz();
			List listClass = classtype.searchById(0, null);
			request.setAttribute("listClass", listClass);
			tourl = "manager/admin_news.jsp";
		} else if ("newsinfo".equals(path)) {// 查询公告
			Bbsnews bbsnews = new Bbsnews();
			ClasstypeBiz classtype = new ClasstypeBiz();
			List listClass = classtype.searchById(0, null);
			int id = Integer.parseInt(request.getParameter("id"));
			bbsnews.setBoardid(id);
			listBbsnews = bbsnewsbiz.searchById(2, bbsnews);
			request.setAttribute("listClass", listClass);
			request.setAttribute("listBbsnews", listBbsnews);
			request.setAttribute("action", "manager");
			tourl = "manager/admin_news.jsp";
		} else if ("dele".equals(path)) {// 删除公告信息
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = bbsnewsbiz.delete(tmpid);
			int bid = Integer.parseInt(request.getParameter("bid"));
			Bbsnews bbsnews = new Bbsnews();
			bbsnews.setBoardid(bid);
			listBbsnews = bbsnewsbiz.searchById(2, bbsnews);
			session.setAttribute("listBbsnews", listBbsnews);
			request.setAttribute("action", "manager");
			tourl = "manager/admin_news.jsp";
		} else if ("toupdate".equals(path)) {// 预处理更新
			int tmpid = Integer.parseInt(request.getParameter("id"));
			Bbsnews bbsnews = new Bbsnews();
			bbsnews.setId(tmpid);
			List list = new ArrayList();
			Bbsnews bbsne = (Bbsnews) bbsnewsbiz.searchById(1, bbsnews).get(0);
			ClasstypeBiz classtype = new ClasstypeBiz();
			List listClass = classtype.searchById(0, null);
			request.setAttribute("listClass", listClass);
			session.setAttribute("action", "edit");
			session.setAttribute("bbsnews", bbsne);
			tourl = "manager/admin_news.jsp";
		} else if ("update".equals(path)) {// 更新公告
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("name2");
			int type = Integer.parseInt(request.getParameter("select2"));
			String content = request.getParameter("textarea");
			Bbsnews bbsnews = new Bbsnews();
			bbsnews.setId(id);
			bbsnews.setTitle(title);
			bbsnews.setBoardid(type);
			bbsnews.setContent(content);
			bbsnews.setUsername("admin");
			bbsnews.setAddtime(cutils.getTime());
			boolean flag = bbsnewsbiz.update(bbsnews);
			if (flag) {// 正确则跳转
				listBbsnews = bbsnewsbiz.searchById(2, bbsnews);
				tourl = "manager/admin_news.jsp";
				request.setAttribute("action", "manager");
				session.setAttribute("listBbsnews", listBbsnews);
			}
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
