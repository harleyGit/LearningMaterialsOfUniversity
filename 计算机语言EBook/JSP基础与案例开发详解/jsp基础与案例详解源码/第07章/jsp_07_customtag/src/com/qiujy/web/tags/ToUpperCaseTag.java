/**
 * Filename: ToUpperCaseTag.java
 * Author: qiujy
 * Createtime: Mar 17, 2009
 * Copyrights 2009 qiujy All rights reserved.
 * EMail: qjyong@gmail.com
 */
package com.qiujy.web.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * 标签主体返回的内容转换成大写形式
 * @author qiujy
 */
public class ToUpperCaseTag extends BodyTagSupport {
	//序列化版本UID
	private static final long serialVersionUID = -290384034358604474L;
	private int counts = 1; //要循环的次数,默认为1
	
	//提供count属性的set方法
	public void setCounts(int counts){
		this.counts = counts;

	}

	//重写doEndTag方法
	public int doAfterBody() throws JspException {
		if(counts > 0){
			//以文本方式获得标签主体的内容
			String bodyString = this.getBodyContent().getString();
	        try {
	        	if(bodyString != null){
	        		//获取外层标签的输出流对象
	        		JspWriter out = this.getPreviousOut();
	        		out.print(bodyString.toUpperCase());
	        	}
	            bodyContent.clearBody(); //清除缓存的标签主体内容
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        counts--;                 //循环次数减1
	        return EVAL_BODY_AGAIN;  //继续执行标签主体内容
		}else{
			counts = 1;  //恢复要循环的次数为初始值
			return SKIP_BODY;  //循环次数完成后跳过标签主体的处理
		}
    }
}