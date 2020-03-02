package com.tjitcast.web.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	FilterConfig config;
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		String encoding = config.getInitParameter("encoding");
		if(null!=encoding&&!"".equals(encoding)){
			//req.setCharacterEncoding(encoding);
			res.setCharacterEncoding(encoding);
		}
		chain.doFilter(req, res);
	}

	public void init(FilterConfig config) throws ServletException {
		this.config=config;
		
	}

}
