
public class Page69 {
	public static void main(String[] args){
		
		final int N=13,S=3,M=5;
		int i=S-1,j,k=N,g=1;
		int [] a=new int[N];
		for(int h=1;h<=N;h++)
			a[h-1]=h;
		System.out.println("\n出圈的顺序为：");
		do{
			i=i+(M-1);
			while(i>=k)
				i=i-k;
			System.out.print(" "+a[i]);
			for(j=i;j<k-1;j++)
				a[j]=a[j+1];
			k--;
			g++;
		}while(g<=N);
			
	}

}
