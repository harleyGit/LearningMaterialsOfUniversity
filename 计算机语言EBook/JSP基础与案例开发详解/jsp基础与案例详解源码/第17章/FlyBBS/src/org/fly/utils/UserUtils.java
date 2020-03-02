package org.fly.utils;

import java.util.List;

import org.fly.beans.User;
import org.fly.biz.UserBiz;

public class UserUtils {
	private User user = new User();
	private UserBiz userbiz = new UserBiz();
	
	//返回用户详细信息。
	public  User getUserInfo(String name){	
		user.setUserName(name);
		List list = userbiz.searchById(3, user);
		user = (User)list.get(0);
		return user;
	}
	
	//转换等级
	/***
	 * 1级为学徒工 0~1000
	 * 2级为实习生 1001~3000
	 * 3级为初级程序员 3001~5000
	 * 4级为中级程序员 5001~10000
	 * 5级为高级程序员 10001~30000
	 * 6级为项目组长 30001~50000
	 * 7级为项目经理 50001~100000
	 * 8级为技术总监 100001~200000
	 * 9级为CEO	200001~500000
	 * 10级为董事长 500001
	 */
	public static int getGrade(int ep){
		int i=0;
		if(ep>100 && ep<1000){
			i=1;
		}else if(ep>1000 && ep<=3000){
			i=2;
		}else if(ep>3000 && ep<=5000){
			i=3;
		}else if(ep>5000 && ep<=10000){
			i=4;
		}else if(ep>10001 && ep<=30000){
			i=5;
		}else if(ep>30001 && ep<=50000){
			i=6;
		}else if(ep>50001 && ep<=100000){
			i=7;
		}else if(ep>100001 && ep<=200000){
			i=8;
		}else if(ep>200000 && ep<=500000){
			i=9;
		}else if(ep>500000){
			i=10;
		}else{
			i=0;
		}
		return i;
	}
	
	//转换金钱
	public static float getWealth(User user){
		int j=UserUtils.getGrade(user.getUserEP());
		if(j==0){
			j=1;
		}
		float we = user.getUserWealth();
		float i =0;	
		do{
			i=we/(j*100);
			we=i;
		}while(we>100);		
		return i;
	}
	
	//转换经验值
	public static float getEP(User user){
		int j=UserUtils.getGrade(user.getUserEP());
		if(j==0){
			j=1;
		}
		float ep = user.getUserEP();
		float i =0;	
		do{
			i=ep/(j*100);
			ep=i;
		}while(ep>100);		
		return i;
	}
	
	//转换魅力值
	public static float getCP(User user){
		int j=UserUtils.getGrade(user.getUserEP());
		if(j==0){
			j=1;
		}
		float cp = user.getUserCP();
		float i =0;	
		do{
			i=cp/(j*100);
			cp=i;
		}while(cp>100);		
		return i;
	}
}
