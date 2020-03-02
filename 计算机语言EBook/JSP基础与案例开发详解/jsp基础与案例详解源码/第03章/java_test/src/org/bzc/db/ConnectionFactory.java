package org.bzc.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * ������ݿ�����
 * 
 * @author ��־��
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
	 * �÷���������������ļ��е�driver,url,username,password
	 */
	private static void getPropertiesInfo() {
		Properties prop = new Properties();
		InputStream inStream = Thread.currentThread().getContextClassLoader()
				.getResourceAsStream("jdbc.properties");
		try {
			// �����Ӧ�ļ�ֵ��
			prop.load(inStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// ������Ӧ�ļ���ö�Ӧ��ֵ
		SQL_DRIVER = prop.getProperty("driver");
		SQL_URL = prop.getProperty("url");
		SQL_USERNAME = prop.getProperty("username");
		SQL_PASSWORD = prop.getProperty("password");
	}

	/**
	 * �÷�������������������������ݿ�����Ӷ���
	 * 
	 * @return ���ݿ����Ӷ���conn
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// ��������
			Class.forName(SQL_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			// ������ݿ����ӵĶ���
			conn = DriverManager.getConnection(SQL_URL, SQL_USERNAME,
					SQL_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void main(String[] args) {
		// ���Ի��Connection�������ȷ��
		// getConnection();
	}
}
