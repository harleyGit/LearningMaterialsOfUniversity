import java.io.*;

public class Page36 {
	public static void main(String[] args) throws IOException
	{
		int num1,num2;
		String str1,str2;   //声明String类型的变量
		InputStreamReader in; //声明in为InputStreamReader类型的变量，该类在java类库中
		in=new InputStreamReader(System.in);//创建in对象
		BufferedReader buf;//声明buf为BufferedReader类的变量，该类在java.io类库中
		buf=new  BufferedReader(in);//创建buf对象
		System.out.print("请输第一个数：");
		str1=buf.readLine();//用reacline（）方法读入字符串str，且必须处理IOException异常
		num1=Integer.parseInt(str1);
		System.out.print("请输第二个数：");
		str2=buf.readLine();
		num2=Integer.parseInt(str2);
		System.out.println(num1+"*"+num2+"="+(num1*num2));
		
	}
	

}
