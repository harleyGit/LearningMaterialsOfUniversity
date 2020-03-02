package org.tjitcast.demo;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletInputStream;
import java.util.Dictionary;
import java.util.Hashtable;
import java.io.PrintWriter;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class FileUploadBean {
	private String savePath;
	private String filepath;
	private String filename;
	private String contentType;
	private Hashtable fields;

	// 返回filename私有域的值
	public String getFilename() {
		return filename;
	}

	// 返回filepath私有域的值
	public String getFilepath() {
		return filepath;
	}

	// 返回savePath私有域的值
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	// 返回contentType私有域的值
	public String getContentType() {
		return contentType;
	}

	// 返回HTML表单中指定输入元素的值，元素的名字通过fieldName参数指定
	public String getFieldValue(String fieldName) {
		if (fields == null || fieldName == null)
			return null;
		return (String) fields.get(fieldName);
	}

	private void setFilename(String s) {
		if (s == null)
			return;

		int pos = s.indexOf("filename=\"");
		if (pos != -1) {
			filepath = s.substring(pos + 10, s.length() - 1);
			// Windows浏览器发送完整的文件路径和名字
			// 但Linux/Unix和Mac浏览器只发送文件名字
			pos = filepath.lastIndexOf("\\");
			if (pos != -1)
				filename = filepath.substring(pos + 1);
			else
				filename = filepath;
		}
	}

	private void setContentType(String s) {
		if (s == null)
			return;

		int pos = s.indexOf(": ");
		if (pos != -1)
			contentType = s.substring(pos + 2, s.length());
	}

	public void doUpload(HttpServletRequest request) throws IOException {
		ServletInputStream in = request.getInputStream();
		// 创建字节数组充当缓冲容器的作用
		byte[] line = new byte[128];
		int i = in.readLine(line, 0, 128);
		if (i < 3)
			return;
		// -2丢弃换行字符
		int boundaryLength = i - 2;
		String boundary = new String(line, 0, boundaryLength);
		fields = new Hashtable();
		while (i != -1) {
			String newLine = new String(line, 0, i);
			if (newLine.startsWith("Content-Disposition: form-data; name=\"")) {
				if (newLine.indexOf("filename=\"") != -1) {
					setFilename(new String(line, 0, i - 2));
					if (filename == null)
						return;
					// 文件内容
					i = in.readLine(line, 0, 128);
					setContentType(new String(line, 0, i - 2));
					i = in.readLine(line, 0, 128);
					// 空行
					newLine = new String(line, 0, i);
					PrintWriter pw = new PrintWriter(new BufferedWriter(
							new FileWriter((savePath == null ? "" : savePath)
									+ filename)));
					while (i != -1 && !newLine.startsWith(boundary)) {
						// 文件内容的最后一行包含换行字符
						// 因此必须检查当前行是否是最后一行
						i = in.readLine(line, 0, 128);
						if ((i == boundaryLength + 2 || i == boundaryLength + 4)
								&& (new String(line, 0, i).startsWith(boundary)))
							pw
									.print(newLine.substring(0, newLine
											.length() - 2));
						else
							pw.print(newLine);
						newLine = new String(line, 0, i);
					}
					pw.close();
				} else {
					// 普通表单输入元素
					// 获取输入元素名字
					int pos = newLine.indexOf("name=\"");
					String fieldName = newLine.substring(pos + 6, newLine
							.length() - 3);
					i = in.readLine(line, 0, 128);
					newLine = new String(line, 0, i);
					StringBuffer fieldValue = new StringBuffer(128);
					while (i != -1 && !newLine.startsWith(boundary)) {
						// 最后一行包含换行字符
						// 因此必须检查当前行是否是最后一行
						i = in.readLine(line, 0, 128);
						if ((i == boundaryLength + 2 || i == boundaryLength + 4)
								&& (new String(line, 0, i).startsWith(boundary)))
							fieldValue.append(newLine.substring(0, newLine
									.length() - 2));
						else
							fieldValue.append(newLine);
						newLine = new String(line, 0, i);
					}
					fields.put(fieldName, fieldValue.toString());
				}
			}
			i = in.readLine(line, 0, 128);
		}
	}
}
