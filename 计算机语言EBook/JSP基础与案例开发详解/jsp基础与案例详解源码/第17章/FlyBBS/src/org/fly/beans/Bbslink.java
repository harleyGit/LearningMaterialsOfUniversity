package org.fly.beans;

import java.io.Serializable;

public class Bbslink implements Serializable{
	private Integer id;

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	private String boardname;

	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}

	public String getBoardname() {
		return boardname;
	}

	private String readme;

	public void setReadme(String readme) {
		this.readme = readme;
	}

	public String getReadme() {
		return readme;
	}

	private String url;

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}
}
