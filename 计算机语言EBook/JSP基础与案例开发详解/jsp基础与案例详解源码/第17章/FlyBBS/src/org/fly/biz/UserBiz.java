package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class UserBiz {
	ControlDB controlDB = null;

	public UserBiz() {
		controlDB = new ControlDB();
	}

	// ɾ���û���Ϣ
	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from user where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// ��ѯ�û���Ϣ
	public List searchById(int flag, User user) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {// ��ѯȫ���û���Ϣ��ID����
			sql = "select * from user order by UserID desc";
		} else if (flag == 1) {// ��ID���û���Ϣ
			sql = "select * from user where UserID=" + user.getUserID()
					+ " order by id desc";
		} else if (flag == 2) {// ���û�����������֤��¼
			sql = "select * from user where UserName='" + user.getUserName()
					+ "' and UserPassword='" + user.getUserPassword() + "'";
		} else if (flag == 3) {// ���û�����ѯ
			sql = "select * from User where UserName='" + user.getUserName()
					+ "'";
		} else if (flag == 4) {// ���û�����������֤��¼
			sql = "select * from user where UserName='" + user.getUserName()
					+ "' and UserPassword='" + user.getUserPassword()
					+ "' and bbstype=10 ";
		} else if (flag == 5) {// ��ע��ʱ��
			sql = "select * from user order by UserID desc limit 0,10";
		} else if (flag == 6) {// ����̳�����ܺ�
			sql = "select * from user u ,bbs b where b.state='1' and b.Child>0 and b.ParentID>0 group by u.UserID order by sum(b.AnnounceID) desc limit 0,10";
		} else {
			sql = "select * from user order by UserID desc";
		}
		try {
			list = controlDB.executeQueryUser(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(User user) {
		String sql = "insert into user(UserName,nickName,UserEmail,Article,UserPassword,sign,Sex,homepage,addDate,logins,face,width,height,qq,lastlogin,bbstype,lockuser,userWealth,userEP,userCP) values('"
				+ user.getUserName()
				+ "','"
				+ user.getNickName()
				+ "','"
				+ user.getUserEmail()
				+ "','"
				+ user.getArticle()
				+ "','"
				+ user.getUserPassword()
				+ "','"
				+ user.getSign()
				+ "','"
				+ user.getSex()
				+ "','"
				+ user.getHomepage()
				+ "','"
				+ user.getAddDate()
				+ "','"
				+ user.getLogins()
				+ "','"
				+ user.getFace()
				+ "','"
				+ user.getWidth()
				+ "','"
				+ user.getHeight()
				+ "','"
				+ user.getQq()
				+ "','"
				+ user.getLastlogin()
				+ "','"
				+ user.getBbstype()
				+ "','"
				+ user.getLockuser()
				+ "','"
				+ user.getUserWealth()
				+ "','"
				+ user.getUserEP() + "','" + user.getUserCP() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// �༭�û�������Ϣ
	public boolean editUser(User user) {
		String sql = "update user set nickName='" + user.getNickName()
				+ "',UserEmail='" + user.getUserEmail() + "',UserPassword='"
				+ user.getUserPassword() + "',sign='" + user.getSign()
				+ "',Sex='" + user.getSex() + "',face='" + user.getFace()
				+ "',qq='" + user.getQq() + "' where userID='"
				+ user.getUserID() + "'";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// �����û���Ϣ
	public boolean update(User user) {
		String sql = "update user set UserName='" + user.getUserName()
				+ "',UserEmail='" + user.getUserEmail() + "',Article='"
				+ user.getArticle() + "',UserPassword='"
				+ user.getUserPassword() + "',sign='" + user.getSign()
				+ "',Sex='" + user.getSex() + "',homepage='"
				+ user.getHomepage() + "',addDate='" + user.getAddDate()
				+ "',logins='" + user.getLogins() + "',face='" + user.getFace()
				+ "',width='" + user.getWidth() + "',height='"
				+ user.getHeight() + "',qq='" + user.getQq() + "',lastlogin='"
				+ user.getLastlogin() + "',bbstype='" + user.getBbstype()
				+ "',lockuser='" + user.getLockuser() + "',userWealth='"
				+ user.getUserWealth() + "',userEP='" + user.getUserEP()
				+ "',userCP='" + user.getUserCP() + "' where id='"
				+ user.getUserID() + "'";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// ɾ���û�
	public boolean delete(int id[]) {
		boolean flag = false;
		String sql[] = new String[id.length];
		for (int i = 0; i < sql.length; i++) {
			sql[i] = "delete from user where UserId=" + id[i];
		}
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
