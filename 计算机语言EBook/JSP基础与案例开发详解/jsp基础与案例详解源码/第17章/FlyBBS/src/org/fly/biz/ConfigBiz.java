package org.fly.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import org.fly.beans.*;
import org.fly.db.*;

public class ConfigBiz {
	ControlDB controlDB = null;

	public ConfigBiz() {
		controlDB = new ControlDB();
	}

	public boolean delete(int id) {
		boolean flag = false;
		String sql = "delete from config where id=" + id;
		try {
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List searchById() {
		String sql = "";
		List list = new ArrayList();
		sql = "select * from config";
		try {
			list = controlDB.executeQueryConfig(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 暂时不用 －－－添加网站信息
	// public boolean add(Config config) {
	// String sql = "insert into
	// config(ForumName,ForumURL,CompanyName,HostUrl,SystemEmail,Logo,IpFlag,guestuser,ads1,ads2,Copyright,Version,TitleFlag,uploadFlag,wealthReg,wealthAnnounce,wealthReannounce,wealthDel,wealthLogin,epReg,epAnnounce,epReannounce,epDel,epLogin,cpReg,cpAnnounce,cpReannounce,cpDel,cpLogin,Maxonline,MaxonlineDate)
	// values('"
	// + config.getForumName()
	// + "','"
	// + config.getForumURL()
	// + "','"
	// + config.getCompanyName()
	// + "','"
	// + config.getHostUrl()
	// + "','"
	// + config.getSystemEmail()
	// + "','"
	// + config.getLogo()
	// + "','"
	// + config.getIpFlag()
	// + "','"
	// + config.getGuestuser()
	// + "','"
	// + config.getAds1()
	// + "','"
	// + config.getAds2()
	// + "','"
	// + config.getCopyright()
	// + "','"
	// + config.getVersion()
	// + "','"
	// + config.getTitleFlag()
	// + "','"
	// + config.getUploadFlag()
	// + "','"
	// + config.getWealthReg()
	// + "','"
	// + config.getWealthAnnounce()
	// + "','"
	// + config.getWealthReannounce()
	// + "','"
	// + config.getWealthDel()
	// + "','"
	// + config.getWealthLogin()
	// + "','"
	// + config.getEpReg()
	// + "','"
	// + config.getEpAnnounce()
	// + "','"
	// + config.getEpReannounce()
	// + "','"
	// + config.getEpDel()
	// + "','"
	// + config.getEpLogin()
	// + "','"
	// + config.getCpReg()
	// + "','"
	// + config.getCpAnnounce()
	// + "','"
	// + config.getCpReannounce()
	// + "','"
	// + config.getCpDel()
	// + "','"
	// + config.getCpLogin()
	// + "','"
	// + config.getMaxonline()
	// + "','"
	// + config.getMaxonlineDate() + "')";
	// boolean flag = false;
	// try {
	// controlDB.executeUpdate(sql);
	// flag = true;
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return flag;
	// }

	/**
	 * 此方法为论坛变量设置
	 * 
	 * @param config
	 * @return boolean
	 */
	public boolean updateInfo(Config config) {
		Connection dbc = null;
		boolean falg = false;
		PreparedStatement stmt = null;
		try {
			dbc = ConnectionFactory.getConnection();
			String sql = "update config set ForumName=?,ForumURL=?,CompanyName=?,HostURL=?,SystemEmail=?,Logo=?"
					+ ",IpFlag=?,TitleFlag=?,uploadFlag=?,guestUser=?,ads1=?,ads2=?,CopyRight=?,Version=?";
			stmt = dbc.prepareStatement(sql);
			int i = 1;
			stmt.setString(i++, config.getForumName());
			stmt.setString(i++, config.getForumURL());
			stmt.setString(i++, config.getCompanyName());
			stmt.setString(i++, config.getHostUrl());
			stmt.setString(i++, config.getSystemEmail());
			stmt.setString(i++, config.getLogo());
			stmt.setInt(i++, config.getIpFlag());
			stmt.setString(i++, config.getTitleFlag());
			stmt.setString(i++, config.getUploadFlag());
			stmt.setInt(i++, config.getGuestuser());
			stmt.setString(i++, config.getAds1());
			stmt.setString(i++, config.getAds2());
			stmt.setString(i++, config.getCopyright());
			stmt.setString(i++, config.getVersion());
			int io = stmt.executeUpdate();
			if (io > -1) {
				falg = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseUtils.closeObject(stmt, dbc);
		}
		return falg;
	}

	/***************************************************************************
	 * 更新网站金钱变更
	 * 
	 * @param config
	 * @return boolean
	 */
	public boolean updateWealth(Config config) {
		boolean flag = false;
		try {
			String sql = "update config set " + "wealthReg="
					+ config.getWealthReg() + ",wealthLogin="
					+ config.getWealthLogin() + ",wealthAnnounce="
					+ config.getWealthAnnounce() + ",wealthDel="
					+ config.getWealthDel() + ",wealthReAnnounce="
					+ config.getWealthReannounce() + ",epReg="
					+ config.getEpReg() + ",epLogin=" + config.getEpLogin()
					+ ",epAnnounce=" + config.getEpAnnounce() + ",epDel="
					+ config.getEpDel() + ",epReAnnounce="
					+ config.getEpReannounce() + ",cpReg=" + config.getCpReg()
					+ ",cpLogin=" + config.getCpLogin() + ",cpAnnounce="
					+ config.getCpAnnounce() + ",cpDel=" + config.getCpDel()
					+ ",cpReAnnounce=" + config.getCpReannounce();
			controlDB.executeUpdate(sql);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
