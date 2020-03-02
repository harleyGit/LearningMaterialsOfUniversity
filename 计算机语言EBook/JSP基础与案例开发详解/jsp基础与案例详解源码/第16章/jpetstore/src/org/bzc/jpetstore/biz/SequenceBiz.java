package org.bzc.jpetstore.biz;

import java.util.ArrayList;
import java.util.List;
import org.bzc.jpetstore.beans.*;
import org.bzc.jpetstore.db.*;

public class SequenceBiz {
	ControlDB controlDB = null;

	public SequenceBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from sequence where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById(int flag, int id) {
		String sql = "";
		List list = new ArrayList();
		if (flag == 0) {
			sql = "select * from sequence order by id desc";
		} else if (flag == 1) {
			sql = "select * from sequence where id=" + id + " order by id desc";
		}
		try {
			list = controlDB.executeQuerySequence(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Sequence sequence) {
		String sql = "insert into sequence(name,nextid) values('"
				+ sequence.getName() + "','" + sequence.getNextid() + "')";
		boolean flag = false;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean update(Sequence sequence) {
		String sql = "update sequence set nextid='" + sequence.getNextid()
				+ "' where id='" + sequence.getName() + "'";
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
