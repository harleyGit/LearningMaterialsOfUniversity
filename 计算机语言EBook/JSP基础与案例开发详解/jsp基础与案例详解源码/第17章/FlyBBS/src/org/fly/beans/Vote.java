package org.fly.beans;

import java.io.Serializable;

public class Vote implements Serializable{
	private Integer voteid;

	public void setVoteid(Integer voteid) {
		this.voteid = voteid;
	}

	public Integer getVoteid() {
		return voteid;
	}

	private Integer announceid;

	public void setAnnounceid(Integer announceid) {
		this.announceid = announceid;
	}

	public Integer getAnnounceid() {
		return announceid;
	}

	private String vote;

	public void setVote(String vote) {
		this.vote = vote;
	}

	public String getVote() {
		return vote;
	}

	private int votenum;

	public void setVotenum(int votenum) {
		this.votenum = votenum;
	}

	public int getVotenum() {
		return votenum;
	}

	private String voteuser;

	public void setVoteuser(String voteuser) {
		this.voteuser = voteuser;
	}

	public String getVoteuser() {
		return voteuser;
	}

	private Integer votetype;

	public void setVotetype(Integer votetype) {
		this.votetype = votetype;
	}

	public Integer getVotetype() {
		return votetype;
	}

	private int lenght;

	public int getLenght() {
		return lenght;
	}

	public void setLenght(int lenght) {
		this.lenght = lenght;
	}
}
