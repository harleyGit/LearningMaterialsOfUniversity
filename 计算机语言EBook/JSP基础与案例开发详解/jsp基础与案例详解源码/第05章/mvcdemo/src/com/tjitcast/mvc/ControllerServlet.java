package com.tjitcast.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControllerServlet extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	request.setCharacterEncoding("GBK");
	response.setContentType("text/html;charset=GBK");
	String action=request.getParameter("action");
	if(!isValidated(request)&&!("login".equals(action))){
		gotoPage("login.html",request,response);
		return;
	}
	if("login".equals(action)){
		UserBean user = new UserBean();
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		UserCheckBean uc = new UserCheckBean(user);
		if(uc.validate()){
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
			gotoPage("welcome.jsp",request,response);
		}else{
			gotoPage("loginerr.jsp",request,response);
		}
	}
}

	public boolean isValidated(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			return true;
		} else
			return false;
	}

	public void gotoPage(String targetURL, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(targetURL);
		rd.forward(request, response);
	}
}
