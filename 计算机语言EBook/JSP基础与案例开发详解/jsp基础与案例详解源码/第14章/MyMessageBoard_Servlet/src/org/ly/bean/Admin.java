package org.ly.bean;
/***
 * JavaBean for login
 * @author guest1
 *
 */
public class Admin {
	private int id;
	private String uid;
	private String pwd;

	public Admin() {
		super();
	}

	public Admin(int id, String uid, String pwd) {
		this.uid = uid;
		this.pwd = pwd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
