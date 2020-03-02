package org.bzc.jpetstore.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.bzc.jpetstore.utils.*;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.biz.*;

public class OrdersServlet extends HttpServlet {
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
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		String tourl = "/account/SignonForm.jsp";
		String path = request.getParameter("path");
		HttpSession session = request.getSession();
		if("neworderform".equals(path)){
			Signon signon = (Signon) session.getAttribute("user");
			if (null != signon) {
				String userid = signon.getUsername();
				AccountBiz accountBiz = new AccountBiz();
				List accountlist = accountBiz.searchById(1, userid);
				if(accountlist.size()>0){
					Account account = (Account)accountlist.get(0);
					session.setAttribute("account", account);
					tourl = "/order/NewOrderForm.jsp";
				}
			} else {
				tourl = "/account/SignonForm.jsp";
			}
		}else if("newOrder".equals(path)){
			Orders order=new Orders();
			Signon signon=(Signon)session.getAttribute("user");
			order.setUserid(signon.getUsername());
			order.setOrderdate(new Date(0));
			order.setBilladdr1(request.getParameter("billAddress1"));
			order.setBilladdr2(request.getParameter("."));
			order.setBillcity(request.getParameter("billCity"));
			order.setBillcountry(request.getParameter("billCountry"));
			order.setBillstate(request.getParameter("billState"));
			order.setBilltofirstname(request.getParameter("billToFirstName"));
			order.setBilltolastname(request.getParameter("billToLastName"));
			order.setBillzip(request.getParameter("billZip"));
			OrdersBiz ordersbiz = new OrdersBiz();
			ordersbiz.add(order);
			
			session.setAttribute("order", order);
			tourl="/order/NewOrderForm.jsp";
		}
		
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
