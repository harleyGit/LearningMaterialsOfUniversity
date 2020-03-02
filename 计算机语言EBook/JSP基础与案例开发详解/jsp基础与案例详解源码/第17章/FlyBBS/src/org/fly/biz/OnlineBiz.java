package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class OnlineBiz {
	ControlDB controlDB = null;

	public OnlineBiz() {
		controlDB = new ControlDB();
	}

	// 删除在线用户信息=====当用户退出网站时使用
	public boolean delete(Online online) {
		boolean flag = false;
		String sql = "delete from online where startime="
				+ online.getStartime();
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 查询在线用户信息
	public List searchById(int flag, Online online) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {// 查询全部信息
			sql = "select * from online order by bbstype desc";
		} else if (flag == 1) {// 按登录时间查询一条用户信息
			sql = "select * from online where startime=" + online.getStartime()
					+ " order by id desc";
		} else if (flag == 2) {// 查询全部在线游客信息
			sql = "select * from online where bbstype=0 and state=1";
		} else if (flag == 3) {// 查询全部在线会员信息
			sql = "select * from online where bbstype>0 and state=1";
		} else if (flag == 4) {// 查询全部在线游客信息
			sql = "select * from online where state=1";
		}
		try {
			list = controlDB.executeQueryOnline(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int add(Online online) {
		int id = 0;
		String sql = "insert into online(username,bbstype,ip,startime,browser,state) values('"
				+ online.getUsername()
				+ "',"
				+ online.getBbstype()
				+ ",'"
				+ online.getIp()
				+ "','"
				+ online.getStartime()
				+ "','"
				+ online.getBrowser() + "',1)";
		try {
			controlDB.executeUpdate(sql);
			String sql2 = "select * from online where username='"
					+ online.getUsername() + "' and bbstype=" + online.getBbstype()
					+ " and ip='" + online.getIp() + "' and startime='"
					+ online.getStartime() + "' and browser='"
					+ online.getBrowser() + "' and state=1";
			List list = controlDB.executeQueryOnline(sql2);
			if (list.size() > 0) {
				online = (Online) list.get(0);
				id = online.getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	public boolean update(Online online) {
		boolean flag = false;
		String sql = "update online set username='" + online.getUsername()
				+ "',bbstype=" + online.getBbstype() + " where id="
				+ online.getId();
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(int id) {
		String sql = "update online set state=0 where id=" + id;
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
