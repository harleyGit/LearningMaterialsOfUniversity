package org.bzc.jpetstore.beans;

public class Lineitem {
	private Integer orderid;

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getOrderid() {
		return orderid;
	}

	private Integer linenum;

	public void setLinenum(Integer linenum) {
		this.linenum = linenum;
	}

	public Integer getLinenum() {
		return linenum;
	}

	private String itemid;

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public String getItemid() {
		return itemid;
	}

	private Integer quantity;

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getQuantity() {
		return quantity;
	}

	private String unitprice;

	public void setUnitprice(String unitprice) {
		this.unitprice = unitprice;
	}

	public String getUnitprice() {
		return unitprice;
	}
}
