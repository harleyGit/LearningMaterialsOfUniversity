package org.fly.beans;

import java.io.Serializable;

public class User implements Serializable{
	private Integer userID;// 主键
	private String userName;// 用户名
	private String nickName;//  昵称
	private String userEmail;// 用户Email
	private Integer article;// 发表文章数
	private String userPassword;// 密码
	private String sign;// 个性签名
	private String sex;// 性别
	private String homepage;// 主页
	private String addDate;// 注册日期
	private Integer logins;// 登录次数
	private String face;// 头像
	private Integer height;// 头像高
	private Integer width;// 头像宽
	private String qq;// QQ号
	private String lastlogin;// 最后一次登录
	private Integer bbstype;// 允许访问的权限
	private Integer lockuser;// 锁定用户
	private Integer userWealth;// 用户金钱
	private Integer userEP;// 用户经验
	private Integer userCP;// 用户魅力

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public Integer getUserID() {
		return userID;
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

	public void setArticle(Integer article) {
		this.article = article;
	}

	public Integer getArticle() {
		return article;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getSign() {
		return sign;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSex() {
		return sex;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setLogins(Integer logins) {
		this.logins = logins;
	}

	public Integer getLogins() {
		return logins;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getFace() {
		return face;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getWidth() {
		return width;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getHeight() {
		return height;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	public String getLastlogin() {
		return lastlogin;
	}

	public void setBbstype(Integer bbstype) {
		this.bbstype = bbstype;
	}

	public Integer getBbstype() {
		return bbstype;
	}

	public void setLockuser(Integer lockuser) {
		this.lockuser = lockuser;
	}

	public Integer getLockuser() {
		return lockuser;
	}

	public void setUserWealth(Integer userWealth) {
		this.userWealth = userWealth;
	}

	public Integer getUserWealth() {
		return userWealth;
	}

	public void setUserEP(Integer userEP) {
		this.userEP = userEP;
	}

	public Integer getUserEP() {
		return userEP;
	}

	public void setUserCP(Integer userCP) {
		this.userCP = userCP;
	}

	public Integer getUserCP() {
		return userCP;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
