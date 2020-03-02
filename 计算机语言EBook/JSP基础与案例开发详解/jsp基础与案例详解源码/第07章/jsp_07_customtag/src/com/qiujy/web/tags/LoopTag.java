/**
 * Filename: LoopTag.java
 * Author: qiujy
 * Createtime: Mar 16, 2009
 * Copyrights 2009 qiujy All rights reserved.
 * EMail: qjyong@gmail.com
 */
package com.qiujy.web.tags;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 自定义的具有简单循环功能的标签处理类
 * @author qiujy
 */
@SuppressWarnings("unchecked")
public class LoopTag extends TagSupport {
	//序列化版本UID
	private static final long serialVersionUID = 1482490071732794318L;
	
	private Object items; //要遍历显示的集合
	private String var;  //临时变量
	private Iterator it;  //迭代器

	//为标签的属性items提供set方法
	public void setItems(Object items) {
		this.items = items;
	}
	//为标签的属性var提供set方法
	public void setVar(String var) {
		this.var = var;
	}

	//重写doStartTag方法
	public int doStartTag() throws JspException {
		//如果集合是空的或者不是Collection类型的
		if(items == null || !(items instanceof Collection)){ 
			return SKIP_BODY;  //直接跳过标签主体的处理
		}
		it = ((Collection)items).iterator(); //获取集合的迭代器
		if(it.hasNext()){ //如果集合中有元素
			//把遍历到的第一个元素用var属性值作为名存放到pageContext中
			this.pageContext.setAttribute(var, it.next());
			return EVAL_BODY_INCLUDE;  //要求容器执行标签主体内容
		}else{
			return SKIP_BODY; //如果集合中没有元素就跳过标签主体的处理
		}
	}

	//重写doAfterBody方法
	public int doAfterBody() throws JspException {
		if(it.hasNext()){ //开始遍历集合
			//把遍历到的元素用var属性值作为名存放到pageContext中
			this.pageContext.setAttribute(var, it.next());
			return EVAL_BODY_AGAIN;  //要求容器重复执行标签主体内容
		}else{
			return SKIP_BODY; //遍历完成后跳过标签主体的处理
		}
	}
	
	//重写release()方法,用来释放本标签处理类实例所占用的系统资源
	public void release(){
		this.items = null;
		this.var = null;
		this.it = null;
	}
}
