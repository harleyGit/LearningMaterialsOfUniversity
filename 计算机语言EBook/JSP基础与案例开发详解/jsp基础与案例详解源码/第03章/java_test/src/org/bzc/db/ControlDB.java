package org.bzc.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ControlDB��������ִ�ж����ݿ�Ĳ���
 * 
 * @author ��־��
 * @version 1.2
 */
public class ControlDB {
	/**
	 * ִ��select���
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public ResultSet executeQuery(String sql) throws Exception {
		ResultSet rs = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ConnectionFactory.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

		} catch (SQLException e) {
			throw e;
		}
		return rs;
	}

	/**
	 * ִ��Insert��Update��Delete���
	 * 
	 * @param sql
	 * @throws Exception
	 */
	public void executeUpdate(String sql) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = ConnectionFactory.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.err.println("ִ��SQL������: " + ex.getMessage());
		} finally {
			DbClose.close(stmt, conn);
		}
	}
}
