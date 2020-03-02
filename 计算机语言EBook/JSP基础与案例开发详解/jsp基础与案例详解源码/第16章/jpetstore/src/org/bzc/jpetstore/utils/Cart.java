package org.bzc.jpetstore.utils;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.bzc.jpetstore.beans.Item;

public class Cart implements Serializable {

	/* Private Fields */

	private final Map itemMap = Collections.synchronizedMap(new HashMap());
	private final List itemList = new ArrayList();

	/* JavaBeans Properties */

	public List getCartItemList() {
		return itemList;
	}

	public int getNumberOfItems() {
		
		return itemList.size();
	}

	/* Public Methods */
    // 查看货物是否以经在购物车里存在
	public boolean containsItemId(String itemId) {
		return itemMap.containsKey(itemId);
	}

	// 向购物车里添加商品 用到了 itemMap 和itemList 用itemMap主要是方便取出item
	public void addItem(Item item, boolean isInStock) {
		CartItem cartItem = (CartItem) itemMap.get(item.getItemid());
		if (cartItem == null) {
			cartItem = new CartItem();
			cartItem.setItem(item);
			cartItem.setQuantity(0);
			cartItem.setInStock(isInStock);
			itemMap.put(item.getItemid(), cartItem);
			itemList.add(cartItem);
		}
		cartItem.incrementQuantity();
	}

	// 从购物车中移除商品的数量

	public void removeItemById(String itemId) {
		CartItem cartItem = (CartItem) itemMap.remove(itemId);
		if (cartItem == null) {
			return;
		} else {
			itemList.remove(cartItem);
		}
	}

	// 自动增加商品的数量
	public void incrementQuantityByItemId(String itemId) {
		CartItem cartItem = (CartItem) itemMap.get(itemId);
		cartItem.incrementQuantity();
	}

	// 根据id设置 商品的数量
	public void setQuantityByItemId(String itemId, int quantity) {
		CartItem cartItem = (CartItem) itemMap.get(itemId);
		cartItem.setQuantity(quantity);
	}

	// 获取购物车商品的总价钱
	public BigDecimal getSubTotal() {
		BigDecimal subTotal = new BigDecimal("0");
		Iterator items = getAllCartItems();
		while (items.hasNext()) {
			CartItem cartItem = (CartItem) items.next();
			Item item = cartItem.getItem();
			BigDecimal listPrice = item.getListprice();
			BigDecimal quantity = new BigDecimal(String.valueOf(cartItem
					.getQuantity()));
			subTotal = subTotal.add(listPrice.multiply(quantity));
		}
		return subTotal;
	}

	public Iterator getCartItems() {
		return itemList.iterator();

	}

	public Iterator getAllCartItems() {
		List allItems = new ArrayList();

		allItems.addAll(itemList);

		return allItems.iterator();
	}
	
	 public void updateCartQuantities(Map parameterMap) {
		    Iterator cartItems =this.getAllCartItems();
		    while (cartItems.hasNext()) {
		      CartItem cartItem = (CartItem) cartItems.next();
		      String itemId = cartItem.getItem().getItemid();
		      try {
		        int quantity = Integer.parseInt((String) parameterMap.get(itemId));
		        this.setQuantityByItemId(itemId, quantity);
		        if (quantity < 1) {
		          cartItems.remove();
		        }
		      } catch (Exception e) {
		        // ignore on purpose
		      }
		    }
		 
		 
	 }
		   

}
