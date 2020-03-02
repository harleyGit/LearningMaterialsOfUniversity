package org.fly.beans;

import java.io.Serializable;

public class Bbs implements Serializable{
	private Integer announceID; // 主键ID
	private Integer parentID;// 论坛ID
	private Integer child;// 所属主题ID
	private Integer boardID;// 版块ID
	private String userName;// 发表人名称
	private String userEmail;// 发表人EMail
	private String topic;// 头像
	private String title;// 帖子标题
	private String body;// 内容
	private String dateAndTime;// 发布时间
	private Integer hits;// 点击率
	private String ip;// ip地址
	private String expression;// 经验值
	private Integer istop;// 是否为置顶
	private Integer islock;// 是否为锁定
	private Integer isgood;// 是否为精华
	private Integer isvote; // 是否为投票
	private String heart;// 心情
	private String type;// 帖子类型
	private String lastre;// 最后回复时间
private int state;
	// 封闭User信息用于显示每条帖子的用户信息。
	// 这些数据并不存在于Bbs表中，只是用于临时读取数据用
	private int grade;// 用户等级
	private String wealth; // 用户金钱
	private String ep;// 用户经验值
	private String cp;// 用户魅力

	private float fwealth; // 用户金钱长度
	private float fep;// 用户经验值长度
	private float fcp;// 用户魅力长度
	private String redate;// 用户注册日期
	private int article;// 用户发表文章数

	private int reBbs;// 回帖数
	private String lasttime;// 最后回复时间
	private String lastUser;// 最后回复人

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
