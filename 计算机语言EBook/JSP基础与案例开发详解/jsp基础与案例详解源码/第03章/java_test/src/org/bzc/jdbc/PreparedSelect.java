package org.bzc.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreparedSelect {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String driver = "com.mysql.jdbc.Driver";
	private String username = "root";
	private String password = "1234567";
	private String sql = "SELECT id,name,myclass,score FROM student WHERE id=?";

public void selectStudent(int id) {
	try {// step1���������ݿ⳧���ṩ����������
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	// step2���ṩ���ݿ����ӵ�URL
	String url = "jdbc:mysql://localhost:3306/studb";
	try {
		// step3��ͨ��DriverManager������ݿ��һ�����Ӷ���
		conn = DriverManager.getConnection(url, username, password);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	try {
		// step4������Statement(SQL��ִ�л���)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		// step5:ִ��SQL���
		rs = pstmt.executeQuery();
		// step6:������
		while (rs.next()) {
			int i = 1;
			System.out.print(" ѧԱ���: " + rs.getInt(i++));
			System.out.print(", ѧԱ����: " + rs.getString(i++));
			System.out.print(", ѧԱ�༶: " + rs.getString(i++));
			System.out.println(", ѧԱ����: " + rs.getInt(i++));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		// step7:�ر�JDBC����Դ
		if (null != rs) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (null != pstmt) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (null != conn) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

 public static void main(String[] args) {
	PreparedSelect select = new PreparedSelect();
	select.selectStudent(18);

 }

}
