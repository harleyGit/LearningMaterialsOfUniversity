package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 该类用来关闭数据库连接
 * 
 * @author 卞志成
 * 
 */
public class DbClose {

	/**
	 * 关闭Connection
	 * 
	 * @param conn
	 */
	public static void close(Connection conn) {
		if (null != conn) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭Statement
	 * 
	 * @param stmt
	 */
	public  static void close(Statement stmt) {
		if (null != stmt) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭ResultSet
	 * 
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		if (null != rs) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭执行Select的JDBC资源
	 * 
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		close(rs);
		close(stmt, conn);
	}

	/**
	 * 关闭用来执行Insert,Update,Delete的JDBC资源
	 * 
	 * @param stmt
	 * @param conn
	 */
	public static void close(Statement stmt, Connection conn) {
		close(stmt);
		close(conn);
	}
}
