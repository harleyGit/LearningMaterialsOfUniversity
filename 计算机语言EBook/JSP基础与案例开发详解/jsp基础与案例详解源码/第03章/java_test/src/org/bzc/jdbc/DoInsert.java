package org.bzc.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DoInsert {
	private Connection conn = null;
	private Statement stmt = null;
	private String driver = "com.mysql.jdbc.Driver";
	private String username = "root";
	private String password = "1234567";
	private String sql = "INSERT INTO student(name,myclass,score) VALUES('С��','0801',95)";

	public boolean addStudent() {
		boolean flag = false;
		try {// step1���������ݿ⳧���ṩ����������
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// step2���ṩ���ݿ����ӵ�URL
		String url = "jdbc:mysql://localhost:3306/studb";
		try {
			// step3��ͨ��DriverManager������ݿ��һ�����Ӷ���
			conn = DriverManager.
getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			// step4������Statement(SQL��ִ�л���)
			stmt = conn.createStatement();
			// step5:ִ��SQL���
			int row = stmt.executeUpdate(sql);
			// step6:������
			if (row == 1) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// step7:�ر�JDBC����Դ
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
		return flag;
	}

	public static void main(String[] args) {
		DoInsert doinsert = new DoInsert();
		boolean flag = doinsert.addStudent();
		if (flag) {
			System.out.println("�����Ϣ�ɹ�!");
		}else{
			System.out.println("�����Ϣʧ��!");
		}
	}

}
