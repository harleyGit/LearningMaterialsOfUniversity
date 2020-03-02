package org.ly.bean;

import java.util.Date;

public class Message {
	private int id;//id
	private String name;//用户昵称
	private String motif;//留言主题
	private String context;//留言内容
	private String messageDate;//留言时间
	private String revert;//是否有管理员回复
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMotif() {
		return motif;
	}
	public void setMotif(String motif) {
		this.motif = motif;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	public String getRevert() {
		return revert;
	}
	public void setRevert(String revert) {
		this.revert = revert;
	}
}
