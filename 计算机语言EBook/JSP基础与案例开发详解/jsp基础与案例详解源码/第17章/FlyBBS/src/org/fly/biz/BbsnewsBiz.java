package org.fly.biz;

import java.util.ArrayList;
import java.util.List;

import org.fly.beans.Bbsnews;
import org.fly.db.ControlDB;

public class BbsnewsBiz {
	ControlDB controlDB = null;

	public BbsnewsBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from bbsnews where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, Bbsnews bbsnews) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {// 查询所有公告信息
			sql = "select * from bbsnews order by Boardid desc";
		} else if (flag == 1) {// 按ID查询单条公告信息
			sql = "select * from bbsnews where id=" + bbsnews.getId();
		} else if (flag == 2) {// 查询版块中的公告信息
			sql = "select * from bbsnews where boardid=" + bbsnews.getBoardid();
		}
		try {
			list = controlDB.executeQueryBbsnews(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Bbsnews bbsnews) {
		String sql = "insert into bbsnews(boardid,title,content,username,addtime) values('"
				+ bbsnews.getBoardid()
				+ "','"
				+ bbsnews.getTitle()
				+ "','"
				+ bbsnews.getContent()
				+ "','"
				+ bbsnews.getUsername()
				+ "','"
				+ bbsnews.getAddtime() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Bbsnews bbsnews) {
		String sql = "update bbsnews set boardid='" + bbsnews.getBoardid()
				+ "',title='" + bbsnews.getTitle() + "',content='"
				+ bbsnews.getContent() + "',username='" + bbsnews.getUsername()
				+ "',addtime='" + bbsnews.getAddtime() + "' where id='"
				+ bbsnews.getId() + "'";
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
