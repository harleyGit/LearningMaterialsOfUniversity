/**
 * Filename: MySimpleTag.java
 * Author: qiujy
 * Createtime: Mar 18, 2009
 * Copyrights 2009 qiujy All rights reserved.
 * EMail: qjyong@gmail.com
 */
package com.qiujy.web.tags;

import java.io.IOException;
import java.io.StringWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * 用简单标签方式来实现标签主体内容转大写并循环转出的自定义标签
 * @author qiujy
 */
public class MySimpleTag extends SimpleTagSupport {
	private int counts = 1;  //循环次数
	
	//给counts属性提供set方法
	public void setCounts(int counts){
		this.counts = counts;
	}
	
	public void doTag() throws JspException, IOException {
		//获取页面输出流
		JspWriter out = this.getJspContext().getOut();
		
		String str = invokeBody();
		for(int i = 0; i < counts; i++){
			out.println(str.toUpperCase());
		}
	}
	
	/** 获取标签主体返回的内容 */
	protected String invokeBody() throws JspException {
		JspFragment body = getJspBody();  //获取代表该标签主体的JspFragment实例
		StringWriter sw = new StringWriter();
		try {
			if(body != null){
				//执行标签主体片段,把返回的内容写到字符流中
				//--如果只想输出标签主体生成的内容,则可以使用null参数调用invoke()方法
				body.invoke(sw);
			}
		} catch (IOException x) {
			throw new JspException(x);
		}
		return sw.toString();  //以字符串的形式返回该缓冲区的当前值
	}	
}