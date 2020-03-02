package org.fly.beans;

import java.io.Serializable;

public class Message implements Serializable{
	private Integer id;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	private String sender;

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSender() {
		return sender;
	}

	private String incept;

	public void setIncept(String incept) {
		this.incept = incept;
	}

	public String getIncept() {
		return incept;
	}

	private String title;

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	private String content;

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	private Integer flag;

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public Integer getFlag() {
		return flag;
	}

	private String sendtime;

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public String getSendtime() {
		return sendtime;
	}

	private Integer delR;

	public void setDelR(Integer delR) {
		this.delR = delR;
	}

	public Integer getDelR() {
		return delR;
	}

	private Integer delS;

	public void setDelS(Integer delS) {
		this.delS = delS;
	}

	public Integer getDelS() {
		return delS;
	}

	private Integer isSend;

	public void setIsSend(Integer isSend) {
		this.isSend = isSend;
	}

	public Integer getIsSend() {
		return isSend;
	}
}
