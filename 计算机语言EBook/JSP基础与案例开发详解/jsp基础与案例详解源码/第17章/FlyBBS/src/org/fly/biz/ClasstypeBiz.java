package org.fly.biz;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transaction;

import org.fly.beans.*;
import org.fly.db.*;

public class ClasstypeBiz {
	ControlDB controlDB = null;

	public ClasstypeBiz() {
		controlDB = new ControlDB();
	}

	// 删除论坛分类，同时删除分类下面的所有子版面及论坛帖子
	public boolean delete(int id) {
		boolean flag = false;
		String sql[] = new String[3];
		sql[0] = "delete from classtype where id=" + id;
		sql[1] = "delete from board where classtype=" + id;
		sql[2] = "delete from bbs where ParentID=" + id;

		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 查询版块类别
	public List searchById(int flag, Classtype classtype) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {// 查询全部
			sql = "select * from classtype order by id asc";
		} else if (flag == 1) {// 按ID查询单条记录
			sql = "select * from classtype where id=" + classtype.getId()
					+ " order by id desc";
		}
		try {
			list = controlDB.executeQueryClasstype(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Classtype classtype) {
		String sql = "insert into classtype(id,classType) values("
				+ classtype.getId() + ",'" + classtype.getClassType() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Classtype classtype) {
		String sql = "update classtype set classType='"
				+ classtype.getClassType() + "' where id='" + classtype.getId()
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
