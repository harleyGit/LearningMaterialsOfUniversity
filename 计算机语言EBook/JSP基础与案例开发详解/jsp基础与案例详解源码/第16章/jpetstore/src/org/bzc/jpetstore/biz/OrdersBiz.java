package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class OrdersBiz {
	ControlDB controlDB = null;

	public OrdersBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from orders where id=" + id;
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
			sql = "select * from orders order by id desc";
		} else if (flag == 1) {
			sql = "select * from orders where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQueryOrders(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Orders orders) {
		String sql = "insert into orders(userid,orderdate,shipaddr1,shipaddr2,shipcity,shipstate,shipzip,shipcountry,billaddr1,billaddr2,billcity,billstate,billzip,billcountry,courier,totalprice,billtofirstname,billtolastname,shiptofirstname,shiptolastname,creditcard,exprdate,cardtype,locale) values('"
				+ orders.getUserid()
				+ "','"
				+ orders.getOrderdate()
				+ "','"
				+ orders.getShipaddr1()
				+ "','"
				+ orders.getShipaddr2()
				+ "','"
				+ orders.getShipcity()
				+ "','"
				+ orders.getShipstate()
				+ "','"
				+ orders.getShipzip()
				+ "','"
				+ orders.getShipcountry()
				+ "','"
				+ orders.getBilladdr1()
				+ "','"
				+ orders.getBilladdr2()
				+ "','"
				+ orders.getBillcity()
				+ "','"
				+ orders.getBillstate()
				+ "','"
				+ orders.getBillzip()
				+ "','"
				+ orders.getBillcountry()
				+ "','"
				+ orders.getCourier()
				+ "','"
				+ orders.getTotalprice()
				+ "','"
				+ orders.getBilltofirstname()
				+ "','"
				+ orders.getBilltolastname()
				+ "','"
				+ orders.getShiptofirstname()
				+ "','"
				+ orders.getShiptolastname()
				+ "','"
				+ orders.getCreditcard()
				+ "','"
				+ orders.getExprdate()
				+ "','"
				+ orders.getCardtype()
				+ "','" + orders.getLocale() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Orders orders) {
		String sql = "update orders set userid='" + orders.getUserid()
				+ "',orderdate='" + orders.getOrderdate() + "',shipaddr1='"
				+ orders.getShipaddr1() + "',shipaddr2='"
				+ orders.getShipaddr2() + "',shipcity='" + orders.getShipcity()
				+ "',shipstate='" + orders.getShipstate() + "',shipzip='"
				+ orders.getShipzip() + "',shipcountry='"
				+ orders.getShipcountry() + "',billaddr1='"
				+ orders.getBilladdr1() + "',billaddr2='"
				+ orders.getBilladdr2() + "',billcity='" + orders.getBillcity()
				+ "',billstate='" + orders.getBillstate() + "',billzip='"
				+ orders.getBillzip() + "',billcountry='"
				+ orders.getBillcountry() + "',courier='" + orders.getCourier()
				+ "',totalprice='" + orders.getTotalprice()
				+ "',billtofirstname='" + orders.getBilltofirstname()
				+ "',billtolastname='" + orders.getBilltolastname()
				+ "',shiptofirstname='" + orders.getShiptofirstname()
				+ "',shiptolastname='" + orders.getShiptolastname()
				+ "',creditcard='" + orders.getCreditcard() + "',exprdate='"
				+ orders.getExprdate() + "',cardtype='" + orders.getCardtype()
				+ "',locale='" + orders.getLocale() + "' where id='"
				+ orders.getOrderid() + "'";
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
