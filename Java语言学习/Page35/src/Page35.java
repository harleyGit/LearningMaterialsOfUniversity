import java.io.*;

public class Page35 {
	
	public static void main(String[] args) throws IOException
	{
		float num;
		
		String str;
		
		BufferedReader buf;
		
		buf=new BufferedReader (new InputStreamReader(System .in));
		
		System.out.print("请输入一个数：");
		
		str=buf.readLine();
		
		num=Float.parseFloat(str);
		
		System.out.println("您输入的数为："+num);
		
		
	}

}
