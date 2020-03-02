package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class VoteBiz {
	ControlDB controlDB = null;

	public VoteBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from vote where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, Vote vote) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {
			sql = "select * from vote order by voteid desc";
		} else if (flag == 1) {
			sql = "select * from vote where voteid=" + vote.getVoteid()
					+ " order by voteid desc";
		} else if (flag == 2) {
			sql = "select * from vote where announceid=" + vote.getAnnounceid()
					+ " order by votenum asc";
		} else if (flag == 3) {
			sql = "select * from vote where announceid=" + vote.getAnnounceid()
					+ "  and vote='" + vote.getVote()
					+ "' order by votenum asc";
		}
		try {
			list = controlDB.executeQueryVote(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Vote vote) {
		String sql = "insert into vote(announceid,vote,votenum,voteuser,votetype) values('"
				+ vote.getAnnounceid()
				+ "','"
				+ vote.getVote()
				+ "','"
				+ vote.getVotenum()
				+ "','"
				+ vote.getVoteuser()
				+ "','"
				+ vote.getVotetype() + "')";

		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Vote vote) {
		String sql = "update vote set votenum=votenum+1 where announceid="
				+ vote.getAnnounceid() + "  and vote='" + vote.getVote() + "'";
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
