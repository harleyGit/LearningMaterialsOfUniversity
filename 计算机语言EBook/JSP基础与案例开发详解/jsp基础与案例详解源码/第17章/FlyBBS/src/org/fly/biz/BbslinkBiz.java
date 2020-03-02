package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class BbslinkBiz {
	ControlDB controlDB = null;

	public BbslinkBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from bbslink where id=" + id;
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
			sql = "select * from bbslink order by id desc";
		} else if (flag == 1) {
			sql = "select * from bbslink where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryBbslink(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Bbslink bbslink) {
		String sql = "insert into bbslink(boardname,readme,url) values('"
				+ bbslink.getBoardname() + "','" + bbslink.getReadme() + "','"
				+ bbslink.getUrl() + "')";
		boolean flag = false;
		try {

			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Bbslink bbslink) {
		String sql = "update bbslink set boardname='" + bbslink.getBoardname()
				+ "',readme='" + bbslink.getReadme() + "',url='"
				+ bbslink.getUrl() + "' where id='" + bbslink.getId() + "'";
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
