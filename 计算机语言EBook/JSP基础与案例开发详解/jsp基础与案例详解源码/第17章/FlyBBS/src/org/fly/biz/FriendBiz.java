package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class FriendBiz {
	ControlDB controlDB = null;

	public FriendBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from friend where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, int id) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {
			sql = "select * from friend order by id desc";
		} else if (flag == 1) {
			sql = "select * from friend where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryFriend(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List searchFriend(String username) {
		String sql = "";
		List list = new ArrayList();
		sql = "select * from friend where F_username='"+username+"'";
		try {
			list = controlDB.executeQueryFriend(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean add(Friend friend) {
		String sql = "insert into friend(F_id,F_username,F_friend,F_addtime) values('"
				+ friend.getF_id()
				+ "','"
				+ friend.getF_username()
				+ "','"
				+ friend.getF_friend() + "','" + friend.getF_addtime() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Friend friend) {
		String sql = "update friend set F_username='" + friend.getF_username()
				+ "',F_friend='" + friend.getF_friend() + "',F_addtime='"
				+ friend.getF_addtime() + "' where id='" + friend.getF_id()
				+ "'";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
