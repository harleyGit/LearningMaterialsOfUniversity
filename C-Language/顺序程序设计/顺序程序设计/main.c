//
//  main.c
//  顺序程序设计
//
//  Created by 黄刚 on 2017/1/18.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[])
{

    /*
    //    溢出
    printf("-------------------溢出-----------------\n");
    short int a0,b0;
    a0 = 32767;
    b0 = a0+1;
    printf("a= %d,b= %d\n",a0,b0);
    
//    查询变量分配空间
    printf("----------------查询变量分配空间--------------------\n");
    printf("int空间：%lu字节,short int空间：%lu字节,long int空间：%lu字节，long long int空间：%lu字节\n,char空间：%lu字节\n,bool空间：%lu字节\n,float空间：%lu字节\n,double空间：%lu字节\n,long double空间：%lu字节\n",sizeof(int),sizeof(short),sizeof(long),sizeof(long long),sizeof(char),sizeof(_Bool),sizeof(float),sizeof(double),sizeof(long double));
    
    printf("----------------向字符变量赋予整数--------------------\n");
    short c1,c2;
    c1 = 67;
    c2 = 76;
    printf("c1=%c,c2=%c\n",c1,c2);
    printf("c1=%d,c2=%d\n",c1,c2);
    
    signed char c3 = -10;
    printf("负整数赋值给有符号变量,不作为一个字符，而作为一字节整形变量存储负整数。其值：c3=%c\n",c3);
    */
    printf("----------------++和--的用法--------------------\n");
    int a1=1,a2=1,a3=4,a4=4,a5,a6,a7,a8;
    a5 = a1 ++;//++a1的值是a1加1前的值
    a6 = ++ a2;//++a1的值是a2加1后的值(同--一样)
    a7 = a3 --;
    a8 = -- a4;
    printf("++和————只能用于整形变量：a1=%d,a2=%d,a5=%d,a6=%d,a3=%d,a4=%d,a7=%d,a8=%d\n，",a1,a2,a5,a6,a3,a4,a7,a8);
    /*
    printf("----------------赋值过程类型变换--------------------\n");
    int a9 = 289;
    char c0 = 'c';
    c0 = a9;
    printf("c0的值是：%d\n",c0);
   
    printf("----------------各种格式的输出--------------------\n");
    int a10 = 5,b1 = 7;
    float x = 67.8564,y = -789.124;
    char c4 = 'A';
    long n = 1234567;
    unsigned u0 = 65535;
    printf("%d%d\n",a10,b1);
    printf("%3d%3d\n",a10,b1);
    printf("%f,%f\n",x,y);
    printf("%-10f,%-10f\n",x,y);
    printf("%8.2f,%8.2f,%.4f,%.4f,%3f,%3f\n",x,y,x,y,x,y);
    printf("%e,%10.2e\n",x,y);
    printf("%c,%d,%o,%x\n",c4,c4,c4,c4);
    printf("%ld,%lo,%lx\n",n,n,n);
    printf("%u,%o,%x,%d\n",u0,u0,u0,u0);
    printf("%s,%15s\n","COMPUTER","COMPUTER");
    
    
    printf("----------------温度--------------------\n");
    float a;
    scanf("%f",&a);
    float c = (float)5/9*(a-32);
    printf("摄氏温度为%13.2f\n",c);
 
    printf("----------------全单位平均工资--------------------\n");
//    请输入工人的工资： 1234
//    请输入工人的工资：4567.89
//    请输入工人的工资：1456.98
//    请输入工人的工资：-1,结果：2419.62

    float g;
    int p = 0;
    float sum = 0;
    printf("请输入工人的工资：");
    scanf("%f",&g);
    while (g != -1)
    {
        sum = sum +g;
        printf("请输入工人的工资：");
        scanf("%f",&g);
        p ++;
        
    }
    printf("工人的平均工资为：%8.2f\n",(sum/p));

     
    printf("----------------每个班组的平均工资--------------------\n");
//    1567.87,3421.8, -1  2494.89
//    2234.65,2346.9,-1 2290.77

    float g = 0.0,sum;
    int n = 0;
    char ID;
    for (int i = 0; i <= 2; i ++)
    {
        sum = 0;
        n = 0;
        printf("请输入班组号:");
        scanf("%c",&ID);
        printf("%c组员工的工资:",ID);
        scanf("%f",&g);
        while (g != -1)
        {
            sum = sum + g;
            printf("%c组员工的工资:",ID);
            scanf("%f",&g);
            n  ++;
        }
        printf("%c组的平均工资为:%8.2f\n",ID,sum/n);
    }

     
    printf("----------------百鸡问题----------------\n");
    printf("   🐓  母鸡  🐥\n");
    for (int i =0; i<20; i++)
        for (int j = 0; j < 33; j++)
            for (int n = 0; n < 100; n += 3)
                if (n +i +j == 100 && 5*i +j*3 + n/3 == 100)
                    printf("   %d   %d   %d\n",i,j,n);
    
   
    
    printf("----------------猴子吃桃问题----------------\n");
    int sum = 1;//第一天猴子吃的桃子
    for (int i = 9; i >= 1; i --)
    {
        sum = (sum +1)*2;
    }
    printf("猴子总共摘了%d个桃子。\n",sum);

    
    printf("----------------统计字母、空格、数字和其他字符----------------\n");
    char c;
    int letters = 0,blank = 0,figure = 0,other = 0;
    printf("请输入一行字符：\n");
    while ((c = getchar()) !='\n')
    {
        if ((c > 'a' && c < 'z') || (c > 'A' && c < 'Z'))
            letters ++;
        else if(c == ' ')
            blank ++;
        else if ('0'<= c && c <= '9')
            figure ++;
        else
            other ++;
        
    }
    
    printf("%d个英文字母，%d个空格，%d数字，%d个其他字符\n",letters,blank,figure,other);

     
     
    printf("----------------完数----------------\n");
    int s;
    for (int m = 2; m < 1000; m ++)
    {
        s = 0;
        for (int a = 1; a < m; a++)
            if (m %a == 0)
                s = s +a;
        if (s == m)
        {
            printf("%d it's factors are ---->",m);
            
            for (int  j = 1; j < m; j ++)
            {
                if (m % j == 0)
                {
                    printf("%d,",j);
                }
            }
            printf("\n");
        }
    }

     
    printf("----------------自由落下球求反弹----------------\n");
    double s = 100;
    double n = s/ 2;
    
    for (int i = 2; i <= 10; i ++)
    {
        s = s+2 *n;
        n= n*0.5;
    }

    printf("第十次后弹跳的路程是：%f,弹跳的高度是：%f\n",s,n);
    
     
     

    
    printf("----------------迭代法求根----------------\n");
    double a ;
    printf("请输入参数a的值：");
    scanf("%lf",&a);
    double x1,x2;
    x1 = a / 2;
    x2 =  0.5*(x1 + a/x1);
    do
    {
        x1 = x2;
        x2 = 0.5*(x1 + a/x1);
        
    } while (fabs(x1 - x2) >= 1e-5);
    printf("开%3.1lf方的值为：%10.5lf\n",a,x2);
    
     
    
    printf("----------------二分法求值----------------\n");
    float a,b,x,Fx1,Fx2;

//    do {
        printf("输入左区间的值 a=");
        scanf("%f",&a);
        printf("输入➡️区间的值 b=");
        scanf("%f",&b);
        Fx1 = a *(((2 *a)-4)* a+3)-6;
        Fx2 = b *(((2 *b)-4)* b+3)-6;
        
//    } while(Fx1 *Fx2 >0);
    
    do {
        x = (a +b)/2;
        if (( x *(((2 *x)-4)* x+3)-6) < 0)
        {
            a = x;
            Fx1 = ( x *(((2 *x)-4)* x+3)-6);
        }

        if (( x *(((2 *x)-4)* x+3)-6) >0)
        {
             b= x;
            Fx2 = (x *(((2 *x)-4)* x+3)-6);
        }

    }while (fabs(( x *(((2 *x)-4)* x+3)-6)) >= 1e-5);
    printf("x值为：%7.3f \n",x);
     */

    
    printf("----------------菱形⭐️图案----------------\n");
    int j,k=2,a = 0;
    for (int i =1; i <=7; i++)
    {
        if (i > 4)
        {
            a = i;
            i = a - k;
            k +=2;
        }
        for (j =1; j <= (4 -i); j++)
             printf(" ");
        for (j =1; j <=2*i-1 ; j++)
            printf("*");
        printf("\n");
        
        if (a > 4)
        {
            i = a;
        }
    }

    
//    printf("----------------乒乓球比赛----------------\n");
//    char i,j,k;
//    for (i = 'x'; i <= 'z'; i ++)
//        for ( j = 'x'; j <= 'z'; j++)
//            if (i != j)
//                for (k = 'x'; k <= 'z'; k ++)
//                    if (i != k && j != k)
//                        if (i != 'x' && k != 'x' && k != 'z')
//                        printf("A--->%c,\nB--->%c,\nC--->%c\n",i,j,k);
    printf("Hello, World!\n");
    return 0;
}
