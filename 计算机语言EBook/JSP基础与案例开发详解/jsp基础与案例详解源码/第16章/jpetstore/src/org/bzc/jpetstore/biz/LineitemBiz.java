package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class LineitemBiz {
	ControlDB controlDB = null;

	public LineitemBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from lineitem where id=" + id;
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
			sql = "select * from lineitem order by id desc";
		} else if (flag == 1) {
			sql = "select * from lineitem where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryLineitem(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Lineitem lineitem) {
		String sql = "insert into lineitem(orderid,linenum,itemid,quantity,unitprice) values('"
				+ lineitem.getOrderid()
				+ "','"
				+ lineitem.getLinenum()
				+ "','"
				+ lineitem.getItemid()
				+ "','"
				+ lineitem.getQuantity()
				+ "','"
				+ lineitem.getUnitprice() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Lineitem lineitem) {
		String sql = "update lineitem set linenum='" + lineitem.getLinenum()
				+ "',itemid='" + lineitem.getItemid() + "',quantity='"
				+ lineitem.getQuantity() + "',unitprice='"
				+ lineitem.getUnitprice() + "' where id='"
				+ lineitem.getOrderid() + "'";
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
