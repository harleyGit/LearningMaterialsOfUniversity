package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class BannerdataBiz {
	ControlDB controlDB = null;

	public BannerdataBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from bannerdata where id=" + id;
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
			sql = "select * from bannerdata order by id desc";
		} else if (flag == 1) {
			sql = "select * from bannerdata where id=" + id
					+ " order by id desc";
		}
		try {
			list = controlDB.executeQueryBannerdata(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Bannerdata bannerdata) {
		String sql = "insert into bannerdata(favcategory,bannername) values('"
				+ bannerdata.getFavcategory() + "','"
				+ bannerdata.getBannername() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Bannerdata bannerdata) {
		String sql = "update bannerdata set bannername='"
				+ bannerdata.getBannername() + "' where id='"
				+ bannerdata.getFavcategory() + "'";
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
