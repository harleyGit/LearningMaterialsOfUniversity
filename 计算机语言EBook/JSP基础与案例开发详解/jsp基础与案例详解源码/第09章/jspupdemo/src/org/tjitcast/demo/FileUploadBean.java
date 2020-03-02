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

	// ����filename˽�����ֵ
	public String getFilename() {
		return filename;
	}

	// ����filepath˽�����ֵ
	public String getFilepath() {
		return filepath;
	}

	// ����savePath˽�����ֵ
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	// ����contentType˽�����ֵ
	public String getContentType() {
		return contentType;
	}

	// ����HTML����ָ������Ԫ�ص�ֵ��Ԫ�ص�����ͨ��fieldName����ָ��
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
			// Windows����������������ļ�·��������
			// ��Linux/Unix��Mac�����ֻ�����ļ�����
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
		// �����ֽ�����䵱��������������
		byte[] line = new byte[128];
		int i = in.readLine(line, 0, 128);
		if (i < 3)
			return;
		// -2���������ַ�
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
					// �ļ�����
					i = in.readLine(line, 0, 128);
					setContentType(new String(line, 0, i - 2));
					i = in.readLine(line, 0, 128);
					// ����
					newLine = new String(line, 0, i);
					PrintWriter pw = new PrintWriter(new BufferedWriter(
							new FileWriter((savePath == null ? "" : savePath)
									+ filename)));
					while (i != -1 && !newLine.startsWith(boundary)) {
						// �ļ����ݵ����һ�а��������ַ�
						// ��˱����鵱ǰ���Ƿ������һ��
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
					// ��ͨ������Ԫ��
					// ��ȡ����Ԫ������
					int pos = newLine.indexOf("name=\"");
					String fieldName = newLine.substring(pos + 6, newLine
							.length() - 3);
					i = in.readLine(line, 0, 128);
					newLine = new String(line, 0, i);
					StringBuffer fieldValue = new StringBuffer(128);
					while (i != -1 && !newLine.startsWith(boundary)) {
						// ���һ�а��������ַ�
						// ��˱����鵱ǰ���Ƿ������һ��
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
