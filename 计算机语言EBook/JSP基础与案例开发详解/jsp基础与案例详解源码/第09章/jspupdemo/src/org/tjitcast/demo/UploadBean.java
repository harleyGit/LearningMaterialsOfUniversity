package org.tjitcast.demo;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

public class UploadBean {
	public void doUpload(HttpServletRequest request) throws IOException {
		PrintWriter pw = new PrintWriter(new BufferedWriter(new FileWriter(
				"d:\\zah.txt")));
		ServletInputStream in = request.getInputStream();
		int i = in.read();
		while (i != -1) {
			pw.print((char) i);
			i = in.read();
		}
		pw.close();
	}
}
