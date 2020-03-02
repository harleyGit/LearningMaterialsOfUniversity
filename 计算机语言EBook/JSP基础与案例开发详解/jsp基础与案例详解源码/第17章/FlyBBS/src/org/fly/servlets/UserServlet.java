package org.fly.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fly.beans.Board;
import org.fly.beans.Config;
import org.fly.beans.Message;
import org.fly.beans.Online;
import org.fly.beans.User;
import org.fly.biz.BoardBiz;
import org.fly.biz.MessageBiz;
import org.fly.biz.OnlineBiz;
import org.fly.biz.UserBiz;
import org.fly.utils.ConvertUtil;

public class UserServlet extends HttpServlet {
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
		String path = request.getParameter("path");
		HttpSession session = request.getSession();
		ConvertUtil cutils = new ConvertUtil();
		List listUser = new ArrayList();
		UserBiz userbiz = new UserBiz();
		OnlineBiz onlinebiz = new OnlineBiz();
		User user = new User();
		String tourl = "error.jsp";
		String error = "";
		Config config = (Config) session.getAttribute("configlist");
		if (null == config && !"loginInAdmin".equals(path)
				&& !"admin_logout".equals(path)) {
			request.setAttribute("title", "���ݳ���");
			request.setAttribute("info", "�����ҳ���µ�¼��");
			request.setAttribute("url", "index.jsp");
		} else {
			if ("add".equals(path)) {// �û�ע��
				user.setUserName(request.getParameter("userName"));
				user.setUserEmail(request.getParameter("userEmail"));
				user.setArticle(0);// �ѷ����������
				user.setUserPassword(request.getParameter("psw"));
				user.setSign(request.getParameter("sign"));// ����ǩ��
				user.setSex(request.getParameter("sex"));// �Ա�
				user.setHomepage("www.fly.com");
				user.setAddDate(cutils.getTime());
				user.setLogins(0);// ��¼����
				user.setFace(request.getParameter("face"));// ͷ��
				user.setHeight(32);
				user.setWidth(32);
				user.setQq(request.getParameter("qq"));
				user.setBbstype(1);// ��ͨ��Ա���
				user.setLockuser(0);
				user.setUserWealth(config.getWealthReg());
				user.setUserEP(config.getCpReg());// �û�����
				user.setUserCP(config.getEpReg());// �û�����
				userbiz.add(user);
				tourl = "index.jsp";
			} else if ("edit".equals(path)) { // �޸��û�������Ϣ
				user.setUserID(cutils.strToInt(request.getParameter("userID")));
				user.setNickName(request.getParameter("nickName"));
				user.setUserEmail(request.getParameter("userEmail"));
				user.setUserPassword(request.getParameter("psw"));
				user.setSign(request.getParameter("sign"));// ����ǩ��
				user.setSex(request.getParameter("sex"));// �Ա�
				user.setFace(request.getParameter("face"));// ͷ��
				user.setQq(request.getParameter("qq"));
				boolean flag = userbiz.editUser(user);
				request.setAttribute("editOk", "OK");
				tourl = "user?path=preedit&username="
						+ request.getParameter("userName");
			} else if ("login".equals(path)) {// ��¼��̳
				Message message = new Message();
				user.setUserName(request.getParameter("userName"));
				user.setUserPassword(request.getParameter("userPassword"));
				List list = userbiz.searchById(2, user);
				MessageBiz messagebiz = new MessageBiz();
				message.setIncept(user.getUserName());
				List listMess = messagebiz.searchById(2, message);
				if (list.size() > 0) {
					user = (User) list.get(0);
					session.setAttribute("user", user);// ��¼��¼����û���Ϣ
					session.setAttribute("userName", user.getUserName());// ��¼�û���
					// session.setAttribute("news", user.getLockuser());
					session.setAttribute("news", listMess.size());
					session.setAttribute("bbstype", user.getBbstype());
					Online online = new Online();
					online = (Online) session.getAttribute("online");
					online.setUsername(user.getUserName());
					online.setBbstype(user.getBbstype());
					String t_onlineid = session.getAttribute("onlineid")
							.toString();
					if (t_onlineid != null) {
						int onlineid = cutils.strToInt(t_onlineid);
						online.setId(onlineid);
					}
					onlinebiz.update(online);
					session.setAttribute("online", online);
					String type = request.getParameter("type");
					if (!"admin".equals(type))
						tourl = "index.jsp";
					else
						tourl = "manager/admin_main.jsp";
				} else {
					request.setAttribute("title", "��¼ʧ�� ");
					request.setAttribute("info", "�û������벻��ȷ !");
					request.setAttribute("url", "login.jsp");

				}
			} else if ("search".equals(path)) {
				String type = request.getParameter("type");
				if ("top".equals(type))
					listUser = userbiz.searchById(0, null);
				else if ("user".equals(type))
					listUser = userbiz.searchById(5, null);
				else
					listUser = userbiz.searchById(6, null);
				int j = cutils.ifList(listUser, 10);
				List list = new ArrayList();
				// System.out.println(j);
				for (int i = 0; i < j; i++) {
					user = (User) listUser.get(i);
					list.add(user);
				}
				request.setAttribute("finduser", list);
				tourl = "memberList.jsp";
			} else if ("serch".equals(path)) {// ��ѯ�����û���Ϣ
				listUser = userbiz.searchById(0, null);
				String type = request.getParameter("type");
				if (listUser.size() > 0) {
					if ("top".equals(type))
						tourl = "memberList.jsp";
					else
						tourl = "manager/admin_user.jsp";
					request.setAttribute("finduser", listUser);
				} else {
					request.setAttribute("title", "��ѯ����");
					request.setAttribute("info", "��ѯ�û���Ϣ�����뷵�غ����²�ѯ��");
					request.setAttribute("url", "user?path=serch");
				}
			} else if ("pre_edit_moder".equals(path)) {// ��ѯ�����û���Ϣ���滻����ʹ��
				listUser = userbiz.searchById(0, null);
				request
						.setAttribute("boardid", request
								.getParameter("boardid"));
				request.setAttribute("finduser", listUser);
				tourl = "manager/admin_edit_moder.jsp";
			} else if ("edit_moder".equals(path)) {// ��ѯ�����û���Ϣ���滻����ʹ��
				String str_userID = request.getParameter("userID");
				String userName = request.getParameter("userName");
				int userID = cutils.strToInt(str_userID);
				user.setUserName(userName);
				List list = userbiz.searchById(3, user);
				if (list.size() > 0) {
					user = (User) list.get(0);
				} else {
					user.setNickName("��ȡ����");
				}
				String str_boardid = request.getParameter("boardid");
				BoardBiz boardbiz = new BoardBiz();
				Board board = new Board();
				int boardid = 0;
				if (str_boardid != null && !"".equals(str_boardid)) {
					boardid = cutils.strToInt(str_boardid);
					board.setBoardid(boardid);
					board.setModerid(userID);
					board.setBoardMaster(user.getNickName());
					boardbiz.edit_moder(board);
				}
				tourl = "board?path=m_moderators";
			} else if ("sechId".equals(path)) {
				String source = request.getParameter("id");
				int id = cutils.strToInt(source);
				user.setUserID(id);
				listUser = userbiz.searchById(1, user);
				request.setAttribute("finduser", listUser.get(0));
				tourl = "memberList.jsp";
			} else if ("sechByUserName".equals(path)) {
				// ��ѯ������û������û���
				String userName = request.getParameter("name");
				request.setAttribute("userName", userName);
				user.setUserName(userName);
				try {
					listUser = userbiz.searchById(3, user);
					request.setAttribute("listByName", listUser);
					tourl = "dispuser.jsp";
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("loginInAdmin".equals(path)) {
				// ��ѯ������û������û���
				String admin_name = request.getParameter("admin_name");
				String admin_pass = request.getParameter("admin_pass");
				String validateCode = request.getParameter("validateCode");
				String randNum = (String) session.getAttribute("rand");
				if (randNum != null) {
					if (randNum.equals(validateCode)) {
						user = new User();
						user.setUserName(admin_name);
						user.setUserPassword(admin_pass);
						List list = userbiz.searchById(4, user);
						if (list.size() > 0) {
							session.setAttribute("admin_name", admin_name);
							tourl = "manager/admin_main.jsp";
						} else {
							error = "��ʾ���û�������������!";
							tourl = "admin_login.jsp";
						}
					} else {
						tourl = "admin_login.jsp";
						error = "��ʾ����֤������!";
					}
				} else {
					error = "��ʾ����������ȷ����֤��!";
					tourl = "admin_login.jsp";
				}
				request.setAttribute("error", error);
			} else if ("preedit".equals(path)) {
				// ��ѯ������û������û���

				String userName = request.getParameter("username");
				user.setUserName(userName);
				try {
					listUser = userbiz.searchById(3, user);
					if (listUser.size() > 0) {
						user = (User) listUser.get(0);
						request.setAttribute("user", user);
					}
					tourl = "editUser.jsp";
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if ("seluser".equals(path)) { // ��ѯ�û���ϸ��Ϣ
				// ��ѯ������û������û���

				String userName = request.getParameter("username");
				user.setUserName(userName);
				try {
					listUser = userbiz.searchById(3, user);
					request.setAttribute("listByName", listUser);
					tourl = "dispuser.jsp";
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if ("admin_logout".equals(path)) { // ��ѯ�û���ϸ��Ϣ
				// ��ѯ������û������û���
				session.removeAttribute("admin_name");
				tourl = "admin_login.jsp";

			} else if ("sechByName".equals(path)) { // ���ٲ�ѯ��������
				String userName = request.getParameter("txtitle");
				user.setUserName(userName);
				try {
					listUser = userbiz.searchById(3, user);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (listUser.size() > 0) {
					request.setAttribute("finduser", listUser);
					String m_type = request.getParameter("type");
					if (m_type == null || "".equals(m_type)) {
						tourl = "manager/admin_user.jsp";
					} else {
						tourl = "manager/admin_edit_moder.jsp";
					}
				} else {
					request.setAttribute("title", "�����������ҳ���");
					request.setAttribute("info", "�����������ҳ����뷵�������޸�!");
					request.setAttribute("url", "board?path=boardinfo");
				}

			} else if ("dele".equals(path)) {
				// ����id��ɾ���û�
				String nums[] = request.getParameterValues("userID");
				int num[] = new int[nums.length];
				for (int i = 0; i < nums.length; i++) {
					num[i] = Integer.parseInt(nums[i]);
				}
				boolean falg = userbiz.delete(num);
				if (falg) {
					tourl = "user?path=serch";
				} else {
					request.setAttribute("title", "ɾ��������");
					request.setAttribute("info", "�����id��");
					request.setAttribute("url", "user?path=serch");

				}
			} else if ("update".equals(path)) {
				// ����id���޸��û���Ϣ
				int tmpid = cutils.strToInt(request.getParameter("id"));
				user.setUserID(tmpid);
				boolean flag = userbiz.update(user);
				listUser = userbiz.searchById(1, user);
				tourl = "";
				request.setAttribute("listUser", listUser);
			} else if ("toupdate".equals(path)) {
				int tmpid = cutils.strToInt(request.getParameter("id"));
				user.setUserID(tmpid);
				listUser = userbiz.searchById(1, user);
				tourl = "manager/toup.jsp";
				request.setAttribute("listtoup", listUser);
			} else if ("logout".equals(path)) {// �˳���¼
				String t_onlineid = session.getAttribute("onlineid").toString();
				if (t_onlineid != null) {
					int onlineid = cutils.strToInt(t_onlineid);
					onlinebiz.update(onlineid);
				}
				session.invalidate();
				tourl = "index.jsp";
			} else {
				tourl = "index.jsp";
			}
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
