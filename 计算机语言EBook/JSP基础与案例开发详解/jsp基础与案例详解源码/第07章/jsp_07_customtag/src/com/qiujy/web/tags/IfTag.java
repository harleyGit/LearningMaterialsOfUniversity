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
 * if标签的处理类
 * @author qiujy
 */
public class IfTag extends TagSupport {
	//序列化版本UID
	private static final long serialVersionUID = 6775853398476825901L;
	private boolean test; //标签属性
	
	//test属性的set方法
	public void setTest(boolean test) {
		this.test = test;
	}

	//用来给子标签访问test属性值,为了防止多个线程并发访问问题,进行了同步处理
	public synchronized boolean getTest(){
		return test;
	}

	public int doStartTag() throws JspException {
		return EVAL_BODY_INCLUDE; //更改默认返回值,要求容器执行标签主体内容
	}
}
