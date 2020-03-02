package org.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ly.bean.Message;
import org.ly.dao.LoginDAO;
import org.ly.dao.impl.LoginDAOImpl;

public class MessageBiz extends HttpServlet {

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		LoginDAO impl = new LoginDAOImpl();
		Message message = new Message();
		if (type.equals("insert")) {
			message.setName(this.getHtml(request.getParameter("name")));
			message.setMotif(this.getHtml(request.getParameter("motif")));
			String context = request.getParameter("context");
			String ccode = (String) session.getAttribute("ccode");
			String validate = request.getParameter("validate");
			if (validate == null || validate == "" || context == null
					|| context == "" || !validate.equals(ccode)) {
				String error = "";
				if (context == null || context == "") {
					error = error + "留言内容不能为空！";
				}
				if (validate == null || validate == ""
						|| !validate.equals(ccode)) {
					error = error + "验证码不正确！";
				}
				session.setAttribute("message", error);
				response.sendRedirect("errors.jsp");
				return;
			} else {
				context = this.getHtml(context);
				message.setContext(context);
			}

			if (impl.insertMessage(message)) {
				response.sendRedirect("index.html");
			} else {
				session.setAttribute("message", "留言失败，请重新填写留言。");
				response.sendRedirect("errors.jsp");
			}
		} else if (type.equals("repeat")) {
			Message me = new Message();
			me.setName((String) session.getAttribute("admin"));
			int id = Integer.parseInt(request.getParameter("id"));
			me.setId(id);
			String context = request.getParameter("context");
			String ccode = (String) session.getAttribute("ccode");
			String validate = request.getParameter("validate");
			if (validate == null || validate == "" || context == null
					|| context == "" || !validate.equals(ccode)) {
				String error = "";
				if (context.equals(null) || "".equals(context)) {
					error = error + "回复内容不能为空！";
				}
				if (validate == null || validate == ""
						|| !validate.equals(ccode)) {
					error = error + "验证码不正确！";
				}
				session.setAttribute("message", error);
				response.sendRedirect("errors.jsp");
				return;
			} else {
				context = this.getHtml(context);
				me.setContext(context);
			}

			if (impl.repeatMessage(me)) {
				response.sendRedirect("index.html");
			} else {
				session.setAttribute("message", "留言失败，请重新填写留言。");
				response.sendRedirect("errors.jsp");
			}
		} else if (type.equals("updata")) {
			Message me = new Message();
			String motif = "无主题";
			int id = Integer.parseInt(request.getParameter("id"));
			me.setId(id);
			if (request.getParameter("motif") != null
					|| request.getParameter("motif") != "") {
				motif = request.getParameter("motif");
			}
			String context = request.getParameter("context");
			String ccode = (String) session.getAttribute("ccode");
			String validate = request.getParameter("validate");		
			if (validate == null || validate == "" || context == null
					|| context == "" || !validate.equals(ccode)) {
				String error = "";
				if (context.equals(null) || "".equals(context)) {
					error = error + "留言内容不能为空！";
				}
				if (validate == null || validate == ""
						|| !validate.equals(ccode)) {
					error = error + "验证码不正确！";
				}
				session.setAttribute("message", error);
				response.sendRedirect("errors.jsp");
				return;
			} else {
				context = this.getHtml(context);
				motif = this.getHtml(motif);
				me.setMotif(motif);
				me.setContext(context);
			}

			if (impl.updataMessage(me)) {
				response.sendRedirect("index.html");
			} else {
				session.setAttribute("message", "修改留言失败，请重新修改留言。");
				response.sendRedirect("errors.jsp");
			}
		} else if (type.equals("like")) {
			String keyworld = request.getParameter("keyworld");			
			if (keyworld.equals(null) || "".equals(keyworld)) {
				session.setAttribute("message", "请输入查询关键字.");
				response.sendRedirect("errors.jsp");
			}else{
				session.setAttribute("like", keyworld);					
				response.sendRedirect("jsp/selectbylike.jsp");
			}			
		}
	}

	public void init() throws ServletException {
	}

	public static String getHtml(String s) {
		char c[] = s.toCharArray();
		char ch;
		StringBuffer buf = new StringBuffer();
		for (int i = 0, size = c.length; i < size; i++) {
			ch = c[i];
			if (ch == '"') {
				buf.append("&quot;");
			} else if (ch == '&') {
				buf.append("&amp;");
			} else if (ch == '<') {
				buf.append("&lt;");
			} else if (ch == '>') {
				buf.append("&gt;");
			} else if (ch == '\n') {
				// buf.append("<br>");
			} else if (ch == ' ') {
				buf.append("&nbsp;");
			} else {
				buf.append(ch);
			}
		}
		c = null;
		return buf.toString();
	}
}
