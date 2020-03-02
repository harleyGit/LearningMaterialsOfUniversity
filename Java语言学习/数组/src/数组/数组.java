package 数组;

public class 数组 {
	public static void main(String[] args){
		
		int [][] ints=new int[3][];
		ints[0]=new int[3];
		ints[1]=new int[2];
		ints[2]=new int[1];
		for(int i=0;i<ints.length;i++){
			for(int j=0;j<=ints[i].length;j++)
				ints[i][j]=i*5+i;}
		for(int i=0;i<ints.length;i++){
			for(int j=0;j<ints[i].length;j++)
			System.out.println(ints[i][j]);}
	}

}
