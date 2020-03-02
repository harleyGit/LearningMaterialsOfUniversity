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
 * else标签的处理类
 * @author qiujy
 */
public class ElseTag extends TagSupport {
	//序列化版本UID
	private static final long serialVersionUID = 4777762407365310391L;

	public int doStartTag() throws JspException {
		//获取当前标签的父标签处理类实例
		IfTag parent = (IfTag) findAncestorWithClass(this, IfTag.class);
		if (parent != null && 
				!parent.getTest()) {   //如果父标签的test属性值为false
			return EVAL_BODY_INCLUDE;  //要求容器执行标签主体
		} else {
			return SKIP_BODY;          //要求容器跳过标签主体
		}
	}
}