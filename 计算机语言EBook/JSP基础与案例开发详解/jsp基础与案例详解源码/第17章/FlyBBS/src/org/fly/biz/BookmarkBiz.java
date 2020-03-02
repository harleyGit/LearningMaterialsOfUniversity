package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class BookmarkBiz {
	ControlDB controlDB = null;

	public BookmarkBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from bookmark where id=" + id;
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
			sql = "select * from bookmark order by id desc";
		} else if (flag == 1) {
			sql = "select * from bookmark where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryBookmark(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Bookmark bookmark) {
		String sql = "insert into bookmark(id,username,url,topic,addtime) values('"
				+ bookmark.getId()
				+ "','"
				+ bookmark.getUsername()
				+ "','"
				+ bookmark.getUrl()
				+ "','"
				+ bookmark.getTopic()
				+ "','"
				+ bookmark.getAddtime() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Bookmark bookmark) {
		String sql = "update bookmark set username='" + bookmark.getUsername()
				+ "',url='" + bookmark.getUrl() + "',topic='"
				+ bookmark.getTopic() + "',addtime='" + bookmark.getAddtime()
				+ "' where id='" + bookmark.getId() + "'";
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
