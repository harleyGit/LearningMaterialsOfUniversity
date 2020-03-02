package org.fly.beans;

import java.io.Serializable;

public class Online implements Serializable{
	private int id;// 主ID
	private String username;// 在线用户名
	private int bbstype;// 允许访问的类型
	private String ip;// IP地址
	private String startime;// 登录时间
	private String browser;// 正在访问的页面
	private int state;     //登录状态
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getBbstype() {
		return bbstype;
	}

	public void setBbstype(int bbstype) {
		this.bbstype = bbstype;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getStartime() {
		return startime;
	}

	public void setStartime(String startime) {
		this.startime = startime;
	}

	public String getBrowser() {
		return browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
