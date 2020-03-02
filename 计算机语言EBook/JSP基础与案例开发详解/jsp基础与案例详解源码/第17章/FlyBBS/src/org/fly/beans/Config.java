package org.fly.beans;

import java.io.Serializable;

public class Config implements Serializable{
	private String forumName;// 论坛名
	private String forumURL;// 论坛地址
	private String companyName;// 公司名
	private String hostUrl; // 主页
	private String systemEmail;// 管理员邮箱
	private String logo; // 网站LOGO
	private Integer ipFlag; // 显示IP
	private Integer guestuser;// 显示游客
	private String ads1;// 首页广告
	private String ads2;// 尾页广告
	private String copyright;// 版权信息
	private String version;// 版本信息
	private String titleFlag;// 显示头衔
	private String uploadFlag;// 上像头像
	private Integer wealthReg;// 注册金钱
	private Integer wealthAnnounce;// 发帖金钱
	private Integer wealthReannounce;// 回复金钱
	private Integer wealthDel;// 删贴减金钱
	private Integer wealthLogin;// 登录加金钱
	private Integer epReg;// 注册经验值
	private Integer epAnnounce;// 发帖经验值
	private Integer epReannounce;// 回复经验值
	private Integer epDel;// 删贴经验值
	private Integer epLogin;// 登录加经验值
	private Integer cpReg;// 注册魅力
	private Integer cpAnnounce;// 发帖加魅力
	private Integer cpReannounce;// 回复加魅力
	private Integer cpDel;// 删贴减魅力
	private Integer cpLogin;// 登录加魅力
	private Integer maxonline;// 最大在线数
	private String maxonlineDate;// 最大在线数发生日期

	public void setForumName(String forumName) {
		this.forumName = forumName;
	}

	public String getForumName() {
		return forumName;
	}

	public void setForumURL(String forumURL) {
		this.forumURL = forumURL;
	}

	public String getForumURL() {
		return forumURL;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setHostUrl(String hostUrl) {
		this.hostUrl = hostUrl;
	}

	public String getHostUrl() {
		return hostUrl;
	}

	public void setSystemEmail(String systemEmail) {
		this.systemEmail = systemEmail;
	}

	public String getSystemEmail() {
		return systemEmail;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getLogo() {
		return logo;
	}

	public void setIpFlag(Integer ipFlag) {
		this.ipFlag = ipFlag;
	}

	public Integer getIpFlag() {
		return ipFlag;
	}

	public void setGuestuser(Integer guestuser) {
		this.guestuser = guestuser;
	}

	public Integer getGuestuser() {
		return guestuser;
	}

	public void setAds1(String ads1) {
		this.ads1 = ads1;
	}

	public String getAds1() {
		return ads1;
	}

	public void setAds2(String ads2) {
		this.ads2 = ads2;
	}

	public String getAds2() {
		return ads2;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getVersion() {
		return version;
	}

	public void setTitleFlag(String titleFlag) {
		this.titleFlag = titleFlag;
	}

	public String getTitleFlag() {
		return titleFlag;
	}

	public void setUploadFlag(String uploadFlag) {
		this.uploadFlag = uploadFlag;
	}

	public String getUploadFlag() {
		return uploadFlag;
	}

	public void setWealthReg(Integer wealthReg) {
		this.wealthReg = wealthReg;
	}

	public Integer getWealthReg() {
		return wealthReg;
	}

	public void setWealthAnnounce(Integer wealthAnnounce) {
		this.wealthAnnounce = wealthAnnounce;
	}

	public Integer getWealthAnnounce() {
		return wealthAnnounce;
	}

	public void setWealthReannounce(Integer wealthReannounce) {
		this.wealthReannounce = wealthReannounce;
	}

	public Integer getWealthReannounce() {
		return wealthReannounce;
	}

	public void setWealthDel(Integer wealthDel) {
		this.wealthDel = wealthDel;
	}

	public Integer getWealthDel() {
		return wealthDel;
	}

	public void setWealthLogin(Integer wealthLogin) {
		this.wealthLogin = wealthLogin;
	}

	public Integer getWealthLogin() {
		return wealthLogin;
	}

	public void setEpReg(Integer epReg) {
		this.epReg = epReg;
	}

	public Integer getEpReg() {
		return epReg;
	}

	public void setEpAnnounce(Integer epAnnounce) {
		this.epAnnounce = epAnnounce;
	}

	public Integer getEpAnnounce() {
		return epAnnounce;
	}

	public void setEpReannounce(Integer epReannounce) {
		this.epReannounce = epReannounce;
	}

	public Integer getEpReannounce() {
		return epReannounce;
	}

	public void setEpDel(Integer epDel) {
		this.epDel = epDel;
	}

	public Integer getEpDel() {
		return epDel;
	}

	public void setEpLogin(Integer epLogin) {
		this.epLogin = epLogin;
	}

	public Integer getEpLogin() {
		return epLogin;
	}

	public void setCpReg(Integer cpReg) {
		this.cpReg = cpReg;
	}

	public Integer getCpReg() {
		return cpReg;
	}

	public void setCpAnnounce(Integer cpAnnounce) {
		this.cpAnnounce = cpAnnounce;
	}

	public Integer getCpAnnounce() {
		return cpAnnounce;
	}

	public void setCpReannounce(Integer cpReannounce) {
		this.cpReannounce = cpReannounce;
	}

	public Integer getCpReannounce() {
		return cpReannounce;
	}

	public void setCpDel(Integer cpDel) {
		this.cpDel = cpDel;
	}

	public Integer getCpDel() {
		return cpDel;
	}

	public void setCpLogin(Integer cpLogin) {
		this.cpLogin = cpLogin;
	}

	public Integer getCpLogin() {
		return cpLogin;
	}

	public void setMaxonline(Integer maxonline) {
		this.maxonline = maxonline;
	}

	public Integer getMaxonline() {
		return maxonline;
	}

	public void setMaxonlineDate(String maxonlineDate) {
		this.maxonlineDate = maxonlineDate;
	}

	public String getMaxonlineDate() {
		return maxonlineDate;
	}
}
