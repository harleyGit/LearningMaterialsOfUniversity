package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class SupplierBiz {
	ControlDB controlDB = null;

	public SupplierBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from supplier where id=" + id;
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
			sql = "select * from supplier order by id desc";
		} else if (flag == 1) {
			sql = "select * from supplier where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQuerySupplier(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Supplier supplier) {
		String sql = "insert into supplier(suppid,name,status,addr1,addr2,city,state,zip,phone) values('"
				+ supplier.getSuppid()
				+ "','"
				+ supplier.getName()
				+ "','"
				+ supplier.getStatus()
				+ "','"
				+ supplier.getAddr1()
				+ "','"
				+ supplier.getAddr2()
				+ "','"
				+ supplier.getCity()
				+ "','"
				+ supplier.getState()
				+ "','"
				+ supplier.getZip()
				+ "','"
				+ supplier.getPhone() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Supplier supplier) {
		String sql = "update supplier set name='" + supplier.getName()
				+ "',status='" + supplier.getStatus() + "',addr1='"
				+ supplier.getAddr1() + "',addr2='" + supplier.getAddr2()
				+ "',city='" + supplier.getCity() + "',state='"
				+ supplier.getState() + "',zip='" + supplier.getZip()
				+ "',phone='" + supplier.getPhone() + "' where id='"
				+ supplier.getSuppid() + "'";
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
