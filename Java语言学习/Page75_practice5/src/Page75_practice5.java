import java.util.Arrays;
public class Page75_practice5 {
	public static void main(String[] args){
		int[] balls=new int[30];
		int start=0;
		int count=0;
		int length=balls.length;
		System.out.println(length);
		while(length>15)
		{
			if(balls[start]==0){
				count++;
				if((count%=13)==0){
					balls[start]=1;
					length--;
					
				}
			}
			start=(start+1)%30;
		}
		System.out.println(Arrays.toString(balls));
	}
}
