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
	try {// step1：加载数据库厂商提供的驱动程序
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	// step2：提供数据库连接的URL
	String url = "jdbc:mysql://localhost:3306/studb";
	try {
		// step3：通过DriverManager获得数据库的一个连接对象
		conn = DriverManager.getConnection(url, username, password);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	try {
		// step4：创建Statement(SQL的执行环境)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		// step5:执行SQL语句
		rs = pstmt.executeQuery();
		// step6:处理结果
		while (rs.next()) {
			int i = 1;
			System.out.print(" 学员编号: " + rs.getInt(i++));
			System.out.print(", 学员姓名: " + rs.getString(i++));
			System.out.print(", 学员班级: " + rs.getString(i++));
			System.out.println(", 学员分数: " + rs.getInt(i++));
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
