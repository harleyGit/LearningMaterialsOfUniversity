package org.bzc.jpetstore.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bzc.jpetstore.beans.Category;
import org.bzc.jpetstore.beans.Product;
import org.bzc.jpetstore.biz.CategoryBiz;
import org.bzc.jpetstore.biz.ProductBiz;

public class IndexServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		CategoryBiz categorybiz = new CategoryBiz();
		String tourl = "";
        HttpSession session = request.getSession();
		List<Category> list = new ArrayList<Category>();
		try {
			list = categorybiz.searchById(0, "");
			tourl = "/catalog/Main.jsp";
		} catch (Exception e) {
			tourl = "index.html";
			e.printStackTrace();
		}
		session.setAttribute("categroyList", list);

		request.getRequestDispatcher(tourl).forward(request, response);
			}
}
