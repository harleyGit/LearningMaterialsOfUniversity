/**
 * Filename: MyELFunction.java
 * Author: qiujy
 * Createtime: Mar 17, 2009
 * Copyrights 2009 qiujy All rights reserved.
 * EMail: qjyong@gmail.com
 */
package com.qiujy.web.tags;

/**
 * 自定义EL函数
 * @author qiujy
 */
public class MyELFunction {
	
	/** 实现把字符串小写转成大写的功能 */
	public static String toUpperCase(String source){
		if(source == null || "".equals(source.trim())){
			return null;
		}else{
			return source.toUpperCase();
		}
	}
}
