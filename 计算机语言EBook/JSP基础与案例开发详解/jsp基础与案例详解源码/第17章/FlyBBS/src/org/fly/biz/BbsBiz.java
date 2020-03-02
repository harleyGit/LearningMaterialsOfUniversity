package org.fly.biz;

import java.util.ArrayList;
import java.util.List;

import org.fly.beans.Bbs;
import org.fly.db.ControlDB;

public class BbsBiz {
	ControlDB controlDB = null;

	public BbsBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from bbs where AnnounceID=" + id;
		String sql2 = "delete from bbs where Child=" + id;
		String sqls[] = { sql, sql2 };
		try {
			controlDB.executeUpdate(sqls);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean m_delete_reply(int id) {
		boolean flag = false;
		String sql = "delete from bbs where AnnounceID=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean m_delete(int id) {
		boolean flag = false;
		String sql = "update bbs set state=0 where AnnounceID=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean m_edit_j(int type, int id) {
		boolean flag = false;
		String sql = "";
		if (type == 0) {
			sql = "update bbs set isgood=1 where AnnounceID=" + id;
		} else if (type == 1) {
			sql = "update bbs set istop=1 where AnnounceID=" + id;
		} else if (type == 2) {
			sql = "update bbs set islock=1 where AnnounceID=" + id;
		} else if (type == 3) {
			sql = "update bbs set istop=0 where AnnounceID=" + id;
		} else if (type == 4) {
			sql = "update bbs set islock=0 where AnnounceID=" + id;
		} else if (type == 5) {
			sql = "update bbs set isgood=0 where AnnounceID=" + id;
		}
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, Bbs bbs) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {// 查询全部帖子信息，包括主题贴和回复贴
			sql = "select * from bbs order by DateAndTime desc";
		} else if (flag == 1) {// 查询所有帖子
			sql = "select * from bbs where Boardid=" + bbs.getBoardID()
					+ " and ParentID =" + +bbs.getParentID()
					+ " order by DateAndTime desc";
		} else if (flag == 2) {// 查询版块中所有主题的记录
			sql = "select * from bbs where Boardid=" + bbs.getBoardID()
					+ " and ParentID =" + +bbs.getParentID()
					+ " and Child=0 and state=1 order by lastre desc";
		} else if (flag == 3) {// 按id查询单条帖子信息
			sql = "select * from bbs where AnnounceID=" + bbs.getAnnounceID()
					+ " order by DateAndTime desc";
		} else if (flag == 4) {// 查询主题贴下的所有回帖...也可用于查询所有主题贴（chile为0）
			sql = "select * from bbs where Child=" + bbs.getAnnounceID()
					+ " order by DateAndTime desc";
		} else if (flag == 5) {// 查询今天的帖子数
			sql = "select * from bbs b where EXTRACT(YEAR FROM b.DateAndTime) = EXTRACT(YEAR FROM CURDATE())  and EXTRACT(MONTH FROM b.DateAndTime)=EXTRACT(MONTH FROM CURDATE()) and EXTRACT(DAY FROM b.DateAndTime)=EXTRACT(DAY FROM CURDATE())";
			// select * from Logs where EXTRACT(YEAR FROM date) = EXTRACT(YEAR
			// FROM CURDATE()) and EXTRACT(MONTH FROM date)=EXTRACT(MONTH FROM
			// CURDATE()) and EXTRACT(DAY FROM date)=EXTRACT(DAY FROM
			// CURDATE())；
		}
		try {
			list = controlDB.executeQueryBbs(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Bbs bbs) {
		String sql = "insert into bbs(ParentID,Child,BoardID,UserName,UserEmail,Topic,Title,Body,DateAndTime,hits,ip,Expression,istop,islock,isgood,isvote,heart,type,lastre,state) values('"
				+ bbs.getParentID()
				+ "','"
				+ bbs.getChild()
				+ "','"
				+ bbs.getBoardID()
				+ "','"
				+ bbs.getUserName()
				+ "','"
				+ bbs.getUserEmail()
				+ "','"
				+ bbs.getTopic()
				+ "','"
				+ bbs.getTitle()
				+ "','"
				+ bbs.getBody()
				+ "','"
				+ bbs.getDateAndTime()
				+ "','"
				+ bbs.getHits()
				+ "','"
				+ bbs.getIp()
				+ "','"
				+ bbs.getExpression()
				+ "','"
				+ bbs.getIstop()
				+ "','"
				+ bbs.getIslock()
				+ "','"
				+ bbs.getIsgood()
				+ "','"
				+ bbs.getIsvote()
				+ "','"
				+ bbs.getHeart()
				+ "','"
				+ bbs.getType()
				+ "','"
				+ bbs.getDateAndTime() + "'," + bbs.getState() + ")";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(int re, Bbs bbs) {
		String sql = "update bbs set ParentID='" + bbs.getParentID()
				+ "',Child='" + bbs.getChild() + "',BoardID='"
				+ bbs.getBoardID() + "',UserName='" + bbs.getUserName()
				+ "',UserEmail='" + bbs.getUserEmail() + "',Topic='"
				+ bbs.getTopic() + "',Body='" + bbs.getBody()
				+ "',DateAndTime='" + bbs.getDateAndTime() + "',hits='"
				+ bbs.getHits() + "',ip='" + bbs.getIp() + "',Expression='"
				+ bbs.getExpression() + "',istop='" + bbs.getIstop()
				+ "',isvote='" + bbs.getIsvote() + "' where id='"
				+ bbs.getAnnounceID() + "'";
		if (re == 1) {// 更新最后回复时间
			sql = "update bbs set lastre='" + bbs.getLastre()
					+ "' where AnnounceID='" + bbs.getAnnounceID() + "'";
		} else if (re == 2) {
			sql = "update bbs set hits=hits+1 where AnnounceID="
					+ bbs.getAnnounceID();
		}
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
