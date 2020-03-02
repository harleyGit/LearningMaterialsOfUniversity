package org.ly.db;
/**
 * close database connection
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CloseSql {

	
	public  static void CloseDB(ResultSet rs,Statement stmt,Connection con){
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    public static void CloseDB(Statement stmt,Connection con){
    	try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
   public static  void CloseDB(Connection con){
	   try {
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
    }
}
