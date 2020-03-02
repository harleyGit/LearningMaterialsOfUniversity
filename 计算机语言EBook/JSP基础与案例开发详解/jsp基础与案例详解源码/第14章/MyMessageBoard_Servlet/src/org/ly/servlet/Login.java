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
		String message = "����ԭ��";
		Admin admin = new Admin();
		admin.setUid(request.getParameter("uid"));
		admin.setPwd(request.getParameter("pwd"));
		String validatior = request.getParameter("validate");
		String ccode = (String) session.getAttribute("ccode");
		LoginDAOImpl impl = new LoginDAOImpl();
		//�ж���֤���Ƿ����
		if(ccode==null){
			session.setAttribute("message", "��ҳ�ѹ��ڣ������µ�¼��");
			response.sendRedirect("errors.jsp");
			return;
		}
		//��֤��¼
		if (impl.login(admin) && ccode.equals(validatior)) {
			// ��ֹ�ظ���¼
			if (!getRepeat(request, response)) {
				session.setAttribute("user", admin);
				session.setAttribute("admin",admin.getUid());
				response.sendRedirect("jsp/main.jsp");
			} else {
				session.setAttribute("message", "�����ظ���¼��лл��");
				response.sendRedirect("errors.jsp");
			}

		} else {//��֤�˴��Ĳ���
			if (!ccode.equals(validatior)) {
				message = message + "��֤�����.\n";
			}
			if (!impl.login(admin)) {
				message = message + "�û����������.\n";				
			}
			session.setAttribute("message", message);
			response.sendRedirect("errors.jsp");
		}		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);

	}
	//�Ƿ��ظ���¼�ķ�շ���
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
