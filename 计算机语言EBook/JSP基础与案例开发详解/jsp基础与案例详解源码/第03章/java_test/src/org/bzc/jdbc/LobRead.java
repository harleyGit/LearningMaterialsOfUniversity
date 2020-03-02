package org.bzc.jdbc;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.bzc.db.ConnectionFactory;
import org.bzc.db.DbClose;

public class LobRead {
  public void lobread(){
	  Connection conn = ConnectionFactory.getConnection();
	  PreparedStatement pstmt = null;
	  String sql = "SELECT id,name,content,image FROM stuinfo WHERE name=?";
	  ResultSet rs = null;
	  BufferedReader br =null;
	  try {
	  	pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, "test");
	  	rs = pstmt.executeQuery();
	  	while (rs.next()) {
	  		Reader rd = rs.getCharacterStream(3);
	  		br = new BufferedReader(rd);
	  		String str = null;			
	  		while((str = br.readLine()) != null){
	  			System.out.println(str);
	  		}
	  		Blob blob = rs.getBlob(4);
	  		BufferedInputStream bis = new BufferedInputStream(blob
	  						                       .getBinaryStream());
	  		BufferedOutputStream bos = new BufferedOutputStream(
	  						new FileOutputStream("d:/bzc.bmp"));

	  		byte[] buffer = new byte[1024];
	  		int count = -1;
	  		while ((count = bis.read(buffer, 0, 1024)) != -1) {
	  			bos.write(buffer, 0, count);
	  		}
	  		bos.flush();
	  		bos.close();
	  			System.out.println("\n------->Õº∆¨–¥∫√¡À!");
	  		}
	  } catch (SQLException e) {
	  	e.printStackTrace();
	  } catch (IOException e) {
	  	e.printStackTrace();
	  } finally {
	  	DbClose.close(pstmt, conn);
	  }
  }
  public static void main(String[] args) {
	LobRead lobread = new LobRead();
	lobread.lobread();
}
}
