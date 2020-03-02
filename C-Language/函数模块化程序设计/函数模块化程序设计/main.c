//
//  main.c
//  函数模块化程序设计
//
//  Created by 黄刚 on 2017/1/25.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <math.h>

#define MAX 1000

int main(int argc, const char * argv[])
{
    /*
     
    printf("--------------比较法排序-------------------");
    void moreExchange(double a[],int n);
    double a[10];
    printf("请输入10个数：");
    for (int i = 0; i <10; i++)
        scanf("%lf",&a[i]);
    moreExchange(a, 10);
    for (int j = 0; j< 10; j++)
        printf("从大到小的排列是：%5.2lf\n",a[j]);
    
     
     
    printf("--------------选择法排序-------------------\n");
    void selectionSort(int a[],int n);
    int a1[10];
    printf("请输入数组：");
    for (int i = 0; i < 10; i ++)
        scanf("%d",&a1[i]);
    selectionSort(a1, 10);
    printf("从小到大选择排序：\n");
    for (int i = 0; i < 10; i ++)
        printf("a[%d]=%d\n",i,a1[i]);
    */
    
    void quadraticEquationRoot();
    void ranksOfConversion();
    void longestWord();
    void turnDecimalHexadecimal();
    void recursionMax();
    void recursiveIntegerString();
    
//    二次元方程求根
//    quadraticEquationRoot();
    
//    3x3行列转换
//    ranksOfConversion();
    
//    最长单词输出
//    longestWord();
    
//    十六进制转换为十进制
//    turnDecimalHexadecimal();
    
//    递归求4个数的最大数
//    recursionMax();
    
//    递归求整数字符串
    recursiveIntegerString();
    
    
    
    return 0;
}

//排序----选择交换
//测试数据5 7 -3 21 -43 67 321 33 51 0
void moreExchange(double a[],int n)
{
    for (int i =0 ; i < n -1; i++)
    {
        double temp = 0.0;
        for (int j = i+1; j<n; j++)
        {
            if (a[i] > a [j])
            {
                temp = a[i];
                a[i] = a[j];
                a[j]= temp;
            }
        }
    }
    
}


//排序---选择法比较
//测试数据：5 7 -3 21 -43 67 321 33 51 0
void selectionSort(int a[],int n)
{
    int temp = 0,k = 0;
    for (int i =0; i <n-1; i++)
    {
        k = i;
        for (int j = i +1; j <n; j ++)
            if (a[k]  > a[j])
                k = j;
        if (k != i)
        {
            temp = a[i];
            a[i] = a[k];
            a[k] = temp;
        }
    }
}


void quadraticEquationRoot()
{
    void greaterThanZero(int a,int b,double disc);
    void equalToZero(int a,int b,double disc);
    void lessThanZero(int a,int b,double disc);

    int a=0,b=0,c=0;
    double disc = 0.0;
    printf("求一元二次方程的根！\n");
    printf("a=");
    scanf("%d",&a);
    printf("\nb=");
    scanf("%d",&b);
    printf("\nc=");
    scanf("%d",&c);
    
    printf("此二元一次方程是：%dx²+%dx+%d=0\n",a,b,c);
    
    disc = b*b -4*a*c;
    
    if (disc > 0)
    {
        greaterThanZero(a, b,disc);
    }else if (disc < 0)
    {
        lessThanZero(a, b, disc);
    }else
        equalToZero(a, b, disc);
    
    
}

void greaterThanZero(int a,int b, double disc)
{
    double result_1=0.0,result_2=0.0;
    
    result_1 = (-b + sqrt(disc))/(2*a);
    result_2 = (-b - sqrt(disc))/(2*a);
    
    printf("x_1的值是：%f,x_2的值是：%f\n",result_1,result_2);
}

void equalToZero(int a,int b,double disc)
{
    double result_1=0.0;
    result_1 =(-b + sqrt(disc))/(2*a);
        printf("x_1的值是：%f\n",result_1);
}

void lessThanZero(int a,int b,double disc)
{
    printf("此方程无解！\n");
}

void ranksOfConversion()
{
    int a[3][3],b[3][3];
    printf("情书入一个3X3的矩阵！\n");
    for (int i = 0; i< 3; i++)
    {
        printf("\n请输入%d行3个元素：",i);
        for (int j = 0; j < 3; j++)
        {
            scanf("%d",&a[i][j]);
        }
    }
    
    printf("本来的矩阵：\n");
    for (int i = 0; i< 3; i++)
    {
        for (int j = 0; j<3; j++)
        {
            printf("%5d",a[i][j]);
        }
        printf("\n");
    }

    
    
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0 ; j< 3; j++)
        {
            b[j][i]= a[i][j];
        }
    }
    
    printf("翻转后的矩阵：\n");
    for (int i = 0; i< 3; i++)
    {
        for (int j = 0; j<3; j++)
        {
            printf("%5d",b[i][j]);
        }
        printf("\n");
    }
}


void longestWord()
{
//    验证数据：We introduce standard C and the key programming and design techniques supported by C.
//    声明一个判断数组元素是否为字母的函数
    int isLetter(char c);
    
    /*
     n:数组长度；
     start：最长单词数组起始位置；
     nowLoction：数组现在元素位置；
     everLength：以前单词的最大长度；
     length：现在单词的长度；
     flag：单词的开始；
     */
    int n = 0, start = 0,nowLocation = 0,everLength = 0,length = 0,flag = 1;
    
    char a[100];
    
    printf("请输入一段话：\n");
    gets(a);
    
    printf("输入的文字是：%s\n",a);
    n = strlen(a);
    
    for (int i = 0; i <= n; i ++)
    {
        if (isLetter(a[i]))
        {
            if (flag)
            {
                nowLocation = i;
                flag = 0;
            }else
                length ++;
        }else
        {
            flag = 1;
            printf("第%d个字母的长度是：%d\n",nowLocation,length);
            if (everLength <= length)
            {
                everLength = length;
                start = nowLocation;
                
            }
            length = 0;
        }
    }
    
    printf("最长的单词是：");
    for (int i = start; isLetter(a[i]); i++)
    {
        printf("%c",a[i]);
    }
    printf("\n");
}

int isLetter(char c)
{
    if (('a' <= c && c <= 'z' )|| ('A' <= c && c <= 'Z') )
    {
        return  1;
    }else
        return 0;
}


void turnDecimalHexadecimal()
{
    int turnDecimal(char a[]);

    int c,i,flag,flag1;
    char t[MAX];
    i = 0;
    flag = 0;
    flag1 = 1;
    
    printf("请输入一个16进制数：");
    while ((c = getchar()) != '\0' && i < 1000 && flag1)
    {
        if ( ('0' <= c && c <= '9')||('a' <= c && c <= 'f' )||( 'A' <= c && c <= 'F'))
        {
            flag = 1;
            t[i++] = c;
            printf("i的值是：%d",i);
        }else if (flag)
        {
            t[i] = '\0';
            printf("十进制数是：%d \n",turnDecimal(t));
            printf("continue or not ?");
            c = getchar();
            if (c == 'N'|| c == 'n')
            {
                flag1 = 0;
            }else
            {
                flag = 0;
                i = 0;
                printf("\n 输入一个16进制数：");
            }
        }
    }
}

int turnDecimal(char a[])
{
    int n = 0;
    for (int i = 0; a[i] != '\0'; i ++)
    {
        if (a[i] >= '0' && a[i] <= '9')
        {
            n = n *16+a[i]-'0';
        }
        
        if (a[i] >= 'A' && a[i] <= 'F')
        {
            n = n *16+a[i]-'A'+10;

        }
        
        if (a[i] >= 'a' && a[i] <= 'f')
        {
            n = n *16+a[i]-'a'+10;
            
        }


    }
    
    return  n;
}


void recursionMax()
{
//    a=23,b=567,c=-2,d=43
    int compare(int a,int b);
    
    int a,b,c,d;
    printf("输入a=");
    scanf("%d",&a);
    printf("\n输入b=");
    scanf("%d",&b);
    printf("\n输入c=");
    scanf("%d",&c);
    printf("\n输入d=");
    scanf("%d",&d);
    
    printf("4个数的最大值是：%d\n",compare(a,compare(b,compare(c,d))));

}

int compare(int a,int b)
{
    return  a>b?a:b;
}


void recursiveIntegerString()
{
//    输出字符串
    void outputString(int a);
    
    int d = 0;
    printf("input an integer:");
    scanf("%d",&d);
    printf("\noutput string：");
    if (d < 0)
    {
        putchar('-');
        putchar(' ');
        d = - d;
    }
    
    outputString(d);
    putchar('\n');
    
}

void outputString(int a)
{
    int i=0;
    
    if ((i=a/10) !=0)
    {
        outputString(i);
    }
    putchar(a%10+'0');
    putchar(32);//输出空格字符
}
