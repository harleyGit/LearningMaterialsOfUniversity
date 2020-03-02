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
	private String sql = "INSERT INTO student(name,myclass,score) VALUES('小秀','0801',95)";

	public boolean addStudent() {
		boolean flag = false;
		try {// step1：加载数据库厂商提供的驱动程序
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// step2：提供数据库连接的URL
		String url = "jdbc:mysql://localhost:3306/studb";
		try {
			// step3：通过DriverManager获得数据库的一个连接对象
			conn = DriverManager.
getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			// step4：创建Statement(SQL的执行环境)
			stmt = conn.createStatement();
			// step5:执行SQL语句
			int row = stmt.executeUpdate(sql);
			// step6:处理结果
			if (row == 1) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// step7:关闭JDBC的资源
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
			System.out.println("添加信息成功!");
		}else{
			System.out.println("添加信息失败!");
		}
	}

}
