package org.fly.biz;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.fly.beans.Board;
import org.fly.db.ControlDB;

public class BoardBiz {
	ControlDB controlDB = null;

	public BoardBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from board where boardid=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, Board board) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {// 查询所有版块信息
			sql = "select * from board";
		} else if (flag == 1) {// 查询单条版块信息
			sql = "select * from board where boardid=" + board.getBoardid();
		}
		try {
			list = controlDB.executeQueryBoard(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Board board) {
		String sql = "insert into board(BoardType,classType,readme,BoardMaster,lockboard,Forumlogo,indexIMG) values('"
				+ board.getBoardType()
				+ "','"
				+ board.getClassType()
				+ "','"
				+ board.getReadme()
				+ "','"
				+ board.getBoardMaster()
				+ "','"
				+ board.getLockboard()
				+ "','"
				+ board.getForumlogo()
				+ "','"
				+ board.getIndexIMG() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean edit_moder(Board board) {
		String sql = "update board set moderid="+board.getModerid()+",BoardMaster='" + board.getBoardMaster()
				+ "' where boardid='" + board.getBoardid() + "'";
		boolean flag = false;
		System.out.println(sql);
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Board board) {
		String sql = "update board set BoardType='" + board.getBoardType()
				+ "',classType='" + board.getClassType() + "',readme='"
				+ board.getReadme() + "',BoardMaster='"
				+ board.getBoardMaster() + "',lockboard='"
				+ board.getLockboard() + "' where boardid='"
				+ board.getBoardid() + "'";

		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
