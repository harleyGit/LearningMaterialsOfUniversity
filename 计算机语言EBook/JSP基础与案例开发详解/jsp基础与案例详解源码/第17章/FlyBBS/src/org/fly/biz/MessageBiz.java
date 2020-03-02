package org.fly.biz;

import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class MessageBiz {
	ControlDB controlDB = null;

	public MessageBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from message where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteMess() {
		boolean flag = false;
		String sql = "delete from message where flag = 1";
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, Message message) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {
			sql = "select * from message order by id desc";
		} else if (flag == 1) {
			sql = "select * from message where id=" + message.getId()
					+ " order by id desc";
		} else if (flag == 2) {
			sql = "select * from message where flag=0 and incept='"
					+ message.getIncept() + "' order by id desc";
		}
		try {
			list = controlDB.executeQueryMessage(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List searchByName(String incept) {
		String sql = "";
		List list = new ArrayList();
		sql = "select * from message where sender='" + incept
				+ "' order by id desc";
		try {
			list = controlDB.executeQueryMessage(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Message message) {
		String sql1 = "insert into message(sender,incept,title,content,flag,sendtime,delR,delS,isSend) values('"
				+ message.getSender()
				+ "','"
				+ message.getIncept()
				+ "','"
				+ message.getTitle()
				+ "','"
				+ message.getContent()
				+ "','"
				+ message.getFlag()
				+ "','"
				+ message.getSendtime()
				+ "','"
				+ message.getDelR()
				+ "','"
				+ message.getDelS()
				+ "','"
				+ message.getIsSend() + "')";
		String sql2 = "update user set lockuser=1 where username= '"
				+ message.getSender() + "';";

		boolean flag = false;
		try {
			String[] sql = { sql1, sql2 };
			controlDB.executeUpdate(sql);

			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Message message) {
		String sql = "update message set sender='" + message.getSender()
				+ "',incept='" + message.getIncept() + "',title='"
				+ message.getTitle() + "',content='" + message.getContent()
				+ "',flag='" + message.getFlag() + "',sendtime='"
				+ message.getSendtime() + "',delR='" + message.getDelR()
				+ "',delS='" + message.getDelS() + "',isSend='"
				+ message.getIsSend() + "' where id='" + message.getId() + "'";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean userUpdate(String name) {
		String sql1 = "update message set flag=1 where incept='" + name + "';";
		String sql2 = "update user set lockuser=1 where username='" + name
				+ "';";
		boolean flag = false;
		String[] sql = { sql1, sql2 };
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
