package org.bzc.jpetstore.beans;

public class Profile {
	private String userid;

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserid() {
		return userid;
	}

	private String langpref;

	public void setLangpref(String langpref) {
		this.langpref = langpref;
	}

	public String getLangpref() {
		return langpref;
	}

	private String favcategory;

	public void setFavcategory(String favcategory) {
		this.favcategory = favcategory;
	}

	public String getFavcategory() {
		return favcategory;
	}

	private String mylistopt;

	public void setMylistopt(String mylistopt) {
		this.mylistopt = mylistopt;
	}

	public String getMylistopt() {
		return mylistopt;
	}

	private String banneropt;

	public void setBanneropt(String banneropt) {
		this.banneropt = banneropt;
	}

	public String getBanneropt() {
		return banneropt;
	}
}
