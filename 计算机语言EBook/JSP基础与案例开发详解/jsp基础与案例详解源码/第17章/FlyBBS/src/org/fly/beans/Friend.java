package org.fly.beans;

import java.io.Serializable;

public class Friend implements Serializable{
	private Integer f_id;

	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}

	public Integer getF_id() {
		return f_id;
	}

	private String f_username;

	public void setF_username(String f_username) {
		this.f_username = f_username;
	}

	public String getF_username() {
		return f_username;
	}

	private String f_friend;

	public void setF_friend(String f_friend) {
		this.f_friend = f_friend;
	}

	public String getF_friend() {
		return f_friend;
	}

	private String f_addtime;

	public void setF_addtime(String f_addtime) {
		this.f_addtime = f_addtime;
	}

	public String getF_addtime() {
		return f_addtime;
	}
}
