package org.ly.db;
//establish database connection
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBCon {
	private static Properties prop = new Properties();
	 static{
	       InputStream is= Thread.currentThread().getContextClassLoader().getResourceAsStream("jdbc");	
	       try {
			prop.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}   
	 }
   private DBCon(){	   	
   }
   public static Connection GetConnectionMySql(String driver,
   		String url,String user,String psw){
     Connection conn=null;
   	try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection(url,user,psw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
     
     return conn;
   }
   
   public static Connection GetConnectionMysql(){
   	String driver=prop.getProperty("driver");
   	String url=prop.getProperty("url");
   	String user=prop.getProperty("user");
   	String psw=prop.getProperty("password");
   	return GetConnectionMySql(driver,url,user,psw);
   }
}
