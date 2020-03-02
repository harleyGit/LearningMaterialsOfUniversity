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

public class ProductServlet extends HttpServlet {
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
		List listProduct = new ArrayList();
		ProductBiz productbiz = new ProductBiz();
		ItemBiz itembiz = new ItemBiz();
		String tourl = "";
		if ("show".equals(path)) {
			String productId = request.getParameter("productId");
			try {
				List<Item> itemList = itembiz.searchByproductId(productId);
				Product product = (Product) productbiz.searchById(1, productId)
						.get(0);

				session.setAttribute("itemList", itemList);
				session.setAttribute("product", product);
			} catch (Exception e) {
				e.printStackTrace();
			}
			tourl = "/catalog/Product.jsp";
		} else {
			listProduct = productbiz.searchById(0, "");
			tourl = "index.html";
			session.setAttribute("listProduct", listProduct);
		}
		request.getRequestDispatcher(tourl).forward(request, response);
	}
}
