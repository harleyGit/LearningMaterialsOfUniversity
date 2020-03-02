//加载java.io类库中的程序
import java.io.*;

public class Page33 {
	
	public static void main(String[] args) throws IOException
	
	{
		String str;
		
		BufferedReader buf;
		
		buf=new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("请输入字符串:");
		
		str=buf.readLine();
		
		System.out.println("您输入的字符创是："+str);
		
	}

}
