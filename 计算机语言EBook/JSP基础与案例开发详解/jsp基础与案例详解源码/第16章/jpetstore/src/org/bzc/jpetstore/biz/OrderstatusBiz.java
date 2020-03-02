package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class OrderstatusBiz {
	ControlDB controlDB = null;

	public OrderstatusBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from orderstatus where id=" + id;
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
			sql = "select * from orderstatus order by id desc";
		} else if (flag == 1) {
			sql = "select * from orderstatus where id=" + id
					+ " order by id desc";
		}
		try {
			list = controlDB.executeQueryOrderstatus(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Orderstatus orderstatus) {
		String sql = "insert into orderstatus(orderid,linenum,timestamp,status) values('"
				+ orderstatus.getOrderid()
				+ "','"
				+ orderstatus.getLinenum()
				+ "','"
				+ orderstatus.getTimestamp()
				+ "','"
				+ orderstatus.getStatus() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Orderstatus orderstatus) {
		String sql = "update orderstatus set linenum='"
				+ orderstatus.getLinenum() + "',timestamp='"
				+ orderstatus.getTimestamp() + "',status='"
				+ orderstatus.getStatus() + "' where id='"
				+ orderstatus.getOrderid() + "'";
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
