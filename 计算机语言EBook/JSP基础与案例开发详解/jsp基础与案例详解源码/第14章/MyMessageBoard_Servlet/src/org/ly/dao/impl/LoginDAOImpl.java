package org.ly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.ly.bean.Admin;
import org.ly.bean.Message;
import org.ly.dao.LoginDAO;
import org.ly.db.DBCon;

public class LoginDAOImpl implements LoginDAO {

	Connection con = null;
	//get all count
	public int getAllCount(){
		int count=0;
		con = DBCon.GetConnectionMysql();
		String sql = "SELECT COUNT(id) FROM message";
		try{
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next())
		{
			count = rs.getInt(1) ;
		}
		pstmt.close() ;
		rs.close() ;
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	//get all count by like
	public int getByLikeCount(String keyWord){
		int count=0;
		con = DBCon.GetConnectionMysql();
		String sql = "SELECT COUNT(id) FROM message WHERE motif LIKE ? OR context LIKE ?";
		try{
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%" + keyWord + "%");
		pstmt.setString(2, "%" + keyWord + "%");
		ResultSet rs = pstmt.executeQuery();
		if(rs.next())
		{
			count = rs.getInt(1) ;
		}
		pstmt.close() ;
		rs.close() ;
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	// updata message
	public boolean updataMessage(Message message) {
		boolean falg = false;
		DateFormat df = new SimpleDateFormat();
		String name = "管理员";
		String motif = "无主题";
		int id = message.getId();
		if (message.getName() != null && message.getName() != "")
			name = message.getName();
		if (message.getMotif() != null && message.getMotif() != "")
			motif = message.getMotif();
		String date = df.format(new Date());
		String context = message.getContext();
		con = DBCon.GetConnectionMysql();
		String sql = "UPDATE  message SET motif=?,context=?,messageDate=? WHERE id=?";
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, motif);
			stmt.setString(2, context);
			stmt.setString(3, date);
			stmt.setInt(4, id);
			int i = stmt.executeUpdate();
			if (i > 0) {
				falg = true;
			}
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return falg;
	}

	// delete one message
	public boolean deleteMessage(int id) {
		boolean falg = false;
		Message message = new Message();
		con = DBCon.GetConnectionMysql();
		String sql = "DELETE FROM message WHERE id = " + id;
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			boolean temp = st.executeUpdate(sql) > 0;
			if (temp) {
				falg = true;
			}
			st.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return falg;
	}

	// select by like
	public List selectByLike(String str,int page_count,int row) {	
		List list = new ArrayList();
		con = DBCon.GetConnectionMysql();
		String sql = "SELECT * FROM message WHERE motif LIKE ? OR context LIKE ? LIMIT "+(page_count-1)*row+","+row;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, "%" + str + "%");
			stmt.setString(2, "%" + str + "%");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Message message = new Message();
				message.setId(rs.getInt("id"));
				message.setName(rs.getString("name"));
				message.setMotif(rs.getString("motif"));
				message.setContext(rs.getString("context"));
				message.setMessageDate(rs.getString("messageDate"));
				list.add(message);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// select message where id = id
	public Message getOneMessage(int id) {
		Message message = new Message();
		con = DBCon.GetConnectionMysql();
		String sql = "SELECT * FROM message WHERE id =" + id;
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			message.setId(rs.getInt("id"));
			message.setName(rs.getString("name"));
			message.setMotif(rs.getString("motif"));
			message.setContext(rs.getString("context"));
			message.setMessageDate(rs.getString("messageDate"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}

	// repeat message
	public boolean repeatMessage(Message message) {
		boolean falg = false;
		DateFormat df = new SimpleDateFormat();
		String name = "管理员";
		int id = message.getId();
		if (message.getName() != null && message.getName() != "")
			name = message.getName();
		String date = df.format(new Date());
		String context = name + "回复：" + message.getContext() + "　时间：" + date;
		con = DBCon.GetConnectionMysql();
		String sql = "UPDATE  message SET revert=? WHERE id=?";
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, context);
			stmt.setInt(2, id);
			if (!stmt.execute()) {
				falg = true;
			}
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return falg;
	}

	// insert message
	public boolean insertMessage(Message message) {
		boolean falg = false;
		DateFormat df = new SimpleDateFormat();
		String name = "游客";
		String motif = "无主题";
		if (message.getName() != null && message.getName() != "")
			name = message.getName();
		if (message.getMotif() != null && message.getMotif() != "")
			motif = message.getMotif();
		String date = df.format(new Date());
		String context = message.getContext();
		con = DBCon.GetConnectionMysql();
		String sql = "INSERT INTO message(name,motif,context,messageDate) VALUES (?,?,?,?)";
		PreparedStatement stmt = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, motif);
			stmt.setString(3, context);
			stmt.setString(4, date);
			if (!stmt.execute()) {
				falg = true;
			}
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return falg;
	}

	// select all message
	public HashMap getAllMessage(int page_count,int row) {
		HashMap map = new HashMap();
		List list = new ArrayList();
		con = DBCon.GetConnectionMysql();
		String sql = "SELECT * FROM message ORDER BY id DESC LIMIT "+(page_count-1)*row+","+row;
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				DateFormat format = new SimpleDateFormat();
				Message message = new Message();
				message.setId(rs.getInt("id"));
				message.setName(rs.getString("name"));
				message.setMotif(rs.getString("motif"));
				message.setContext(rs.getString("context"));
				message.setMessageDate(rs.getString("messageDate"));
				message.setRevert(rs.getString("revert"));
				list.add(message);
			}
			rs.close();
			st.close();
			map.put("all", list);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;
	}

	// this method for login
	public boolean login(Admin admin) {
		boolean falg = false;
		con = DBCon.GetConnectionMysql();
		String sql = "SELECT * FROM person AS p WHERE p.uid=? AND p.pwd=?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, admin.getUid());
			stmt.setString(2, admin.getPwd());
			rs = stmt.executeQuery();
			while (rs.next()) {
				falg = true;
			}
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return falg;
	}

}
