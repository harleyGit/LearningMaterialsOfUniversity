package org.ly.filter;
/**
 * unification character -->utf-8
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Character implements Filter {

	private String ccode;
	public void destroy() {

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
			req.setCharacterEncoding(ccode);
			chain.doFilter(req,res);
	}

	public void init(FilterConfig config) throws ServletException {		
		ccode = config.getInitParameter("ccode");
	}

}
