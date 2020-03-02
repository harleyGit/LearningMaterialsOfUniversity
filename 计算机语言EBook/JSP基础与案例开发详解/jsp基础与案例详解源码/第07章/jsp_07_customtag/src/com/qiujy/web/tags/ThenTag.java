/**
 * Filename: IfTag.java
 * Author: qiujy
 * Createtime: Mar 18, 2009
 * Copyrights 2009 qiujy All rights reserved.
 * EMail: qjyong@gmail.com
 */
package com.qiujy.web.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * then标签的处理类
 * @author qiujy
 */
public class ThenTag extends TagSupport {
	//序列化版本UID
	private static final long serialVersionUID = 4310421014521611885L;
	
	public int doStartTag() throws JspException {
		//获取当前标签的父标签处理类实例
		IfTag parent = (IfTag) this.getParent();
		//IfTag parent = (IfTag) findAncestorWithClass(this, IfTag.class);
		if (parent != null && parent.getTest()) {        //如果父标签的test属性值为true
			return EVAL_BODY_INCLUDE;  //要求容器执行标签主体
		} else {
			return SKIP_BODY;          //要求容器跳过标签主体
		}
	}
}
