package org.ly.util;
//test class
import java.util.List;

import org.ly.bean.Message;
import org.ly.dao.impl.LoginDAOImpl;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		LoginDAOImpl login = new LoginDAOImpl();
//		Message message = new Message();
//		message = login.getOneMessage(48);
//		System.out.println(message.getId()+":"+message.getName()+":"+message.getMessageDate());
//		Admin admin = new Admin();
//		admin.setUid("stormynight");
//		admin.setPwd("poby0007");
//		System.out.print(login.login(admin));
//		Calendar c = Calendar.getInstance();
//
//		int nYear=c.get(Calendar.YEAR); 
//		int nMonth=c.get(Calendar.MONTH); 
//		int nDate = c.get(Calendar.DATE);		
//		DateFormat format = new SimpleDateFormat();
//		System.out.println(new Date().toLocaleString());
//		System.out.println(format.format(new Date()));
//		System.out.println(nYear+"年"+(nMonth+1)+"月"+nDate+"日");
		
//		Map map = login.getAllMessage();
//		Set set = map.keySet();
//		Iterator iterator = set.iterator();
//		while(iterator.hasNext()){
//			Message me = (Message)map.get(iterator.next());
//			System.out.println(me.getContext());
//		}
		
//		Message message = new Message();
//		message.setContext("测试一下插入留言");
//		System.out.println(login.insertMessage(message));
//		List list = login.selectByLike("看");
//		for(int i=0;i<list.size();i++){
//			Message message = new Message();
//			message = (Message)list.get(i);
//			System.out.print(message.getId()+":"+message.getMotif()+":"+message.getName());
//		}
	}

}
