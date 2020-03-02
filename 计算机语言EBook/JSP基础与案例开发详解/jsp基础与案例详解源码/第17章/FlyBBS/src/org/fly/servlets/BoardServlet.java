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

public class BoardServlet extends HttpServlet {
	ConvertUtil cuitls = new ConvertUtil();

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
		List listBoard = new ArrayList();
		BoardBiz boardbiz = new BoardBiz();
		BbsnewsBiz bbsnewsbiz = new BbsnewsBiz();
		Bbsnews bbsnews = new Bbsnews();
		Board board = new Board();
		BbsBiz bbsbiz = new BbsBiz();
		Bbs bbs = new Bbs();
		String tourl = "error.jsp";
		String error = "";
		// 预处理添加--获取添加版面类型。
		if ("tempadd".equals(path)) {
			request.setAttribute("action", "add");
			ClasstypeBiz classtype = new ClasstypeBiz();
			int ctype = cutils.strToInt(request.getParameter("classtype"));
			Classtype type = new Classtype();
			type.setId(ctype);
			type = (Classtype) classtype.searchById(1, type).get(0);
			request.setAttribute("classtype", type);
			tourl = "manager/admin_board.jsp";
		} else if ("add".equals(path)) {// 添加论坛

			board.setLastrootid(cutils.strToInt(request
					.getParameter("lastrootid")));
			board.setBoardType(cutils.IsoToGBK(request
					.getParameter("boardtype")));
			board.setClassType(cutils.strToInt(request
					.getParameter("classType"))); // 1 电脑 2 版务
			board.setReadme(cutils.IsoToGBK(request.getParameter("readme")));
			board.setBoardMaster(cutils.IsoToGBK(request
					.getParameter("boardmaster")));
			board.setLockboard(cutils.strToInt(request
					.getParameter("lockboard")));
			board.setForumlogo(request.getParameter("Logo"));
			board.setIndexIMG("indexIMG");
			board.setBoarduser("admin");

			boardbiz.add(board);
			tourl = "board?path=boardinfo";
		} else if ("m_moderators".equals(path)) {// 删除论坛
			//查询所有的类型
			listBoard = boardbiz.searchById(0, null);
			//类型    技术专区、子女专区等
			ClasstypeBiz classtype = new ClasstypeBiz();		
			List listClass = classtype.searchById(0, null);
			request.setAttribute("classtype", listClass);
			request.setAttribute("board", listBoard);
			request.setAttribute("action", "manager");
			tourl = "manager/admin_moderators.jsp";
		} else if ("dele".equals(path)) {// 删除论坛
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = boardbiz.delete(tmpid);
			if (flag) {
				tourl = "board?path=boardinfo";
			} else {
				request.setAttribute("title", "删除出错");
				request.setAttribute("info", "删除论坛出错，请返回重新修改!");
				request.setAttribute("url", "board?path=boardinfo");
			}
		} else if ("update".equals(path)) {// 更新主论坛信息.

			int tmpid = cutils.strToInt(request.getParameter("id"));
			board.setBoardid(tmpid);
			board.setLastrootid(cutils.strToInt(request
					.getParameter("lastrootid")));
			board.setBoardType(cutils.IsoToGBK(request
					.getParameter("boardtype")));
			board.setClassType(cutils.strToInt(request
					.getParameter("classType"))); // 1 电脑 2 版务
			board.setReadme(cutils.IsoToGBK(request.getParameter("readme")));
			board.setBoardMaster(cutils.IsoToGBK(request
					.getParameter("boardmaster")));
			board.setLockboard(cutils.strToInt(request
					.getParameter("lockboard")));
			if (boardbiz.update(board)) {
				request.setAttribute("action", "manager");
				tourl = "board?path=boardinfo";
			} else {
				request.setAttribute("title", "修改出错");
				request.setAttribute("info", "修改论坛出错，请返回重新修改!");
				request.setAttribute("url", "board?path=update");
			}
		} else if ("toupdate".equals(path)) {// 预处理论坛更新
			int id = cutils.strToInt(request.getParameter("id"));
			board.setBoardid(id);
			board = (Board) boardbiz.searchById(1, board).get(0);
			ClasstypeBiz classtype = new ClasstypeBiz();
			//获取所有的类型
			List listClass = classtype.searchById(0, null);
			request.setAttribute("classtype", listClass);
			request.setAttribute("board", board);
			request.setAttribute("action", "edit");
			tourl = "manager/admin_board.jsp";
		} else if ("boardinfo".equals(path)) {// 跳转到论坛管理页面
			//查询所有的类型
			listBoard = boardbiz.searchById(0, null);
			//类型    技术专区、子女专区等
			ClasstypeBiz classtype = new ClasstypeBiz();		
			List listClass = classtype.searchById(0, null);
			request.setAttribute("classtype", listClass);
			request.setAttribute("board", listBoard);
			request.setAttribute("action", "manager");
			tourl = "manager/admin_board.jsp";
		} else if ("manage".equals(path)) {// 跳转到论坛管理页面
			//获取论坛模块的id
			int boardid = cutils.strToInt(request.getParameter("bid"));
			//获取论坛ID
			int cid = cutils.strToInt(request.getParameter("cid"));
			
			//根据boardid查询所有的子论坛下所有的新闻
			bbs.setBoardID(boardid);
			bbs.setParentID(cid);
			List bbsList = bbsbiz.searchById(2, bbs);
			//根据boardid查询board
			board.setBoardid(boardid);
			board = (Board) boardbiz.searchById(1, board).get(0);
			request.setAttribute("bbsList", bbsList);
			request.setAttribute("board", board);
			request.setAttribute("bid",boardid);
			request.setAttribute("cid",cid);
			tourl = "manager/admin_manage_news.jsp";
		} else {
			// listBoard = boardbiz.searchById(0, 0);
			// tourl = "";
			// session.setAttribute("listBoard", listBoard);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
