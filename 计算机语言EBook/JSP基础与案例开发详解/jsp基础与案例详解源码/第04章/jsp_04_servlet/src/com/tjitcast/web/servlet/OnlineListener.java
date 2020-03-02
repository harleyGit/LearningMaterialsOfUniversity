package com.tjitcast.web.servlet;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineListener implements ServletContextListener,
		HttpSessionAttributeListener, HttpSessionListener {
	private ServletContext application = null;

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void contextInitialized(ServletContextEvent arg0) {
		this.application = arg0.getServletContext();
		this.application.setAttribute("online", new LinkedList<String>());

	}

	public void attributeAdded(HttpSessionBindingEvent arg0) {
		List<String> online = (List<String>) this.application
				.getAttribute("online");
		if ("username".equals(arg0.getName())) {
			online.add((String) arg0.getValue());
		}
		this.application.setAttribute("online", online);
	}

	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		List<String> online = (List<String>) this.application
				.getAttribute("online");
		String username = (String) arg0.getSession().getAttribute("username");
		online.remove(username);
		this.application.setAttribute("online", online);
	}

}
