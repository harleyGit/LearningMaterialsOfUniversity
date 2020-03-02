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
		// ������ҳ
		if ("index".equals(path)) {
			Online online = (Online) session.getAttribute("online");
			if (online == null) {
				online = new Online();
				online.setUsername("�ο�");
				online.setBbstype(0);
				online.setIp(request.getRemoteAddr());
				online.setStartime(cutils.getTime());
				online.setBrowser("index");
				session.setAttribute("online", online);
			}

			if (session.getAttribute("u_state") != "1") {
				int id = onlinebiz.add(online); //
				session.setAttribute("onlineid", id);// ��������û���״̬ID
				session.setAttribute("u_state", "1");
			}
			// ��ȡ��̳���
			ClasstypeBiz classbiz = new ClasstypeBiz();
			List classlist = classbiz.searchById(0, null);
			request.setAttribute("classtype", classlist);

			// ��ȡ��̳�����Ϣ
			BoardBiz boardbiz = new BoardBiz();
			List templist = boardbiz.searchById(0, null);
			List boardlist = new ArrayList();

			// ��ȡ���һ��ע���û���Ϣ.
			UserBiz userbiz = new UserBiz();
			List userlist = userbiz.searchById(0, null);
			User user = new User();
			user = (User) userlist.get(0);
			session.setAttribute("lastuser", user);
			session.setAttribute("usernum", userlist.size());
			for (int i = 0; i < templist.size(); i++) {
				Bbs bbs = new Bbs();
				Board board = (Board) templist.get(i);
				bbs.setBoardID(board.getBoardid());// �������ID
				bbs.setParentID(board.getClassType());// ������̳ID
				bbs.setAnnounceID(0);
				BbsBiz bbsbiz = new BbsBiz();
				int maxNote = bbsbiz.searchById(1, bbs).size();// ��ѯ�������������еķ�����¼
				List list = bbsbiz.searchById(2, bbs);
				int maxMotif = list.size();// ��ѯ����µ���������
				List maxZhuTi = bbsbiz.searchById(4, bbs);// ��ѯ��������

				// ����2��Session���ڱ�����̳������������������
				session.setAttribute("maxZhuTi", maxZhuTi.size());// �������

				List maxbbs = bbsbiz.searchById(0, null);// ��ѯ��������
				session.setAttribute("maxbbs", maxbbs.size());// �������

				List listtoday = bbsbiz.searchById(5, null);// ��ý��췢����
				session.setAttribute("today", listtoday.size());

				if (list.size() > 0) {
					bbs = (Bbs) list.get(0);
					board.setMaxMotif(maxMotif);
					board.setMaxNote(maxNote);

					board.setLastposttime(bbs.getDateAndTime());// ��󷢱�����ʱ��
					board.setLastrootid(bbs.getAnnounceID());// ��󷢱�����ID
					board.setLasttitle(bbs.getTitle());// ��󷢱����ӱ���
					board.setBoarduser(bbs.getUserName());// �������������
					user.setUserName(bbs.getUserName());
					List ulist = userbiz.searchById(3, user);
					if (ulist.size() > 0) {
						user = (User) ulist.get(0);
					} else {
						user.setNickName("��ȡ����");
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

			// ��ȡϵͳ��Ϣ
			String osname = System.getProperty("os.name");// ����ϵͳ��
			String ip = request.getRemoteAddr();// IP��ַ
			// IE�汾
			String ie = request.getHeader("user-agent");
			StringTokenizer st = new StringTokenizer(ie, ";");
			st.nextToken();
			String browser = st.nextToken();
			// ���汾����Ϣ������IP������ϵͳ����������汾
			session.setAttribute("osname", osname);
			session.setAttribute("ip", ip);
			session.setAttribute("ie", browser);

			session.setAttribute("boardlist", boardlist);
			Board board = new Board();
			if(boardlist.size()>0){
				board = (Board) boardlist.get(0);
			}

			// ��ȡ������Ϣ
			BbsnewsBiz bbsnewbiz = new BbsnewsBiz();
			Bbsnews bbsnew = new Bbsnews();
			bbsnew.setBoardid(0);
			List bbsnewlist = bbsnewbiz.searchById(2, bbsnew);
			request.setAttribute("bbsnews", bbsnewlist);

			// ��ȡ�����û��б���Ϣ

			List onlineList = onlinebiz.searchById(4, null);
			for (int i = 0; i < onlineList.size(); i++) {
				Online t_online = new Online();
				t_online = (Online) onlineList.get(i);
				String online_name = t_online.getUsername();
				String onlineid = session.getAttribute("onlineid").toString();
			}
			List userList = onlinebiz.searchById(4, null);
			int maxManager = onlinebiz.searchById(3, null).size();// ��Ա��������
			int maxGuest = onlinebiz.searchById(2, null).size() - maxManager;// ��������ο���

			session.setAttribute("maxManager", maxManager);
			session.setAttribute("maxGuest", maxGuest);
			session.setAttribute("userList", userList);

			// ��վ��Ϣ
			ConfigBiz configbiz = new ConfigBiz();
			List configlist = configbiz.searchById();
			Config config = (Config) configlist.get(0);
			session.setAttribute("configlist", config);

			tourl = "main.jsp";

		} else if ("boardInfo".equals(path)) {// ������
			// ��ѯ����е�����������
			String bbstype = request.getParameter("bbstype");
			if ("3".equals(bbstype)) {// ��̳�ȼ�Ϊ������̳ʱ
				tourl = "discuss.jsp";
			} else {
				User user = (User) session.getAttribute("user");
				if (null == user) {
					request.setAttribute("title", "��ʾ��Ϣ ");
					request.setAttribute("info", "������ֻ��ע���û����ţ�������¼���ٽ��з��� !");
					request.setAttribute("url", "login.jsp");
					tourl = "error.jsp";
				} else {
					int purview = 0;
					if (bbstype != null) {
						purview = cutils.strToInt(bbstype);// ת����̳Ȩ��ΪINT����
					}
					if (user.getBbstype() < purview) {
						request.setAttribute("title", "��ʾ��Ϣ ");
						request.setAttribute("info", "��ķ���Ȩ�޲������޷����ʴ˰��� !");
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
			List<Bbs> temp = bbsbiz.searchById(2, bbs);// ��������Ϣ
			List<Bbs> bbslist = new ArrayList<Bbs>();// ���ڴ洢���յĲ�ѯ���
			// ����ѭ����¼ÿ������������������
			//String source = request.getParameter("day");
			//int day = cutils.strToInt(source);
			for (Bbs rebbs : temp) {
				List list = bbsbiz.searchById(4, rebbs);
				rebbs.setReBbs(list.size());// ������
				if (list.size() > 0) {
					bbs = (Bbs) list.get(list.size() - 1);
					rebbs.setLasttime(bbs.getDateAndTime().substring(11));// ���ظ�ʱ��
					rebbs.setLastUser(bbs.getUserName());// ���ظ���
				} else {
					rebbs.setLasttime("���޻ظ�");// ���ظ�ʱ��
					rebbs.setLastUser("���޻ظ�");// ���ظ���
				}

				// ����ÿ�����ӵ�ȫ����Ϣ
				bbslist.add(rebbs);
			}

			// ��ѯ��ǰ���Ĺ�����Ϣ
			BbsnewsBiz bbsnewsbiz = new BbsnewsBiz();
			Bbsnews bbsnews = new Bbsnews();
			bbsnews.setBoardid(boardid);
			List bbsnewslist = bbsnewsbiz.searchById(2, bbsnews);

			// ��ѯ��ǰ�����Ϣ
			BoardBiz boardbiz = new BoardBiz();
			Board board = new Board();
			board.setBoardid(boardid);
			board = (Board) boardbiz.searchById(1, board).get(0);
			String strBoard = board.getBoardType();
			String strBoardMaster = board.getBoardMaster();
			request.setAttribute("bbstype", bbstype);
			request.setAttribute("master", strBoardMaster);// ��¼������Ϣ
			request.setAttribute("boardid", boardid);// ���ڰ��
			request.setAttribute("parentid", parentid);// ������̳
			session.setAttribute("boardinfo", strBoard);// �����Ϣ
			request.setAttribute("bbsnews", bbsnewslist);// �����б�
			request.setAttribute("bbs", bbslist);// //�����б�

			// �����б���ת�����Ϣ
			Object o = session.getAttribute("boardlist");
			if (null == o) {
				List templist = boardbiz.searchById(0, null);
				session.setAttribute("boardlist", templist);
			}

		} else if ("selectJump".equals(path)) {// �����б��ѯ
			String source = request.getParameter("id");
			int id = cutils.strToInt(source);
		} else if ("newNote".equals(path)) {// ���뷢��ҳ��

			Object tmpboard = request.getParameter("boardid");
			Object tmpparent = request.getParameter("parentid");
			// ������ȷʱ���뷢��ҳ��
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

			} else {// ��������ʱ������ҳ
				request.setAttribute("title", "���ʴ���");
				request.setAttribute("info", "�������ʵ�ҳ�治���ڣ�");
				request.setAttribute("url", "index.jsp");
			}
		} else if ("vote".equals(path)) {// ���뷢��ͶƱҳ��

			Object tmpboard = request.getParameter("boardid");
			Object tmpparent = request.getParameter("parentid");
			// ������ȷʱ���뷢��ҳ��
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

			} else {// ��������ʱ������ҳ
				request.setAttribute("title", "���ʴ���");
				request.setAttribute("info", "�������ʵ�ҳ�治���ڣ�");
				request.setAttribute("url", "index.jsp");
			}

		} else if ("reg".equals(path)) {// ��ת��ע��
			tourl = "addReg.jsp";
		}
		// �鿴��ϸ��Ϣ
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
