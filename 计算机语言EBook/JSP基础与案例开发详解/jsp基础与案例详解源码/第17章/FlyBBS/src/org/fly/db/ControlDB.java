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
	 * ��ѯ��̳�е�������Ϣ
	 * 
	 * @param sql
	 *            ���ݿ��ѯ���
	 * @return List ���ؽ��--List����
	 * @throws Exception
	 *             �����״���
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
				bbs.setAnnounceID(rs.getInt(i++));// ��ȡID
				bbs.setParentID(rs.getInt(i++));// ��ȡ����̳ID
				bbs.setChild(rs.getInt(i++));// ��ȡ����̳ID
				bbs.setBoardID(rs.getInt(i++));// ��ȡ����ID
				bbs.setUserName(rs.getString(i++));// ��ȡ��������
				bbs.setUserEmail(rs.getString(i++));// ����Email
				bbs.setTopic(rs.getString(i++));// ����ͷ��
				bbs.setTitle(rs.getString(i++));// ���ӱ���
				bbs.setBody(rs.getString(i++));// ��������
				bbs.setDateAndTime(rs.getString(i++));// ����ʱ��
				bbs.setHits(rs.getInt(i++));// �����
				bbs.setIp(rs.getString(i++));// ������IP
				bbs.setExpression(rs.getString(i++));// ���߾���ֵ
				bbs.setIstop(rs.getInt(i++));// �Ƿ�Ϊ�ö�����
				bbs.setIslock(rs.getInt(i++));// �Ƿ���������
				bbs.setIsgood(rs.getInt(i++));// �Ƿ�Ϊ����
				bbs.setIsvote(rs.getInt(i++));// �Ƿ�ΪͶƱ��
				bbs.setHeart(rs.getString(i++));// ��������
				bbs.setType(rs.getString(i++));// �������
				bbs.setLastre(rs.getString(i++));// ���ظ�ʱ��

				list.add(bbs);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * ��ǰ���ò���
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
				list.add(bbslink);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * ��̳������Ϣ
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
				bbsnews.setId(rs.getInt(i++));// ����ID
				bbsnews.setBoardid(rs.getInt(i++));// ����λ���Ǹ����
				bbsnews.setTitle(rs.getString(i++));// �������
				bbsnews.setContent(rs.getString(i++));// ��������
				bbsnews.setUsername(rs.getString(i++));// ������
				bbsnews.setAddtime(rs.getString(i++));// ����ʱ��
				list.add(bbsnews);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * ��̳�����Ϣ��ѯ
	 * 
	 * @param sql
	 *            ��ѯ���
	 * @return List ����List
	 * @throws Exception
	 *             �����״���
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
				board.setBoardid(rs.getInt(i++));// ����ID
				board.setBoardType(rs.getString(i++));// ��̳����
				board.setClassType(rs.getInt(i++));// ��������̳���
				board.setReadme(rs.getString(i++));// ��̳���
				board.setModerid(rs.getInt(i++));  //����ID
				board.setBoardMaster(rs.getString(i++));// ����Ա
				board.setLockboard(rs.getInt(i++)); // �Ƿ�����
				board.setForumlogo(rs.getString(i++));// ��̳Logo
				board.setIndexIMG(rs.getString(i++));// ��ҳ��̳ͼƬ
				board.setLastrootid(rs.getInt(i++));// �����ID
				board.setLasttitle(rs.getString(i++)); // ������ӱ���
				board.setBoarduser(rs.getString(i++));// �����������
				board.setLastposttime(rs.getString(i++));// �������ʱ��
				list.add(board);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/**
	 * δ֪����
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
				list.add(bookmark);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * ��̳�����Ϣ
	 * 
	 * @param sql
	 *            ��ѯ���
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
				classtype.setId(rs.getInt(i++));// ����ID
				classtype.setClassType(rs.getString(i++));// ��̳���
				list.add(classtype);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * ��վ��Ϣ����
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
				config.setForumName(rs.getString(i++));// ��̳����
				config.setForumURL(rs.getString(i++));// ��̳��ҳ��ַ
				config.setCompanyName(rs.getString(i++));// ��˾��
				config.setHostUrl(rs.getString(i++));// ��ҳ
				config.setSystemEmail(rs.getString(i++));// ����Ա����
				config.setLogo(rs.getString(i++));// ��վLOGO
				config.setIpFlag(rs.getInt(i++)); // �Ƿ���ʾIP
				config.setGuestuser(rs.getInt(i++)); // �Ƿ���ʾ�ο�
				config.setAds1(rs.getString(i++));// ��ҳ���
				config.setAds2(rs.getString(i++));// βҳ���
				config.setCopyright(rs.getString(i++));// ��Ȩ��Ϣ
				config.setVersion(rs.getString(i++));// �汾��Ϣ
				config.setTitleFlag(rs.getString(i++));// �Ƿ���ʾ�û�ͷ��
				config.setUploadFlag(rs.getString(i++));// �Ƿ������ϴ�ͷ��
				config.setWealthReg(rs.getInt(i++));// ע���Ǯ
				config.setWealthAnnounce(rs.getInt(i++));// �����ӽ�Ǯ
				config.setWealthReannounce(rs.getInt(i++));// �ظ��ӽ�Ǯ
				config.setWealthDel(rs.getInt(i++));// ɾ������Ǯ
				config.setWealthLogin(rs.getInt(i++));// ��¼�ӽ�Ǯ
				config.setEpReg(rs.getInt(i++));// ע�ᾭ��ֵ
				config.setEpAnnounce(rs.getInt(i++));// �����Ӿ���ֵ
				config.setEpReannounce(rs.getInt(i++));// �ظ��Ӿ���ֵ
				config.setEpDel(rs.getInt(i++));// ɾ��������ֵ
				config.setEpLogin(rs.getInt(i++));// ��¼�Ӿ���ֵ
				config.setCpReg(rs.getInt(i++));// ע������
				config.setCpAnnounce(rs.getInt(i++));// ��������
				config.setCpReannounce(rs.getInt(i++));// �ظ�����
				config.setCpDel(rs.getInt(i++));// ɾ��ʱ����
				config.setCpLogin(rs.getInt(i++));// ��¼ʱ������
				config.setMaxonline(rs.getInt(i++));// ���������
				config.setMaxonlineDate(rs.getString(i++));// �������������ʱ��
				list.add(config);// ��������뵽List���Ա㷵��
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
				list.add(friend);// ��������뵽List���Ա㷵��
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
				list.add(log);// ��������뵽List���Ա㷵��
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
				list.add(online);// ��������뵽List���Ա㷵��
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DatabaseUtils.closeObject(rs, stmt, con);
		}
		return list;
	}

	/***************************************************************************
	 * �û���Ϣ��
	 * 
	 * @param sql
	 *            ��ѯ���
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
				user.setUserID(rs.getInt(i++));// ����ID
				user.setUserName(rs.getString(i++));// �û���
				user.setNickName(rs.getString(i++));
				user.setUserEmail(rs.getString(i++));// �û�Email
				user.setArticle(rs.getInt(i++));// ����������
				user.setUserPassword(rs.getString(i++));// ����
				user.setSign(rs.getString(i++));// ���Ի�ǩ��
				user.setSex(rs.getString(i++));// �Ա�
				user.setHomepage(rs.getString(i++));// ��ҳ
				user.setAddDate(rs.getString(i++));// ע������
				user.setLogins(rs.getInt(i++));// ��¼����
				user.setFace(rs.getString(i++));// ͷ��
				user.setWidth(rs.getInt(i++));// ͷ���
				user.setHeight(rs.getInt(i++));// ͷ���
				user.setQq(rs.getString(i++));// QQ��
				user.setLastlogin(rs.getString(i++));// ����¼����
				user.setBbstype(rs.getInt(i++));// ������ʵİ������
				user.setLockuser(rs.getInt(i++));// �����û�
				user.setUserWealth(rs.getInt(i++));// �û���Ǯ
				user.setUserEP(rs.getInt(i++));// �û�����
				user.setUserCP(rs.getInt(i++));// �û�����

				list.add(user);// ��������뵽List���Ա㷵��
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
				list.add(vote);// ��������뵽List���Ա㷵��
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

	// ��ɾ���м���������
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
