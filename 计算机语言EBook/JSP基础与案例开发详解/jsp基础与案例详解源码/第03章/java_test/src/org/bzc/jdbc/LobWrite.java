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
		// ���ļ��л�ȡ������--��ȡ�ı�
			InputStream istxt = Thread.currentThread().getContextClassLoader()
							.getResourceAsStream("test.txt");
			br = new BufferedReader(new InputStreamReader(istxt));
			// ����Clob
			pstmt.setCharacterStream(2, br);
		//���ļ��л�ȡ������--��ȡͼƬ
			isimg = Thread.currentThread().getContextClassLoader()
							.getResourceAsStream("bzc.gif");
			// ����Blob
			pstmt.setBinaryStream(3, isimg);
		if (pstmt.executeUpdate() == 1) {
				System.out.println("��ϲ���ɹ���Ӽ�¼!");
			}else{
		System.out.println("�Բ�����Ӽ�¼ʧ��!");
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
