package org.bzc.jdbc;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.bzc.db.ConnectionFactory;
import org.bzc.db.DbClose;

public class LobWrite {
	public void lobdemo(){
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO stuinfo(name, content, image) VALUES(?,?,?)";
		BufferedReader br = null;
		InputStream isimg = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "test");
		// 从文件中获取输入流--读取文本
			InputStream istxt = Thread.currentThread().getContextClassLoader()
							.getResourceAsStream("test.txt");
			br = new BufferedReader(new InputStreamReader(istxt));
			// 设置Clob
			pstmt.setCharacterStream(2, br);
		//从文件中获取输入流--读取图片
			isimg = Thread.currentThread().getContextClassLoader()
							.getResourceAsStream("bzc.gif");
			// 设置Blob
			pstmt.setBinaryStream(3, isimg);
		if (pstmt.executeUpdate() == 1) {
				System.out.println("恭喜您成功添加记录!");
			}else{
		System.out.println("对不起添加记录失败!");
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				isimg.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			DbClose.close(pstmt, conn);
		}
	}
	public static void main(String[] args) {
		LobWrite lobtest = new LobWrite();
		lobtest.lobdemo();
	}

}
