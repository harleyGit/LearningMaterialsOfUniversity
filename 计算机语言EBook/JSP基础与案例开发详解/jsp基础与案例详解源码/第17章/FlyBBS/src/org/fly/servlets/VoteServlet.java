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

public class VoteServlet extends HttpServlet {
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
		String path = request.getParameter("path");
		HttpSession session = request.getSession();
		ConvertUtil cutils = new ConvertUtil();
		List listVote = new ArrayList();
		VoteBiz votebiz = new VoteBiz();
		String tourl = "";
		String error = "";
		if ("add".equals(path)) {
			int announceid = cutils
					.strToInt(request.getParameter("Announceid"));
			int votetype = cutils.strToInt(request.getParameter("votetype"));
			Vote vote = new Vote();
			vote.setAnnounceid(announceid);
			if (votetype == 0) {
				vote.setVote(request.getParameter("vote"));
				votebiz.update(vote);
			} else {
				String[] str = request.getParameterValues("vote");
				for (String s : str) {
					vote.setVote(s);
					votebiz.update(vote);
				}
			}

			tourl = "bbs?path=noteInfo&AnnounceID=" + announceid;
		} else if ("dele".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = votebiz.delete(tmpid);
			listVote = votebiz.searchById(0, null);
			tourl = "";
			session.setAttribute("listVote", listVote);
		} else if ("update".equals(path)) {
			Vote vote = new Vote();
			int tmpid = cutils.strToInt(request.getParameter("id"));
			boolean flag = votebiz.update(vote);
			listVote = votebiz.searchById(0, null);
			tourl = "";
			session.setAttribute("listVote", listVote);
		} else if ("toupdate".equals(path)) {
			int tmpid = cutils.strToInt(request.getParameter("id"));
			Vote vote = (Vote) votebiz.searchById(0, null).get(0);
			tourl = "";
			session.setAttribute("vote", vote);
		} else {
			listVote = votebiz.searchById(0, null);
			tourl = "";
			session.setAttribute("listVote", listVote);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
