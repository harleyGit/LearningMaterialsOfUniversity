package org.fly.beans;

import java.io.Serializable;

public class Board implements Serializable{
	private Integer boardid;// 主键
	private String boardType;// 子论坛名
	private Integer classType;// 所属主论坛ID
	private String readme;// 简介
	private int moderid;   //斑竹ID
	private String boardMaster;// 管理员
	private Integer lockboard;// 是否锁定
	private String forumlogo;// 论坛Logo
	private String indexIMG;// 首页论坛图片
	private Integer lastrootid;// 最后发表帖子ID
	private String lasttitle;// 最后发表帖子标题
	private String boarduser;// 最后发现帖子作者
	private String lastposttime;// 最好发表帖子时间
	private String nickName;// 昵稱
	private int maxMotif;// 最多主题数
	private int maxNote;// 最多帖子数

	public Integer getBoardid() {
		return boardid;
	}

	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public Integer getClassType() {
		return classType;
	}

	public void setClassType(Integer classType) {
		this.classType = classType;
	}

	public String getReadme() {
		return readme;
	}

	public void setReadme(String readme) {
		this.readme = readme;
	}

	public String getBoardMaster() {
		return boardMaster;
	}

	public void setBoardMaster(String boardMaster) {
		this.boardMaster = boardMaster;
	}

	public Integer getLockboard() {
		return lockboard;
	}

	public void setLockboard(Integer lockboard) {
		this.lockboard = lockboard;
	}

	public String getForumlogo() {
		return forumlogo;
	}

	public void setForumlogo(String forumlogo) {
		this.forumlogo = forumlogo;
	}

	public String getIndexIMG() {
		return indexIMG;
	}

	public void setIndexIMG(String indexIMG) {
		this.indexIMG = indexIMG;
	}

	public Integer getLastrootid() {
		return lastrootid;
	}

	public void setLastrootid(Integer lastrootid) {
		this.lastrootid = lastrootid;
	}

	public String getLasttitle() {
		return lasttitle;
	}

	public void setLasttitle(String lasttitle) {
		this.lasttitle = lasttitle;
	}

	public String getBoarduser() {
		return boarduser;
	}

	public void setBoarduser(String boarduser) {
		this.boarduser = boarduser;
	}

	public String getLastposttime() {
		return lastposttime;
	}

	public void setLastposttime(String lastposttime) {
		this.lastposttime = lastposttime;
	}

	public int getMaxMotif() {
		return maxMotif;
	}

	public void setMaxMotif(int maxMotif) {
		this.maxMotif = maxMotif;
	}

	public int getMaxNote() {
		return maxNote;
	}

	public void setMaxNote(int maxNote) {
		this.maxNote = maxNote;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getModerid() {
		return moderid;
	}

	public void setModerid(int moderid) {
		this.moderid = moderid;
	}

}
