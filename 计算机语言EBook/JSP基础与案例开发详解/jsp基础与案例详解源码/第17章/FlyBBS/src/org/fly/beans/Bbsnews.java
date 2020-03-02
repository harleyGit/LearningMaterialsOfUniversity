package org.fly.beans;

import java.io.Serializable;

public class Bbsnews implements Serializable{
	private Integer id;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	private Integer boardid;

	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}

	public Integer getBoardid() {
		return boardid;
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

	private String username;

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	private String addtime;

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getAddtime() {
		return addtime;
	}
}
