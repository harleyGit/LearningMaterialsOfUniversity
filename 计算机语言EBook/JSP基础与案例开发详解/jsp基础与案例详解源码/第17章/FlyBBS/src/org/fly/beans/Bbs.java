package org.fly.beans;

import java.io.Serializable;

public class Bbs implements Serializable{
	private Integer announceID; // ����ID
	private Integer parentID;// ��̳ID
	private Integer child;// ��������ID
	private Integer boardID;// ���ID
	private String userName;// ����������
	private String userEmail;// ������EMail
	private String topic;// ͷ��
	private String title;// ���ӱ���
	private String body;// ����
	private String dateAndTime;// ����ʱ��
	private Integer hits;// �����
	private String ip;// ip��ַ
	private String expression;// ����ֵ
	private Integer istop;// �Ƿ�Ϊ�ö�
	private Integer islock;// �Ƿ�Ϊ����
	private Integer isgood;// �Ƿ�Ϊ����
	private Integer isvote; // �Ƿ�ΪͶƱ
	private String heart;// ����
	private String type;// ��������
	private String lastre;// ���ظ�ʱ��
private int state;
	// ���User��Ϣ������ʾÿ�����ӵ��û���Ϣ��
	// ��Щ���ݲ���������Bbs���У�ֻ��������ʱ��ȡ������
	private int grade;// �û��ȼ�
	private String wealth; // �û���Ǯ
	private String ep;// �û�����ֵ
	private String cp;// �û�����

	private float fwealth; // �û���Ǯ����
	private float fep;// �û�����ֵ����
	private float fcp;// �û���������
	private String redate;// �û�ע������
	private int article;// �û�����������

	private int reBbs;// ������
	private String lasttime;// ���ظ�ʱ��
	private String lastUser;// ���ظ���

	public void setAnnounceID(Integer announceID) {
		this.announceID = announceID;
	}

	public Integer getAnnounceID() {
		return announceID;
	}

	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}

	public Integer getParentID() {
		return parentID;
	}

	public void setChild(Integer child) {
		this.child = child;
	}

	public Integer getChild() {
		return child;
	}

	public void setBoardID(Integer boardID) {
		this.boardID = boardID;
	}

	public Integer getBoardID() {
		return boardID;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getTopic() {
		return topic;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getBody() {
		return body;
	}

	public void setDateAndTime(String dateAndTime) {
		this.dateAndTime = dateAndTime;
	}

	public String getDateAndTime() {
		return dateAndTime;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public Integer getHits() {
		return hits;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getIp() {
		return ip;
	}

	public void setExpression(String expression) {
		this.expression = expression;
	}

	public String getExpression() {
		return expression;
	}

	public void setIstop(Integer istop) {
		this.istop = istop;
	}

	public Integer getIstop() {
		return istop;
	}

	public void setIsvote(Integer isvote) {
		this.isvote = isvote;
	}

	public Integer getIsvote() {
		return isvote;
	}

	public Integer getIslock() {
		return islock;
	}

	public void setIslock(Integer islock) {
		this.islock = islock;
	}

	public Integer getIsgood() {
		return isgood;
	}

	public void setIsgood(Integer isgood) {
		this.isgood = isgood;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getWealth() {
		return wealth;
	}

	public void setWealth(String wealth) {
		this.wealth = wealth;
	}

	public String getEp() {
		return ep;
	}

	public void setEp(String ep) {
		this.ep = ep;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public float getFwealth() {
		return fwealth;
	}

	public void setFwealth(float fwealth) {
		this.fwealth = fwealth;
	}

	public float getFep() {
		return fep;
	}

	public void setFep(float fep) {
		this.fep = fep;
	}

	public float getFcp() {
		return fcp;
	}

	public void setFcp(float fcp) {
		this.fcp = fcp;
	}

	public String getRedate() {
		return redate;
	}

	public void setRedate(String redate) {
		this.redate = redate;
	}

	public int getArticle() {
		return article;
	}

	public void setArticle(int article) {
		this.article = article;
	}

	public int getReBbs() {
		return reBbs;
	}

	public void setReBbs(int reBbs) {
		this.reBbs = reBbs;
	}

	public String getLasttime() {
		return lasttime;
	}

	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}

	public String getLastUser() {
		return lastUser;
	}

	public void setLastUser(String lastUser) {
		this.lastUser = lastUser;
	}

	public String getLastre() {
		return lastre;
	}

	public void setLastre(String lastre) {
		this.lastre = lastre;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}
