package org.bzc.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 获得数据库连接
 * 
 * @author 卞志成
 * 
 */
public class ConnectionFactory {
	/** database driver class name */
	private static String SQL_DRIVER = "";
	/** database URL associated with the URL */
	private static String SQL_URL = "";
	/** user name of the database */
	private static String SQL_USERNAME = "";
	/** password for the current user */
	private static String SQL_PASSWORD = "";

	private ConnectionFactory() {
	}

	static {
		getPropertiesInfo();
	}

	/**
	 * 该方法用来获得属性文件中的driver,url,username,password
	 */
	private static void getPropertiesInfo() {
		Properties prop = new Properties();
		InputStream inStream = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("jdbc.properties");
		try {
			// 获得相应的键值对
			prop.load(inStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 根据相应的键获得对应的值
		SQL_DRIVER = prop.getProperty("driver");
		SQL_URL = prop.getProperty("url");
		SQL_USERNAME = prop.getProperty("username");
		SQL_PASSWORD = prop.getProperty("password");
	}

	/**
	 * 该方法用来加载驱动，并获得数据库的连接对象
	 * 
	 * @return 数据库连接对象conn
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 加载驱动
			Class.forName(SQL_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			// 获得数据库连接的对象
			conn = DriverManager.getConnection(SQL_URL, SQL_USERNAME,
					SQL_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void main(String[] args) {
		// 测试获得Connection对象的正确性
		// getConnection();
	}
}
