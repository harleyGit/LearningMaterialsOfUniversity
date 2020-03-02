package org.fly.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.fly.beans.Bbs;
import org.fly.beans.Bbslink;
import org.fly.beans.Bbsnews;
import org.fly.beans.Board;
import org.fly.beans.Bookmark;
import org.fly.beans.Classtype;
import org.fly.beans.Config;
import org.fly.beans.Friend;
import org.fly.beans.Log;
import org.fly.beans.Message;
import org.fly.beans.Online;
import org.fly.beans.User;
import org.fly.beans.Vote;

public class ControlDB {
	/***************************************************************************
	 * 查询论坛中的帖子信息
	 * 
	 * @param sql
	 *            数据库查询语句
	 * @return List 返回结果--List类型
	 * @throws Exception
	 *             向上抛错误
	 */
	public List executeQueryBbs(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Bbs bbs = new Bbs();
				int i = 1;
				bbs.setAnnounceID(rs.getInt(i++));// 获取ID
				bbs.setParentID(rs.getInt(i++));// 获取主论坛ID
				bbs.setChild(rs.getInt(i++));// 获取子论坛ID
				bbs.setBoardID(rs.getInt(i++));// 获取帖子ID
				bbs.setUserName(rs.getString(i++));// 获取帖子作者
				bbs.setUserEmail(rs.getString(i++));// 作者Email
				bbs.setTopic(rs.getString(i++));// 作者头像
				bbs.setTitle(rs.getString(i++));// 帖子标题
				bbs.setBody(rs.getString(i++));// 帖子内容
				bbs.setDateAndTime(rs.getString(i++));// 发帖时间
				bbs.setHits(rs.getInt(i++));// 点击率
				bbs.setIp(rs.getString(i++));// 发贴者IP
				bbs.setExpression(rs.getString(i++));// 作者经验值
				bbs.setIstop(rs.getInt(i++));// 是否为置顶帖子
				bbs.setIslock(rs.getInt(i++));// 是否锁定帖子
				bbs.setIsgood(rs.getInt(i++));// 是否为精华
				bbs.setIsvote(rs.getInt(i++));// 是否为投票贴
				bbs.setHeart(rs.getString(i++));// 帖子心情
				bbs.setType(rs.getString(i++));// 帖子类别
				bbs.setLastre(rs.getString(i++));// 最后回复时间

				list.add(bbs);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * 日前还用不上
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List executeQueryBbslink(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Bbslink bbslink = new Bbslink();
				int i = 1;
				bbslink.setId(rs.getInt(i++));
				bbslink.setBoardname(rs.getString(i++));
				bbslink.setReadme(rs.getString(i++));
				bbslink.setUrl(rs.getString(i++));
				list.add(bbslink);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * 论坛公告信息
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List executeQueryBbsnews(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Bbsnews bbsnews = new Bbsnews();
				int i = 1;
				bbsnews.setId(rs.getInt(i++));// 主键ID
				bbsnews.setBoardid(rs.getInt(i++));// 公告位于那个版块
				bbsnews.setTitle(rs.getString(i++));// 公告标题
				bbsnews.setContent(rs.getString(i++));// 公告内容
				bbsnews.setUsername(rs.getString(i++));// 发布者
				bbsnews.setAddtime(rs.getString(i++));// 发布时间
				list.add(bbsnews);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * 论坛版块信息查询
	 * 
	 * @param sql
	 *            查询语句
	 * @return List 返回List
	 * @throws Exception
	 *             向上抛错误
	 */
	public List executeQueryBoard(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Board board = new Board();
				int i = 1;
				board.setBoardid(rs.getInt(i++));// 主键ID
				board.setBoardType(rs.getString(i++));// 论坛名称
				board.setClassType(rs.getInt(i++));// 所属主论坛类别
				board.setReadme(rs.getString(i++));// 论坛简介
				board.setModerid(rs.getInt(i++));  //版主ID
				board.setBoardMaster(rs.getString(i++));// 管理员
				board.setLockboard(rs.getInt(i++)); // 是否锁定
				board.setForumlogo(rs.getString(i++));// 论坛Logo
				board.setIndexIMG(rs.getString(i++));// 首页论坛图片
				board.setLastrootid(rs.getInt(i++));// 最后发帖ID
				board.setLasttitle(rs.getString(i++)); // 最后帖子标题
				board.setBoarduser(rs.getString(i++));// 最后帖子作者
				board.setLastposttime(rs.getString(i++));// 最后帖子时间
				list.add(board);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/**
	 * 未知方法
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List executeQueryBookmark(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Bookmark bookmark = new Bookmark();
				int i = 1;
				bookmark.setId(rs.getInt(i++));
				bookmark.setUsername(rs.getString(i++));
				bookmark.setUrl(rs.getString(i++));
				bookmark.setTopic(rs.getString(i++));
				bookmark.setAddtime(rs.getString(i++));
				list.add(bookmark);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * 论坛类别信息
	 * 
	 * @param sql
	 *            查询语句
	 * @return List
	 * @throws Exception
	 */
	public List executeQueryClasstype(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Classtype classtype = new Classtype();
				int i = 1;
				classtype.setId(rs.getInt(i++));// 主键ID
				classtype.setClassType(rs.getString(i++));// 论坛类别
				list.add(classtype);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * 网站信息管理
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public List executeQueryConfig(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Config config = new Config();
				int i = 1;
				config.setForumName(rs.getString(i++));// 论坛名称
				config.setForumURL(rs.getString(i++));// 论坛主页地址
				config.setCompanyName(rs.getString(i++));// 公司名
				config.setHostUrl(rs.getString(i++));// 主页
				config.setSystemEmail(rs.getString(i++));// 管理员邮箱
				config.setLogo(rs.getString(i++));// 网站LOGO
				config.setIpFlag(rs.getInt(i++)); // 是否显示IP
				config.setGuestuser(rs.getInt(i++)); // 是否显示游客
				config.setAds1(rs.getString(i++));// 首页广告
				config.setAds2(rs.getString(i++));// 尾页广告
				config.setCopyright(rs.getString(i++));// 版权信息
				config.setVersion(rs.getString(i++));// 版本信息
				config.setTitleFlag(rs.getString(i++));// 是否显示用户头衔
				config.setUploadFlag(rs.getString(i++));// 是否允许上传头像
				config.setWealthReg(rs.getInt(i++));// 注册金钱
				config.setWealthAnnounce(rs.getInt(i++));// 发帖加金钱
				config.setWealthReannounce(rs.getInt(i++));// 回复加金钱
				config.setWealthDel(rs.getInt(i++));// 删贴减金钱
				config.setWealthLogin(rs.getInt(i++));// 登录加金钱
				config.setEpReg(rs.getInt(i++));// 注册经验值
				config.setEpAnnounce(rs.getInt(i++));// 发帖加经验值
				config.setEpReannounce(rs.getInt(i++));// 回复加经验值
				config.setEpDel(rs.getInt(i++));// 删贴减经验值
				config.setEpLogin(rs.getInt(i++));// 登录加经验值
				config.setCpReg(rs.getInt(i++));// 注册魅力
				config.setCpAnnounce(rs.getInt(i++));// 发帖魅力
				config.setCpReannounce(rs.getInt(i++));// 回复魅力
				config.setCpDel(rs.getInt(i++));// 删贴时魅力
				config.setCpLogin(rs.getInt(i++));// 登录时加魅力
				config.setMaxonline(rs.getInt(i++));// 最大在线数
				config.setMaxonlineDate(rs.getString(i++));// 最大在线数发生时间
				list.add(config);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	public List executeQueryFriend(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Friend friend = new Friend();
				int i = 1;
				friend.setF_id(rs.getInt(i++));
				friend.setF_username(rs.getString(i++));
				friend.setF_friend(rs.getString(i++));
				friend.setF_addtime(rs.getString(i++));
				list.add(friend);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	public List executeQueryLog(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Log log = new Log();
				int i = 1;
				log.setL_id(rs.getInt(i++));
				log.setL_username(rs.getString(i++));
				log.setL_content(rs.getString(i++));
				log.setL_url(rs.getString(i++));
				log.setL_addtime(rs.getString(i++));
				list.add(log);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	public List executeQueryMessage(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Message message = new Message();
				int i = 1;
				message.setId(rs.getInt(i++));
				message.setSender(rs.getString(i++));
				message.setIncept(rs.getString(i++));
				message.setTitle(rs.getString(i++));
				message.setContent(rs.getString(i++));
				message.setFlag(rs.getInt(i++));
				message.setSendtime(rs.getString(i++));
				message.setDelR(rs.getInt(i++));
				message.setDelS(rs.getInt(i++));
				message.setIsSend(rs.getInt(i++));
				list.add(message);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	public List executeQueryOnline(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Online online = new Online();
				int i = 1;
				online.setId(rs.getInt(i++));
				online.setUsername(rs.getString(i++));
				online.setBbstype(rs.getInt(i++));
				online.setIp(rs.getString(i++));
				online.setStartime(rs.getString(i++));
				online.setBrowser(rs.getString(i++));
				online.setState(rs.getInt(i++));
				list.add(online);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * 用户信息表
	 * 
	 * @param sql
	 *            查询语句
	 * @return List
	 * @throws Exception
	 */
	public List executeQueryUser(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				User user = new User();
				int i = 1;
				user.setUserID(rs.getInt(i++));// 主键ID
				user.setUserName(rs.getString(i++));// 用户名
				user.setNickName(rs.getString(i++));
				user.setUserEmail(rs.getString(i++));// 用户Email
				user.setArticle(rs.getInt(i++));// 发表文章数
				user.setUserPassword(rs.getString(i++));// 密码
				user.setSign(rs.getString(i++));// 个性化签名
				user.setSex(rs.getString(i++));// 性别
				user.setHomepage(rs.getString(i++));// 主页
				user.setAddDate(rs.getString(i++));// 注册日期
				user.setLogins(rs.getInt(i++));// 登录资料
				user.setFace(rs.getString(i++));// 头像
				user.setWidth(rs.getInt(i++));// 头像宽
				user.setHeight(rs.getInt(i++));// 头像高
				user.setQq(rs.getString(i++));// QQ号
				user.setLastlogin(rs.getString(i++));// 最后登录日期
				user.setBbstype(rs.getInt(i++));// 允许访问的版块类型
				user.setLockuser(rs.getInt(i++));// 锁定用户
				user.setUserWealth(rs.getInt(i++));// 用户金钱
				user.setUserEP(rs.getInt(i++));// 用户经验
				user.setUserCP(rs.getInt(i++));// 用户魅力

				list.add(user);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	public List executeQueryVote(String sql) throws Exception {
		ResultSet rs = null;
		List list = new ArrayList();
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Vote vote = new Vote();
				int i = 1;
				vote.setVoteid(rs.getInt(i++));
				vote.setAnnounceid(rs.getInt(i++));
				vote.setVote(rs.getString(i++));
				vote.setVotenum(rs.getInt(i++));
				vote.setVoteuser(rs.getString(i++));
				vote.setVotetype(rs.getInt(i++));
				list.add(vote);// 将结果加入到List中以便返回
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	public void executeUpdate(String sql) throws Exception {
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseUtils.closeObject(stmt, con);
		}
	}

	// 在删除中加入事务处理
	public void executeUpdate(String sql[]) throws Exception {
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionFactory.getConnection();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			for (int i = 0; i < sql.length; i++) {
				stmt.executeUpdate(sql[i]);
			}
			con.commit();
		} catch (Exception ex) {
			con.rollback();
			ex.printStackTrace();
		} finally {
			DatabaseUtils.closeObject(stmt, con);
		}
	}
}
