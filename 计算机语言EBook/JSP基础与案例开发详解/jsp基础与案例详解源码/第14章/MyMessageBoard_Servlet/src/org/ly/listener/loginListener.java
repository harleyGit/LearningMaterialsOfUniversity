package org.ly.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.ly.bean.Admin;

public class loginListener implements HttpSessionAttributeListener {

	public static List list = new ArrayList();

	// Ìí¼Ó¼àÌý
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		if (arg0.getName().equals("user")) {
			Admin admin = (Admin) arg0.getValue();
			list.add(admin);
		}
	}

	// ÒÆ³ý¼àÌý
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		try {
			int n = 0;
			Admin admin = (Admin) arg0.getValue();
			for (int i = 0; i < list.size(); i++) {
				Admin admin2 = (Admin) list.get(i);
				if (admin.getUid().equals(admin2.getUid())) {
					n = i;
					break;
				}
			}
			list.remove(n);
		} catch (Exception e) {
		}
	}

	// ¸²¸Ç¼àÌý
	public void attributeReplaced(HttpSessionBindingEvent arg0) {

	}

}
