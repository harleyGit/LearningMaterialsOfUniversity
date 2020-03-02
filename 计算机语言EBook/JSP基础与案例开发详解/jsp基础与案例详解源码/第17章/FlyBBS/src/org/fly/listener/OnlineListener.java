package org.fly.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.fly.beans.Online;
import org.fly.beans.User;
import org.fly.biz.OnlineBiz;
import org.fly.utils.ConvertUtil;

/*******************************************************************************
 * 监听在线用户信息
 * 
 */
public class OnlineListener implements HttpSessionListener,
		HttpSessionAttributeListener {
	private static int activeSessions = 0;
	private static Map<String, User> online = new HashMap<String, User>();

	public static Map<String, User> getOnline() {
		return online;
	}

	public static int getActiveSessions() {
		return activeSessions;
	}

	public void attributeAdded(HttpSessionBindingEvent event) {
		if (event.getName().equals("users")) {
			System.out.println("User logged in.");
			User users = (User) event.getSession().getAttribute("user");
			online.put(event.getSession().getId(), users);
		}
	}

	public synchronized void attributeRemoved(HttpSessionBindingEvent event) {
		if (event.getName().equals("users")) {
			System.out.println("User logged out.");
			online.remove(event.getSession().getId());
		}
	}

	public void attributeReplaced(HttpSessionBindingEvent event) {
	}

	public void sessionCreated(HttpSessionEvent event) {
		activeSessions++;
		HttpSession session = event.getSession();
		OnlineBiz onlineBiz = new OnlineBiz();
		Online online = (Online) session.getAttribute("online");
		if (online != null) {
			onlineBiz.update(online);
		}
		System.out.println("有人来了");
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		if (activeSessions > 0) {
			activeSessions--;
			HttpSession session = event.getSession();
			ConvertUtil cutils = new ConvertUtil();
			OnlineBiz onlinebiz = new OnlineBiz();
			String t_onlineid = session.getAttribute("onlineid").toString();
			if(t_onlineid!=null){
				int onlineid = cutils.strToInt(t_onlineid);
				onlinebiz.update(onlineid);
			}
			System.out.println("有人走了");
		}
	}
}