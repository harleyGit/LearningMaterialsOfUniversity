package org.fly.beans;

import java.io.Serializable;

public class Log implements Serializable{
	private Integer l_id;

	public void setL_id(Integer l_id) {
		this.l_id = l_id;
	}

	public Integer getL_id() {
		return l_id;
	}

	private String l_username;

	public void setL_username(String l_username) {
		this.l_username = l_username;
	}

	public String getL_username() {
		return l_username;
	}

	private String l_content;

	public void setL_content(String l_content) {
		this.l_content = l_content;
	}

	public String getL_content() {
		return l_content;
	}

	private String l_url;

	public void setL_url(String l_url) {
		this.l_url = l_url;
	}

	public String getL_url() {
		return l_url;
	}

	private String l_addtime;

	public void setL_addtime(String l_addtime) {
		this.l_addtime = l_addtime;
	}

	public String getL_addtime() {
		return l_addtime;
	}
}
