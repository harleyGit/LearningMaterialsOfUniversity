package org.fly.beans;

import java.io.Serializable;

public class Board implements Serializable{
	private Integer boardid;// ����
	private String boardType;// ����̳��
	private Integer classType;// ��������̳ID
	private String readme;// ���
	private int moderid;   //����ID
	private String boardMaster;// ����Ա
	private Integer lockboard;// �Ƿ�����
	private String forumlogo;// ��̳Logo
	private String indexIMG;// ��ҳ��̳ͼƬ
	private Integer lastrootid;// ��󷢱�����ID
	private String lasttitle;// ��󷢱����ӱ���
	private String boarduser;// �������������
	private String lastposttime;// ��÷�������ʱ��
	private String nickName;// �ǷQ
	private int maxMotif;// ���������
	private int maxNote;// ���������

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
