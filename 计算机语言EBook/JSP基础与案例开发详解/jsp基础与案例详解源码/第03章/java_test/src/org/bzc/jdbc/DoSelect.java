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
		try {// step1：加载数据库厂商提供的驱动程序
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// step2：提供数据库连接的URL
		String url = "jdbc:mysql://localhost:3306/studb";
		try {
			// step3：通过DriverManager获得数据库的一个连接对象
			conn = DriverManager
.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			// step4：创建Statement(SQL的执行环境)
			stmt = conn.createStatement();
			// step5:执行SQL语句
			 rs = stmt.executeQuery(sql);
			// step6:处理结果
			while (rs.next()) {
				int i=1;
				int id=rs.getInt(i++);
				String name=rs.getString(i++);
				String myclass=rs.getString(i++);
				int score = rs.getInt(i++);
				
				System.out.print(" 学员编号: "+id);
				System.out.print(", 学员姓名: "+name);
				System.out.print(", 学员班级: "+myclass);
				System.out.println(", 学员分数: "+score);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// step7:关闭JDBC的资源
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
