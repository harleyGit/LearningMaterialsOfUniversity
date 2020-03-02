package org.tjitcast.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DealString {
	private String patt = "yyyy-MM-dd HH:mm:ss";

	public String getDateTime(String pattern) {
		SimpleDateFormat f = new SimpleDateFormat(pattern);
		String time = f.format(new Date());
		return time;
	}

	public String getDateTime() {
		SimpleDateFormat f = new SimpleDateFormat(patt);
		String time = f.format(new Date());
		return time;
	}

	public String toGBK(String str) {
		try {
			if (str == null)
				str = "";
			else
				str = new String(str.getBytes("ISO-8859-1"), "GBK");
		} catch (Exception e) {
			System.out.println("DealString::toGBK(String)运行时出错：错误为：" + e);
		}
		return str;
	}

	public int toInt(Object str) {
		int num = 1;
		if (str != null) {
			String objtarget = (String) str;
			num = Integer.parseInt(objtarget);
		}
		return num;
	}

	public String toString(Object str) {
		String tmp = "";
		if (str != null) {
			String objtarget = (String) str;
			tmp = objtarget;
		}
		return tmp;
	}
}
