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
import org.bzc.jpetstore.utils.*;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.biz.*;
import org.bzc.jpetstore.beans.Product;

public class CategoryServlet extends HttpServlet {
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
		List listCategory = new ArrayList();
		CategoryBiz categorybiz = new CategoryBiz();
		ProductBiz productBiz = new ProductBiz();
		String tourl = "";
		if ("show".equals(path)) {
			String categoryId = request.getParameter("categoryId");
			if(categoryId!=null){
				List<Product> list;
				try {
					list = productBiz.searchBycategoryId(categoryId);
					session.setAttribute("productList", list);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			tourl = "/catalog/Category.jsp";
		} else {
			listCategory = categorybiz.searchById(0, "");
			tourl = "index.html";
			session.setAttribute("listCategory", listCategory);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
