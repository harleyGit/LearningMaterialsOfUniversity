import java.util.*;
public class Page37 {
	public static void main (String[] args)
	{
	int num1;
	double num2;
	Scanner reader=new Scanner(System.in);//用System.in创建一个Scanner对象
	System.out.println("请输第一个数：");
	num1=reader.nextInt();//讲述的内容做int型数据赋值给变量num1
	System.out.println("请输第2⃣️个数：");
	num2=reader.nextDouble();
	System.out.println(num1+"*"+num2+"="+((float)num1*num2));
	
	}

}
