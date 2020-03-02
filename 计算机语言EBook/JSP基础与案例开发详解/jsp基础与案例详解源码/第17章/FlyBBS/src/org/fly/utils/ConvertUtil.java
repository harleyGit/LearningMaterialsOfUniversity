package org.fly.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class ConvertUtil {

	// 转换字符为gbk
	public String IsoToGBK(String source) {
		try {
			String str = new String(source.getBytes("gbk"));
			return getHtml(str);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	// 判断大于10
	public int ifList(List list, int i) {
		int j = list.size();
		if (j > i)
			j = i;
		return j;
	}

	// 转换字符为数字
	public int strToInt(String source) {
		int i = 0;
		try {
			i = Integer.parseInt(source);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	// 获取时间
	public String getTime() {
		SimpleDateFormat simpledate = new SimpleDateFormat(
				"yyyy/MM/dd HH:mm:ss", Locale.US);
		Date date = new Date();
		return simpledate.format(date);
	}

	// 截取字符串
	public static String getLong(String str) {
		String result = "";
		if (str.length() > 15) {
			result = str.substring(0, 15);
			result += "......";
		} else {
			result = str;
		}

		return result;
	}

	// 转换HTML代码。
	public static String getHtml(String s) {
		char c[] = s.toCharArray();
		char ch;
		StringBuffer buf = new StringBuffer();
		for (int i = 0, size = c.length; i < size; i++) {
			ch = c[i];
			if (ch == '"') {
				buf.append("&quot;");
			} else if (ch == '&') {
				buf.append("&amp;");
			} else if (ch == '<') {
				buf.append("&lt;");
			} else if (ch == '>') {
				buf.append("&gt;");
			} else if (ch == '\n') {
				buf.append("<br>");
			} else if (ch == ' ') {
				buf.append("&nbsp;");
			} else if (ch == '　') {
				buf.append("&nbsp;");
			} else {
				buf.append(ch);
			}
		}
		c = null;
		return buf.toString();
	}

}
