package org.fly.beans;

import java.io.Serializable;

public class Online implements Serializable{
	private int id;// ��ID
	private String username;// �����û���
	private int bbstype;// ������ʵ�����
	private String ip;// IP��ַ
	private String startime;// ��¼ʱ��
	private String browser;// ���ڷ��ʵ�ҳ��
	private int state;     //��¼״̬
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
