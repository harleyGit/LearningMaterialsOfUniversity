package org.xmh.DBcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {
	public DBcon() {
	}

	public Connection getcon() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		try {
			String url = "jdbc:mysql://localhost:3306/studb"
					+ "?useUnicode=true&characterEncoding=GBK";
			con = DriverManager.getConnection(url, "root", "3239436");

		} catch (SQLException ex1) {
			ex1.printStackTrace();
		}
		return con;
	}
	public static void main(String args[]){
		DBcon db = new DBcon();
		System.out.println(db.getcon().toString());
	}
}
