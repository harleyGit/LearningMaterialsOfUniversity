package org.fly.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fly.beans.Bbs;
import org.fly.beans.Bbsnews;
import org.fly.beans.Board;
import org.fly.beans.Config;
import org.fly.beans.Message;
import org.fly.beans.Online;
import org.fly.beans.User;
import org.fly.biz.BbsBiz;
import org.fly.biz.BbsnewsBiz;
import org.fly.biz.BoardBiz;
import org.fly.biz.ClasstypeBiz;
import org.fly.biz.ConfigBiz;
import org.fly.biz.MessageBiz;
import org.fly.biz.OnlineBiz;
import org.fly.biz.UserBiz;
import org.fly.utils.ConvertUtil;

public class Control extends HttpServlet {

	public Control() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String path = request.getParameter("path");
		HttpSession session = request.getSession();
		ConvertUtil cutils = new ConvertUtil();
		String tourl = "error.jsp";
		OnlineBiz onlinebiz = new OnlineBiz();
		// 进入首页
		if ("index".equals(path)) {
			Online online = (Online) session.getAttribute("online");
			if (online == null) {
				online = new Online();
				online.setUsername("游客");
				online.setBbstype(0);
				online.setIp(request.getRemoteAddr());
				online.setStartime(cutils.getTime());
				online.setBrowser("index");
				session.setAttribute("online", online);
			}

			if (session.getAttribute("u_state") != "1") {
				int id = onlinebiz.add(online); //
				session.setAttribute("onlineid", id);// 保存进入用户的状态ID
				session.setAttribute("u_state", "1");
			}
			// 获取论坛类别
			ClasstypeBiz classbiz = new ClasstypeBiz();
			List classlist = classbiz.searchById(0, null);
			request.setAttribute("classtype", classlist);

			// 获取论坛版块信息
			BoardBiz boardbiz = new BoardBiz();
			List templist = boardbiz.searchById(0, null);
			List boardlist = new ArrayList();

			// 获取最后一个注册用户信息.
			UserBiz userbiz = new UserBiz();
			List userlist = userbiz.searchById(0, null);
			User user = new User();
			user = (User) userlist.get(0);
			session.setAttribute("lastuser", user);
			session.setAttribute("usernum", userlist.size());
			for (int i = 0; i < templist.size(); i++) {
				Bbs bbs = new Bbs();
				Board board = (Board) templist.get(i);
				bbs.setBoardID(board.getBoardid());// 所属版块ID
				bbs.setParentID(board.getClassType());// 所属论坛ID
				bbs.setAnnounceID(0);
				BbsBiz bbsbiz = new BbsBiz();
				int maxNote = bbsbiz.searchById(1, bbs).size();// 查询版块中主题的所有的发帖记录
				List list = bbsbiz.searchById(2, bbs);
				int maxMotif = list.size();// 查询版块下的所有主题
				List maxZhuTi = bbsbiz.searchById(4, bbs);// 查询所有主题

				// 正面2个Session用于保存论坛最多帖子数及最多主题
				session.setAttribute("maxZhuTi", maxZhuTi.size());// 最多主题

				List maxbbs = bbsbiz.searchById(0, null);// 查询所有主题
				session.setAttribute("maxbbs", maxbbs.size());// 最多帖子

				List listtoday = bbsbiz.searchById(5, null);// 获得今天发帖数
				session.setAttribute("today", listtoday.size());

				if (list.size() > 0) {
					bbs = (Bbs) list.get(0);
					board.setMaxMotif(maxMotif);
					board.setMaxNote(maxNote);

					board.setLastposttime(bbs.getDateAndTime());// 最后发表帖子时间
					board.setLastrootid(bbs.getAnnounceID());// 最后发表帖子ID
					board.setLasttitle(bbs.getTitle());// 最后发表帖子标题
					board.setBoarduser(bbs.getUserName());// 最后发现帖子作者
					user.setUserName(bbs.getUserName());
					List ulist = userbiz.searchById(3, user);
					if (ulist.size() > 0) {
						user = (User) ulist.get(0);
					} else {
						user.setNickName("获取错误");
					}
					board.setNickName(user.getNickName());
				}
				boardlist.add(board);
			}
			String username = (String) session.getAttribute("userName");
			if (username != null) {
				Message message = new Message();
				MessageBiz messagebiz = new MessageBiz();
				message.setIncept(username);
				List list = messagebiz.searchById(2, message);
				session.setAttribute("news", list.size());
			}

			// 获取系统信息
			String osname = System.getProperty("os.name");// 操作系统名
			String ip = request.getRemoteAddr();// IP地址
			// IE版本
			String ie = request.getHeader("user-agent");
			StringTokenizer st = new StringTokenizer(ie, ";");
			st.nextToken();
			String browser = st.nextToken();
			// 保存本机信息，包括IP，操作系统名及浏览器版本
			session.setAttribute("osname", osname);
			session.setAttribute("ip", ip);
			session.setAttribute("ie", browser);

			session.setAttribute("boardlist", boardlist);
			Board board = new Board();
			if(boardlist.size()>0){
				board = (Board) boardlist.get(0);
			}

			// 获取公告信息
			BbsnewsBiz bbsnewbiz = new BbsnewsBiz();
			Bbsnews bbsnew = new Bbsnews();
			bbsnew.setBoardid(0);
			List bbsnewlist = bbsnewbiz.searchById(2, bbsnew);
			request.setAttribute("bbsnews", bbsnewlist);

			// 获取在线用户列表信息

			List onlineList = onlinebiz.searchById(4, null);
			for (int i = 0; i < onlineList.size(); i++) {
				Online t_online = new Online();
				t_online = (Online) onlineList.get(i);
				String online_name = t_online.getUsername();
				String onlineid = session.getAttribute("onlineid").toString();
			}
			List userList = onlinebiz.searchById(4, null);
			int maxManager = onlinebiz.searchById(3, null).size();// 会员在线数量
			int maxGuest = onlinebiz.searchById(2, null).size() - maxManager;// 最大在线游客数

			session.setAttribute("maxManager", maxManager);
			session.setAttribute("maxGuest", maxGuest);
			session.setAttribute("userList", userList);

			// 网站信息
			ConfigBiz configbiz = new ConfigBiz();
			List configlist = configbiz.searchById();
			Config config = (Config) configlist.get(0);
			session.setAttribute("configlist", config);

			tourl = "main.jsp";

		} else if ("boardInfo".equals(path)) {// 进入版块
			// 查询版块中的所有主题贴
			String bbstype = request.getParameter("bbstype");
			if ("3".equals(bbstype)) {// 论坛等级为开放论坛时
				tourl = "discuss.jsp";
			} else {
				User user = (User) session.getAttribute("user");
				if (null == user) {
					request.setAttribute("title", "提示信息 ");
					request.setAttribute("info", "本版面只对注册用户开放，请您登录后再进行访问 !");
					request.setAttribute("url", "login.jsp");
					tourl = "error.jsp";
				} else {
					int purview = 0;
					if (bbstype != null) {
						purview = cutils.strToInt(bbstype);// 转换论坛权限为INT类型
					}
					if (user.getBbstype() < purview) {
						request.setAttribute("title", "提示信息 ");
						request.setAttribute("info", "你的访问权限不够，无法访问此版面 !");
						request.setAttribute("url", "index.jsp");
						tourl = "error.jsp";
					} else {
						tourl = "discuss.jsp";
					}
				}
			}
			BbsBiz bbsbiz = new BbsBiz();
			int boardid = cutils.strToInt(request.getParameter("boardid"));
			int parentid = cutils.strToInt(request.getParameter("parentid"));

			Bbs bbs = new Bbs();
			bbs.setBoardID(boardid);
			bbs.setParentID(parentid);
			List<Bbs> temp = bbsbiz.searchById(2, bbs);// 主题贴信息
			List<Bbs> bbslist = new ArrayList<Bbs>();// 用于存储最终的查询结果
			// 用于循环记录每个主题贴的最后发帖情况
			//String source = request.getParameter("day");
			//int day = cutils.strToInt(source);
			for (Bbs rebbs : temp) {
				List list = bbsbiz.searchById(4, rebbs);
				rebbs.setReBbs(list.size());// 回贴数
				if (list.size() > 0) {
					bbs = (Bbs) list.get(list.size() - 1);
					rebbs.setLasttime(bbs.getDateAndTime().substring(11));// 最后回复时间
					rebbs.setLastUser(bbs.getUserName());// 最后回复人
				} else {
					rebbs.setLasttime("暂无回复");// 最后回复时间
					rebbs.setLastUser("暂无回复");// 最后回复人
				}

				// 保存每条帖子的全部信息
				bbslist.add(rebbs);
			}

			// 查询当前版块的公告信息
			BbsnewsBiz bbsnewsbiz = new BbsnewsBiz();
			Bbsnews bbsnews = new Bbsnews();
			bbsnews.setBoardid(boardid);
			List bbsnewslist = bbsnewsbiz.searchById(2, bbsnews);

			// 查询当前版块信息
			BoardBiz boardbiz = new BoardBiz();
			Board board = new Board();
			board.setBoardid(boardid);
			board = (Board) boardbiz.searchById(1, board).get(0);
			String strBoard = board.getBoardType();
			String strBoardMaster = board.getBoardMaster();
			request.setAttribute("bbstype", bbstype);
			request.setAttribute("master", strBoardMaster);// 记录版主信息
			request.setAttribute("boardid", boardid);// 所在版块
			request.setAttribute("parentid", parentid);// 所属论坛
			session.setAttribute("boardinfo", strBoard);// 版块信息
			request.setAttribute("bbsnews", bbsnewslist);// 公告列表
			request.setAttribute("bbs", bbslist);// //帖子列表

			// 下拉列表跳转版块信息
			Object o = session.getAttribute("boardlist");
			if (null == o) {
				List templist = boardbiz.searchById(0, null);
				session.setAttribute("boardlist", templist);
			}

		} else if ("selectJump".equals(path)) {// 下拉列表查询
			String source = request.getParameter("id");
			int id = cutils.strToInt(source);
		} else if ("newNote".equals(path)) {// 进入发帖页面

			Object tmpboard = request.getParameter("boardid");
			Object tmpparent = request.getParameter("parentid");
			// 参数正确时进入发帖页面
			if (tmpboard != null || tmpparent != null) {
				int boardid = cutils.strToInt(request.getParameter("boardid"));
				int parentid = cutils
						.strToInt(request.getParameter("parentid"));
				BoardBiz boardbiz = new BoardBiz();
				Board board = new Board();
				board.setBoardid(boardid);
				board = (Board) boardbiz.searchById(1, board).get(0);
				String strBoard = board.getBoardType();
				request.setAttribute("boardInfo", strBoard);
				request.setAttribute("url", "control?path=boardInfo&boardid="
						+ boardid + "&parentid=" + parentid);
				tourl = "announce.jsp";

				request.setAttribute("boardid", boardid);
				request.setAttribute("parentid", parentid);

			} else {// 参数错误时返回首页
				request.setAttribute("title", "访问错误");
				request.setAttribute("info", "您所访问的页面不存在！");
				request.setAttribute("url", "index.jsp");
			}
		} else if ("vote".equals(path)) {// 进入发起投票页面

			Object tmpboard = request.getParameter("boardid");
			Object tmpparent = request.getParameter("parentid");
			// 参数正确时进入发帖页面
			if (tmpboard != null || tmpparent != null) {
				int boardid = cutils.strToInt(request.getParameter("boardid"));
				int parentid = cutils
						.strToInt(request.getParameter("parentid"));
				BoardBiz boardbiz = new BoardBiz();
				Board board = new Board();
				board.setBoardid(boardid);
				board = (Board) boardbiz.searchById(1, board).get(0);
				String strBoard = board.getBoardType();
				request.setAttribute("boardInfo", strBoard);
				request.setAttribute("url", "control?path=boardInfo&boardid="
						+ boardid + "&parentid=" + parentid);
				tourl = "vote.jsp";

				request.setAttribute("boardid", boardid);
				request.setAttribute("parentid", parentid);

			} else {// 参数错误时返回首页
				request.setAttribute("title", "访问错误");
				request.setAttribute("info", "您所访问的页面不存在！");
				request.setAttribute("url", "index.jsp");
			}

		} else if ("reg".equals(path)) {// 跳转到注册
			tourl = "addReg.jsp";
		}
		// 查看详细信息
		else if ("selectMess".equals(path)) {
			Message message = new Message();
			List listMessage = new ArrayList();
			MessageBiz messagebiz = new MessageBiz();
			String source = request.getParameter("id");
			int id = cutils.strToInt(source);
			message.setId(id);
			listMessage = messagebiz.searchById(1, message);
			request.setAttribute("listMessage", listMessage);
			tourl = "message/detailed.jsp";
		}
		request.getRequestDispatcher(tourl).forward(request, response);

	}

	public void init() throws ServletException {
	}

}
