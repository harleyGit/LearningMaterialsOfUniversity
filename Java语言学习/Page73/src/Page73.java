
public class Page73 {
	public static void main(String [] args)
	{
		int i,j;
		int level=7;
		int [][] iaYong=new int[level][];
		System.out.println("杨辉三角");
		for(i=0;i<iaYong.length;i++)
		
			iaYong[i]=new int[i+1];
			iaYong[0][0]=1;
			for(i=1;i<iaYong.length;i++){
//				System.out.println(is);
				iaYong[i][0]=1;
				for(j=1;j<iaYong[i].length-1;j++)
					iaYong[i][j]=iaYong[i-1][j-1]+iaYong[i-1][j];
				iaYong[i][iaYong[i].length-1]=1;
			}
			for(int[] row:iaYong) //利用foreach语句显示出杨辉三角
			{
				for(int col : row)
				System.out.print(col+" ");
				System.out.println();
			}
				
		
	}

}
