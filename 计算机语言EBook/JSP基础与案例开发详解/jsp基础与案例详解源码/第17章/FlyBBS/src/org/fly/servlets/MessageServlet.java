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

public class MessageServlet extends HttpServlet {
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
		List listMessage = new ArrayList();
		MessageBiz messagebiz = new MessageBiz();
		User user = new User();
		UserBiz userbiz = new UserBiz();
		Friend friend = new Friend();
		FriendBiz friendbiz = new FriendBiz();
		String tourl = "";
		String error = "";

		// �����Ϣ
		if ("add".equals(path)) {
			String incept = request.getParameter("incept");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String name = (String) session.getAttribute("userName");
			Message message = new Message();
			message.setSender(name);
			message.setIncept(incept);
			message.setTitle(title);
			message.setContent(content);
			message.setFlag(0);
			message.setSendtime(cutils.getTime());
			message.setDelR(0);
			message.setDelS(0);
			message.setIsSend(1);
			boolean flag = messagebiz.add(message);
			if (flag) {
				tourl = "index.jsp";
			} else {
				tourl = "error.jsp";
			}
		}
		// ɾ����Ϣ
		else if ("delete".equals(path)) {
			String deleteid = request.getParameter("action");
			String name = (String) session.getAttribute("userName");
			boolean flag = false;

			if ("ɾ��ѡ����Ϣ".equals(deleteid)) {
				String id[] = request.getParameterValues("id");
				for (int i = 0; i < id.length; i++) {
					// ɾ��ѡ�е���Ϣ
					flag = messagebiz.delete(cutils.strToInt(id[i]));
				}
				if (flag) {
					tourl = "mess?path=select";
				} else {
					tourl = "error.jsp";
				}
			} else if ("д����Ϣ".equals(deleteid)) {
				tourl = "message/news.jsp";
			} else {
				// ɾ�����Ķ�����Ϣ
				flag = messagebiz.deleteMess();
				if (flag) {
					tourl = "mess?path=select";
				} else {
					tourl = "error.jsp";
				}
			}
			Message message = new Message();
			messagebiz = new MessageBiz();
			message.setIncept(name);
			List list = messagebiz.searchById(2, message);
			session.setAttribute("news", list.size());
		}
		// ��ѯ��Ϣ
		else if ("select".equals(path)) {
			String incept = request.getParameter("incept");
			listMessage = messagebiz.searchByName(incept);
			request.setAttribute("listMessage", listMessage);
			tourl = "message/inquiry.jsp";
		} else if ("reply".equals(path)) {
			String incept = request.getParameter("incept");
			String sender = request.getParameter("sender");
			request.setAttribute("incept", incept);
			request.setAttribute("sender", sender);
			tourl = "message/news.jsp";
		} else if ("talk".equals(path)) {
			// ׼�����Ͷ���Ϣ
			String sender = (String)session.getAttribute("userName");
			if(sender==null||"".equals(sender)){
				request.setAttribute("title", "��ʾ��Ϣ ");
				request.setAttribute("info", "������ֻ��ע���û����ţ�������¼���ٽ��з��� !");
				request.setAttribute("url", "login.jsp");
				tourl = "error.jsp";
			}else{
				String incept = request.getParameter("uname");
				request.setAttribute("incept", incept);
				request.setAttribute("sender", sender);
				tourl = "usersms.jsp";
			}
		} else if ("talkOk".equals(path)) {// ׼�����Ͷ���Ϣ
			Message message = new Message();
			String sender = request.getParameter("sender");
			if(sender==null||"".equals(sender)){
				request.setAttribute("title", "��ʾ��Ϣ ");
				request.setAttribute("info", "������ֻ��ע���û����ţ�������¼���ٽ��з��� !");
				request.setAttribute("url", "login.jsp");
				tourl = "error.jsp";
			}else{
				message.setSender(sender);
				message.setIncept(request.getParameter("incept"));
				message.setTitle(request.getParameter("title"));
				message.setContent(request.getParameter("content"));
				message.setFlag(0);
				message.setSendtime(cutils.getTime());
				message.setDelR(0);
				message.setDelS(0);
				message.setIsSend(1);
				boolean flag = messagebiz.add(message);
				if(flag){
					request.setAttribute("sendOk", "SENDOK");
				}
				tourl="user?path=serch&type=top";
			}
		} else if ("talkOk2".equals(path)) {// ׼�����Ͷ���Ϣ
			Message message = new Message();
			String sender = (String)request.getSession().getAttribute("userName");
			if(sender==null||"".equals(sender)){
				request.setAttribute("title", "��ʾ��Ϣ ");
				request.setAttribute("info", "������ֻ��ע���û����ţ�������¼���ٽ��з��� !");
				request.setAttribute("url", "login.jsp");
				tourl = "error.jsp";
			}else{
				message.setSender(sender);
				message.setIncept(request.getParameter("incept"));
				message.setTitle(request.getParameter("title"));
				message.setContent(request.getParameter("content"));
				message.setFlag(0);
				message.setSendtime(cutils.getTime());
				message.setDelR(0);
				message.setDelS(0);
				message.setIsSend(1);
				boolean flag = messagebiz.add(message);
				if(flag){
					request.setAttribute("sendOk", "SENDOK");
				}
				tourl="mess?path=select&incept="+request.getParameter("sender");
			}
		}
		// ��ѯ��ϸ��Ϣ
		else if ("selectid".equals(path)) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			// ��Ϣ��ʱ ������Ϣ״̬�����޸�
			boolean flag = messagebiz.userUpdate(name);
			if (flag) {
				tourl = "control?path=selectMess&id=" + id;
			}
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
