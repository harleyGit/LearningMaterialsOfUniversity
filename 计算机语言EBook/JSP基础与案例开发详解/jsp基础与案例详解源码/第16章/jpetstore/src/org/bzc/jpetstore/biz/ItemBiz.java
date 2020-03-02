package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class ItemBiz {
	ControlDB controlDB = null;

	public ItemBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from item where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, String itemId) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {
			sql = "select * from item";
		} else if (flag == 1) {
			sql = "select * from item where itemid='" + itemId
					+ "'";
		}
		try {
			list = controlDB.executeQueryItem(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List searchByproductId(String productId) {
		String sql = "";
		List list = new ArrayList();
		sql = "select * from item where productid='" + productId
				+ "'";
		try {
			list = controlDB.executeQueryItem(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Item item) {
		String sql = "insert into item(itemid,productid,listprice,unitcost,supplier,status,attr1,attr2,attr3,attr4,attr5) values('"
				+ item.getItemid()
				+ "','"
				+ item.getProductid()
				+ "','"
				+ item.getListprice()
				+ "','"
				+ item.getUnitcost()
				+ "','"
				+ item.getSupplier()
				+ "','"
				+ item.getStatus()
				+ "','"
				+ item.getAttr1()
				+ "','"
				+ item.getAttr2()
				+ "','"
				+ item.getAttr3()
				+ "','"
				+ item.getAttr4()
				+ "','"
				+ item.getAttr5() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Item item) {
		String sql = "update item set productid='" + item.getProductid()
				+ "',listprice='" + item.getListprice() + "',unitcost='"
				+ item.getUnitcost() + "',supplier='" + item.getSupplier()
				+ "',status='" + item.getStatus() + "',attr1='"
				+ item.getAttr1() + "',attr2='" + item.getAttr2() + "',attr3='"
				+ item.getAttr3() + "',attr4='" + item.getAttr4() + "',attr5='"
				+ item.getAttr5() + "' where id='" + item.getItemid() + "'";
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
