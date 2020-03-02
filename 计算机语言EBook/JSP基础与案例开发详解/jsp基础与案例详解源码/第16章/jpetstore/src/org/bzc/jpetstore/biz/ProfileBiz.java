package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class ProfileBiz {
	ControlDB controlDB = null;

	public ProfileBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from profile where id=" + id;
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
			sql = "select * from profile order by id desc";
		} else if (flag == 1) {
			sql = "select * from profile where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryProfile(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Profile profile) {
		String sql = "insert into profile(userid,langpref,favcategory,mylistopt,banneropt) values('"
				+ profile.getUserid()
				+ "','"
				+ profile.getLangpref()
				+ "','"
				+ profile.getFavcategory()
				+ "','"
				+ profile.getMylistopt()
				+ "','" + profile.getBanneropt() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Profile profile) {
		String sql = "update profile set langpref='" + profile.getLangpref()
				+ "',favcategory='" + profile.getFavcategory()
				+ "',mylistopt='" + profile.getMylistopt() + "',banneropt='"
				+ profile.getBanneropt() + "' where id='" + profile.getUserid()
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
