package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class CategoryBiz {
	ControlDB controlDB = null;

	public CategoryBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from category where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, String catid) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {
			sql = "select * from category";
		} else if (flag == 1) {
			sql = "select * from category where catid='" + catid + "'";
		}
		System.out.println(sql);
		try {
			list = controlDB.executeQueryCategory(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Category category) {
		String sql = "insert into category(catid,name,descn) values('"
				+ category.getCatid() + "','" + category.getName() + "','"
				+ category.getDescn() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Category category) {
		String sql = "update category set name='" + category.getName()
				+ "',descn='" + category.getDescn() + "' where id='"
				+ category.getCatid() + "'";
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
