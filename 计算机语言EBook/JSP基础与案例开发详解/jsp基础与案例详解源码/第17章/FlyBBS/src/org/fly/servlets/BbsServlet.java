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

import org.apache.log4j.Logger;
import org.fly.beans.Bbs;
import org.fly.beans.Board;
import org.fly.beans.User;
import org.fly.beans.Vote;
import org.fly.biz.BbsBiz;
import org.fly.biz.BoardBiz;
import org.fly.biz.ClasstypeBiz;
import org.fly.biz.UserBiz;
import org.fly.biz.VoteBiz;
import org.fly.utils.ConvertUtil;
import org.fly.utils.UserUtils;

public class BbsServlet extends HttpServlet {
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
		List listBbs1 = new ArrayList();
		BbsBiz bbsbiz = new BbsBiz();
		String tourl = "error.jsp";

		if ("add".equals(path)) {
			User user = (User) session.getAttribute("user");
			if (null == user) {
				request.setAttribute("title", "验证身份出错 ");
				request.setAttribute("info", "读取身份信息出错，请您重新登录!");
				request.setAttribute("url", "login.jsp");
			} else {
				Logger log = Logger.getLogger(BbsServlet.class);
				String body = request.getParameter("content");
				String title = request.getParameter("ftitle");
				String heart = request.getParameter("heart");
				String type = request.getParameter("ftype");
				String ip = request.getLocalName();
				String boardid = request.getParameter("boardid");
				String parentid = request.getParameter("parentid");
				Bbs bbs = new Bbs();
				bbs.setParentID(cutils.strToInt(parentid));
				bbs.setChild(cutils.strToInt(request.getParameter("child")));
				bbs.setBoardID(cutils.strToInt(boardid));
				bbs.setUserName(user.getUserName());
				bbs.setUserEmail(user.getUserEmail());
				bbs.setTopic(user.getFace());
				bbs.setTitle(title);
				bbs.setBody(body);
				bbs.setDateAndTime(cutils.getTime());
				bbs.setHits(0);
				bbs.setIp(ip);
				bbs.setExpression("1024");
				bbs.setIstop(0);
				bbs.setIslock(0);
				bbs.setIsgood(0);
				int isvote=request.getParameter("isvote")==null?0:cutils.strToInt(request.getParameter("isvote"));
				bbs.setIsvote(isvote);
				bbs.setHeart(heart);
				bbs.setType(type);
				bbs.setState(1);
				bbsbiz.add(bbs);
				if (bbs.getChild() != 0) {
					int id = cutils.strToInt(request.getParameter("child"));
					bbs.setAnnounceID(id);
					bbs.setLastre(cutils.getTime());
					try {
						bbsbiz.update(1, bbs);
					} catch (Exception e) {

					}
					tourl = "bbs?path=noteInfo&AnnounceID=" + id;
				} else {
					tourl = "control?path=boardInfo&boardid=" + boardid
							+ "&parentid=" + parentid;
				}
				if (bbs.getIsvote() == 1) { // 如果为投票帖，则执行存储投票信息
					List votebbs = bbsbiz.searchById(0, null);
					bbs = (Bbs) votebbs.get(0);
					Vote vote = new Vote();
					VoteBiz votebiz = new VoteBiz();
					vote.setAnnounceid(bbs.getAnnounceID());
					vote.setVotenum(0);
					String str = request.getParameter("vote") + "\n";
					vote.setVotetype(cutils.strToInt(request
							.getParameter("votetype")));
					String[] tmp = str.split("\n");
					if (tmp.length > 10) {
						for (int i = 0; i < 10; i++) {
							vote.setVote(tmp[i]);
							votebiz.add(vote);
						}
					} else {
						for (String s : tmp) {
							if (s != null && !"".equals(s) && s.length() > 1) {
								vote.setVote(s);
								votebiz.add(vote);
							}
						}
					}
				}
			}
		} else if ("noteInfo".equals(path)) {// 进入显示帖子详细页面
			User t_user = (User) session.getAttribute("user");
			if (null == t_user) {
				request.setAttribute("title", "提示信息 ");
				request.setAttribute("info", "本版面只对注册用户开放，请您登录后再进行访问 !");
				request.setAttribute("url", "login.jsp");
				tourl = "error.jsp";
			} else {
				int id = cutils.strToInt(request.getParameter("AnnounceID"));
				bbsbiz = new BbsBiz();
				Bbs bbs = new Bbs();
				bbs.setAnnounceID(id);
				bbsbiz.update(2, bbs);
				bbs = (Bbs) bbsbiz.searchById(3, bbs).get(0);// 要显示的帖子信息

				UserUtils utils = new UserUtils();
				User user = new User();
				user = utils.getUserInfo(bbs.getUserName());

				// 保存每条帖子的用户信息
				bbs.setGrade(utils.getGrade(user.getUserEP()));// 用户等级
				bbs.setWealth(user.getUserWealth().toString()); // 用户金钱
				bbs.setEp(user.getUserEP().toString());// 用户经验值
				bbs.setCp(user.getUserCP().toString());// 用户魅力
				bbs.setRedate(user.getAddDate());// 用户注册日期
				bbs.setArticle(user.getArticle());// 用户发表文章数
				// 计算用户信息显示条长度
				bbs.setFwealth(utils.getWealth(user));// 用户金钱长度
				bbs.setFep(utils.getEP(user));// 用户经验值长度
				bbs.setFcp(utils.getCP(user));// 用户魅力长度

				request.setAttribute("note", bbs);// 记录帖子信息

				List<Bbs> temp = bbsbiz.searchById(4, bbs);// 临时存储回复贴

				List voteList = new ArrayList();
				if (bbs.getIsvote() == 1) {
					VoteBiz votebiz = new VoteBiz();
					Vote vote = new Vote();
					vote.setAnnounceid(id);
					List voteTmp = votebiz.searchById(2, vote);

					int maxVote = 1;
					for (int i = 0; i < voteTmp.size(); i++) {
						List tmp = new ArrayList();
						vote = (Vote) voteTmp.get(i);
						vote = (Vote) votebiz.searchById(3, vote).get(0);
						maxVote += vote.getVotenum();
						vote.setLenght(vote.getVotenum());
						voteList.add(vote);
					}
					request.setAttribute("votelist", voteList);
					request.setAttribute("max", maxVote);
				}
				// 获取主题贴发贴人信息
				List bbslist = new ArrayList();

				for (Bbs rebbs : temp) {
					user = new User();
					user = utils.getUserInfo(rebbs.getUserName());

					// 保存每条帖子的用户信息
					rebbs.setGrade(utils.getGrade(user.getUserEP()));// 用户等级
					rebbs.setWealth(user.getUserWealth().toString()); // 用户金钱
					rebbs.setEp(user.getUserEP().toString());// 用户经验值
					rebbs.setCp(user.getUserCP().toString());// 用户魅力
					rebbs.setRedate(user.getAddDate());// 用户注册日期
					rebbs.setArticle(user.getArticle());// 用户发表文章数
					// 计算用户信息显示条长度
					rebbs.setFwealth(utils.getWealth(user));// 用户金钱长度
					rebbs.setFep(utils.getEP(user));// 用户经验值长度
					rebbs.setFcp(utils.getCP(user));// 用户魅力长度
					bbslist.add(rebbs);
				}

				request.setAttribute("rebbs", bbslist);// 记录回复帖子

				// 查询当前版块信息
				BoardBiz boardbiz = new BoardBiz();
				Board board = new Board();
				board.setBoardid(bbs.getBoardID());
				board = (Board) boardbiz.searchById(1, board).get(0);
				request.setAttribute("BoardMaster", board.getBoardMaster());
				String strBoard = board.getBoardType();
				session.setAttribute("boardinfo", strBoard);

				request.setAttribute("url", "control?path=boardInfo&boardid="
						+ bbs.getBoardID() + "&day=4&parentid="
						+ bbs.getParentID());
				tourl = "moredis.jsp";
			}
		} else if ("torebbs".equals(path)) {// 预处理回复
			int id = cutils.strToInt(request.getParameter("AnnounceID"));
			String boardid = request.getParameter("boardid");
			String parentid = request.getParameter("parentid");
			bbsbiz = new BbsBiz();
			Bbs bbs = new Bbs();
			bbs.setAnnounceID(id);
			bbs = (Bbs) bbsbiz.searchById(3, bbs).get(0);// 要显示的帖子信息
			String cite = request.getParameter("cite");
			if (cite != null || cite != "") {
				// 执行引用操作
			}
			request.setAttribute("bbslist", bbs);
			request.setAttribute("boardid", boardid);
			request.setAttribute("parentid", parentid);
			request.setAttribute("AnnounceID", id);
			tourl = "rebbs.jsp";
		} else if ("searchnews".equals(path)) {// 删除帖子
			//
			ClasstypeBiz classbiz = new ClasstypeBiz();
			List classlist = classbiz.searchById(0, null);
			request.setAttribute("classtype", classlist);
		} else if ("dele".equals(path)) {// 删除帖子
			int id = cutils.strToInt(request.getParameter("bbsid"));
			int bid = cutils.strToInt(request.getParameter("bid"));
			int cid = cutils.strToInt(request.getParameter("cid"));
			bbsbiz.delete(id);
			tourl = "board?path=manage&bid=" + bid + "&cid=" + cid;
		} else if ("m_delete".equals(path)) {// 版主删除帖子m_edit_j
			int id = cutils.strToInt(request.getParameter("announceID"));
			int parentid = cutils.strToInt(request.getParameter("parentid"));
			int boardid = cutils.strToInt(request.getParameter("boardid"));
			Board board = new Board();
			BoardBiz boardbiz = new BoardBiz();
			board.setBoardid(boardid);
			List list = boardbiz.searchById(1, board);
			if(list.size()>0){
				board = (Board)list.get(0);
			}
			int bbstype = board.getLockboard();
			bbsbiz.m_delete(id); // 管理员只能修改帖子的状态，为删除状态，具体的删除由管理员统一删除
			tourl = "control?path=boardInfo&boardid=" + boardid + "&parentid="
					+ parentid + "&bbstype=" + bbstype + "&day=4";
		} else if ("m_delete_reply".equals(path)) {// 版主删除回复
			int announceID = cutils
					.strToInt(request.getParameter("announceID"));
			int replyid = cutils.strToInt(request.getParameter("replyid"));
			bbsbiz.m_delete_reply(replyid);
			tourl = "control?path=noteInfo&AnnounceID=" + announceID;
		} else if ("m_edit_j".equals(path)) {// 版主设置为精华
			int id = cutils.strToInt(request.getParameter("announceID"));
			bbsbiz.m_edit_j(0, id); // 设置为精华帖子
			tourl = "control?path=noteInfo&AnnounceID=" + id;
		} else if ("m_edit_top".equals(path)) {// 版主设置为置顶
			int id = cutils.strToInt(request.getParameter("announceID"));
			bbsbiz.m_edit_j(1, id); //锁定
			tourl = "control?path=noteInfo&AnnounceID=" + id;
		} else if ("m_edit_lock".equals(path)) {// 版主设置为锁定
			int id = cutils.strToInt(request.getParameter("announceID"));
			bbsbiz.m_edit_j(2, id); //锁定
			tourl = "control?path=noteInfo&AnnounceID=" + id;
		} else if ("quik".equals(path)) {// 快速回复主题贴
			String announceid = request.getParameter("announceid");
			// 快速恢复
			String userName = request.getParameter("userName");
			String pass = request.getParameter("userPassword");
			Bbs bbs = new Bbs();
			String content = request.getParameter("content");
			String title = request.getParameter("title");
			String pearentid = request.getParameter("parentID");
			String bordid = request.getParameter("boardID");
			bbs.setBody(content);
			bbs.setAnnounceID(cutils.strToInt(announceid));
			bbs.setBoardID(cutils.strToInt(bordid));
			bbs.setTitle(title);
			bbs.setParentID(cutils.strToInt(pearentid));
			// 增加点击率
			BbsBiz bbiz = new BbsBiz();
			bbiz.update(2, bbs);

			session.setAttribute("bbss", bbs);
			User user = new User();
			user.setUserName(userName);
			user.setUserPassword(pass);
			UserBiz userBiz = new UserBiz();
			List list = userBiz.searchById(2, user);
			if (list.size() > 0) {
				user = (User) list.get(0);
				String ip = request.getLocalName();
				bbs.setChild(cutils.strToInt(announceid));
				bbs.setUserName(user.getUserName());
				bbs.setUserEmail(user.getUserEmail());
				bbs.setTopic(user.getFace());
				bbs.setTitle(title);
				bbs.setDateAndTime(cutils.getTime());
				bbs.setHits(0);
				bbs.setIp(ip);
				bbs.setExpression("1024");
				bbs.setIstop(0);
				bbs.setIslock(0);
				bbs.setIsgood(0);
				bbs.setIsvote(0);
				bbs.setHeart("face3.gif");
				bbs.setType("回复");
				bbsbiz.add(bbs);
				tourl = "bbs?path=noteInfo&AnnounceID=" + bbs.getChild();

			} else {
				session.setAttribute("intoMess", "你还没有登陆，请先登陆");
				tourl = "bbs?path=noteInfo&AnnounceID=" + announceid;
			}
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
