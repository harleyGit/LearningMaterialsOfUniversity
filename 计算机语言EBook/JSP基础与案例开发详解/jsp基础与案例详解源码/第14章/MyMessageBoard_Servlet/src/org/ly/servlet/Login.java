package org.ly.servlet;

/***
 * This servlet is for login
 */

import java.io.IOException;
import java.util.List;
import org.ly.listener.loginListener;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ly.bean.Admin;
import org.ly.dao.impl.LoginDAOImpl;

public class Login extends HttpServlet {

	public void destroy() {
		super.destroy();

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String message = "错误原因：";
		Admin admin = new Admin();
		admin.setUid(request.getParameter("uid"));
		admin.setPwd(request.getParameter("pwd"));
		String validatior = request.getParameter("validate");
		String ccode = (String) session.getAttribute("ccode");
		LoginDAOImpl impl = new LoginDAOImpl();
		//判断验证码是否过期
		if(ccode==null){
			session.setAttribute("message", "网页已过期，请重新登录。");
			response.sendRedirect("errors.jsp");
			return;
		}
		//验证登录
		if (impl.login(admin) && ccode.equals(validatior)) {
			// 防止重复登录
			if (!getRepeat(request, response)) {
				session.setAttribute("user", admin);
				session.setAttribute("admin",admin.getUid());
				response.sendRedirect("jsp/main.jsp");
			} else {
				session.setAttribute("message", "请勿重复登录，谢谢！");
				response.sendRedirect("errors.jsp");
			}

		} else {//验证了错后的操作
			if (!ccode.equals(validatior)) {
				message = message + "验证码错误.\n";
			}
			if (!impl.login(admin)) {
				message = message + "用户名密码错误.\n";				
			}
			session.setAttribute("message", message);
			response.sendRedirect("errors.jsp");
		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}
	//是否重复登录的封闭方法
	public static boolean getRepeat(HttpServletRequest request,
			HttpServletResponse response) {
		boolean falg = false;
		List list = loginListener.list;
		for (int i = 0; i < list.size(); i++) {
			Admin ad = (Admin) (list.get(i));			
			if (request.getParameter("uid").equals(ad.getUid())) {
				falg = true;
			}
		}
		return falg;
	}

	public void init() throws ServletException {

	}

}
