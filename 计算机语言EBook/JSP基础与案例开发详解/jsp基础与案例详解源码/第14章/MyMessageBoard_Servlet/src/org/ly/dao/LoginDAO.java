package org.ly.dao;
/**
 * factory class 
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ly.bean.Admin;
import org.ly.bean.Message;

public interface LoginDAO {
	//验证登录信息
	public boolean login(Admin admin);
	//插入留言
	public boolean insertMessage(Message message);
	//获取一条留言记录
	public Message getOneMessage(int id);
	//回复留言
	public boolean repeatMessage(Message message);
	//删除留言 
	public boolean deleteMessage(int id);
	//更新留言
	public boolean updataMessage(Message message);
	//获取全部记录数
	public int getAllCount();
	//获取全部记录信息
	public HashMap getAllMessage(int page_count,int row);
	//获取模糊查询全部记录数
	public int getByLikeCount(String keyWord);
	//获取模糊查询相关记录信息
	public List selectByLike(String str,int page_count,int row);
}
