package org.njy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ConvertUtil {
	private static ConvertUtil convert = null;

	private ConvertUtil() {
	}

	public static ConvertUtil getInstance() {
		if(convert==null){
			convert = new ConvertUtil();
		}
		return convert;
	}

	/**
	 * �÷����������ַ���ת����int
	 * 
	 * @param Ҫת����int���ַ���
	 * @return ת�����intֵ
	 */
	public int strToInt(String str) {
		int i = 0;
		try {
			if (str != null) {
				i = Integer.parseInt(str);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();

		}
		return i;
	}

	/**
	 * ��ʽ��ʱ��
	 * 
	 * @return ���ص�ǰ��ʱ���ʽΪ��2008-07-27 13:01:20
	 */
	public String getTime() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simple.format(new Date());
		return date;
	}

	/**
	 * ��ȡ�ַ���(ͨ����ͼƬ��path�õ���ͼƬ��·��)
	 */
	public static String substring(Object str) {
		return str.toString().replace("_min.", ".");

	}

	/**
	 * �÷������������û������Html����
	 * 
	 * @param str
	 * @return
	 */
	public String filterHtml(String str) {
		if (null == str)
			return null;
		char c[] = str.toCharArray();
		StringBuffer buf = new StringBuffer();
		for (int i = 0, size = c.length; i < size; i++) {
			char ch = c[i];
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
			} else if (ch == '\\') {
				buf.append("&#92");
			} else {
				buf.append(ch);
			}
		}
		return buf.toString();
	}

	/**
	 * ���Թ������з�������ȷ��
	 * 
	 * @param args
	 */
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// ConvertUtil conv = new ConvertUtil();
	}
}
