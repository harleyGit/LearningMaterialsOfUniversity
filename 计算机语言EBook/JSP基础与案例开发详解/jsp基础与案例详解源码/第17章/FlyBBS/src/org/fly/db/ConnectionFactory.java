package org.fly.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {
	private String driver = "";
	private String dbURL = "";
	private String user = "";
	private String password = "";
	private static ConnectionFactory factory = null;

	private ConnectionFactory() throws Exception {
		driver = "com.mysql.jdbc.Driver";
		dbURL = "jdbc:mysql://localhost:3306/bbs?useUnicode=true&characterEncoding=gbk";
		user = "root";
		password = "3239436";
	}

	public static Connection getConnection() {
		Connection conn = null;
		if (factory == null) {
			try {
				factory = new ConnectionFactory();
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		try {
			Class.forName(factory.driver);
			conn = DriverManager.getConnection(factory.dbURL, factory.user,
					factory.password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
