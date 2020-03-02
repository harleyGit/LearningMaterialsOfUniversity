/**
 * Filename: MyDynaAttrTag.java
 * Author: qiujy
 * Createtime: Mar 18, 2009
 * Copyrights 2009 qiujy All rights reserved.
 * EMail: qjyong@gmail.com
 */
package com.qiujy.web.tags;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * 支持动态属性的标签处理类
 * @author qiujy
 */
@SuppressWarnings("unchecked")
public class MyDynaAttrsTag extends SimpleTagSupport implements DynamicAttributes {

	private Map dynamicAttrs; //用来保存所有动态属性的名和值对
	private int total;   //用来保存所有属性值相加的结果
	
	//
	public void setDynamicAttribute(String uri, String localName, Object value)
			throws JspException {
		if(dynamicAttrs == null){
			dynamicAttrs = new HashMap();
		}
		dynamicAttrs.put(localName, value); //把属性名/值对添加到Map中
	}
	
	public void doTag() throws JspException{
		if(dynamicAttrs != null){
			Iterator it = dynamicAttrs.keySet().iterator();
			while(it.hasNext()) {
				String name = (String) it.next();
				//遍历求和
				total += Integer.parseInt(
						String.valueOf(dynamicAttrs.get(name)));
			}
		}
		
		try {
			getJspContext().getOut().write("所有属性值的总和为:" + total);
		} catch (IOException e) {
			throw new JspException(e);
		}
	}
}