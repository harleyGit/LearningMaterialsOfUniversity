package org.bzc.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DoSelect {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String driver = "com.mysql.jdbc.Driver";
	private String username = "root";
	private String password = "1234567";
	private String sql = "SELECT id,name,myclass,score FROM student";

	public void selectStudent() {
		try {// step1���������ݿ⳧���ṩ����������
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// step2���ṩ���ݿ����ӵ�URL
		String url = "jdbc:mysql://localhost:3306/studb";
		try {
			// step3��ͨ��DriverManager������ݿ��һ�����Ӷ���
			conn = DriverManager
.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			// step4������Statement(SQL��ִ�л���)
			stmt = conn.createStatement();
			// step5:ִ��SQL���
			 rs = stmt.executeQuery(sql);
			// step6:������
			while (rs.next()) {
				int i=1;
				int id=rs.getInt(i++);
				String name=rs.getString(i++);
				String myclass=rs.getString(i++);
				int score = rs.getInt(i++);
				
				System.out.print(" ѧԱ���: "+id);
				System.out.print(", ѧԱ����: "+name);
				System.out.print(", ѧԱ�༶: "+myclass);
				System.out.println(", ѧԱ����: "+score);
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
			if (null != stmt) {
				try {
					stmt.close();
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
		DoSelect select = new DoSelect();
		select.selectStudent();
	}
}
