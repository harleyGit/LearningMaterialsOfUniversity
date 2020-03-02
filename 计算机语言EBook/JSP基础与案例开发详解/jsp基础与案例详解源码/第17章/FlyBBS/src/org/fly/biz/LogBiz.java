package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class LogBiz {
	ControlDB controlDB = null;

	public LogBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from log where id=" + id;
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
			sql = "select * from log order by id desc";
		} else if (flag == 1) {
			sql = "select * from log where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryLog(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Log log) {
		String sql = "insert into log(l_id,l_username,l_content,l_url,l_addtime) values('"
				+ log.getL_id()
				+ "','"
				+ log.getL_username()
				+ "','"
				+ log.getL_content()
				+ "','"
				+ log.getL_url()
				+ "','"
				+ log.getL_addtime() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Log log) {
		String sql = "update log set l_username='" + log.getL_username()
				+ "',l_content='" + log.getL_content() + "',l_url='"
				+ log.getL_url() + "',l_addtime='" + log.getL_addtime()
				+ "' where id='" + log.getL_id() + "'";
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
