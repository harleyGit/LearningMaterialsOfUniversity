package org.bzc.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ControlDB该类用来执行对数据库的操作
 * 
 * @author 卞志成
 * @version 1.2
 */
public class ControlDB {
	/**
	 * 执行select语句
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
	 * 执行Insert、Update、Delete语句
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
			System.err.println("执行SQL语句出错: " + ex.getMessage());
		} finally {
			DbClose.close(stmt, conn);
		}
	}
}
