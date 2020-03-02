/**
 *  ClassName: TestPagerTagServlet.java
 *  created on 2009-03-20
 *  Copyrights 2009 qjyong All rights reserved.
 *  EMail: qjyong@gmail.com
 */
package com.qiujy.web.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 测试分页标签使用的Servlet
 * @author qiujy
 */
public class TestPagerTagServlet extends HttpServlet {

	private static final long serialVersionUID = -3305996070755176492L;

	private List<String> datas;
	public static final int PAGER_PAGESIZE = 10;
	
	public void init() throws ServletException {
		datas  = new ArrayList<String>();
		for(int i = 1; i <= 123; i++){
			datas.add("字符串" + i);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int recordCount = this.datas.size(); //获取总记录数

		//获取当前页号
		int pageNo = 1;  
		String pageNoStr = request.getParameter("pageNo");
		if(null != pageNoStr && !pageNoStr.equals("")){
			pageNo = Integer.parseInt(pageNoStr);
		}

		//获取分页数据
		int start = (pageNo - 1) * PAGER_PAGESIZE;
		int end = start + PAGER_PAGESIZE;
		if(end > this.datas.size()){
			end = this.datas.size();
		}
		List<String> results = this.datas.subList(start, end);
		
		//把分页数据和分页标签所需要的参数存放到request中
		request.setAttribute("datas", results);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageSize", PAGER_PAGESIZE);
		request.setAttribute("recordCount", recordCount);
		
		//转发请求到JSP页面
		request.getRequestDispatcher("/pager.jsp").forward(request, response);
	}
}