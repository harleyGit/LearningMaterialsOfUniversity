package com.tjitcast.mvc;

public class UserCheckBean {
	UserBean userbean = null;

	public UserCheckBean(UserBean userbean) {
		this.userbean = userbean;
	}

	public boolean validate() {
		boolean flag = false;
		if (null != userbean) {
			if (userbean.getName().equals("zah")
					&& userbean.getPassword().equals("zah")) {
				flag = true;
			}
		}
		return flag;
	}
}
