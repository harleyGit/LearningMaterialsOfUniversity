//
//  main.c
//  数组处理批量数据
//
//  Created by 黄刚 on 2017/1/25.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <math.h>
#define N 15

int main(int argc, const char * argv[])
{
    void screenForPrime();
    void diagonaiIsEvaluated();
    void insertOfTheArray();
    void arrayOfSaddlePoints();
    void binarySearch();
    void statisticsArticleCharacter();
    void decoding();
    void connectionString();
    
    
    
//    筛选法求素数
//    screenForPrime();
    
//    3*3对角线求值
//    diagonaiIsEvaluated();
    
//    数组插入元素
//    insertOfTheArray();
    
//    找出二维数组的鞍点
//    arrayOfSaddlePoints();

//    折半查找
//    binarySearch();
    
//    统计3行文字的各个字符
//    statisticsArticleCharacter();
    
//    电文解码
//    decoding();
    
//    连接字符串
//    connectionString();
//    int  a[7];
//    for (int i= 0 ; i < 5 ; i++)
//    {
//        printf("请输入字符:");
//        scanf("%d",&a[i]);
//        printf("\n");
//    }
    int a,b,c;
    printf("请输入：\n");
    scanf("%d",&a);
    printf("请输入：\n");
    scanf("%d",&b);
    printf("请输入：\n");
    scanf("%d",&c);
    printf("a=%5d b=%5d c=%5d：\n",a,b,c);
    
    printf("\n");
        return 0;
}


//    筛选法求素数
void screenForPrime()
{
    int a[101],n = 0;
    for (int i = 0; i <= 100; i ++)
        a[i] = i;
    a[1] = 0;//先挖掉1
    
    for (int i = 2; i <sqrt(100); i ++)
        for (int j = i+1; j <= 100; j ++)
        {
            if (a[i] != 0 && a[j] != 0)
                if (a[j] % a[i] == 0)
                    a[j] = 0;
        }
    for ( int i = 1; i <=100; i ++)
    {
        if (a[i] != 0)
        {
            printf("%5d",a[i]);
            n ++;
        }
        
        if (n % 10 ==0)
            printf("\n");

    }
    
}


void diagonaiIsEvaluated()
{
    int a[3][3],sum = 0;
    printf("请输入矩阵中的元素：\n");
    for (int i = 0; i <3; i ++)
        for (int j = 0 ; j < 3 ; j ++)
        {
//            printf("请输入数组中的元素：");
            scanf("%d",&a[i][j]);
        }
    
    for (int i = 0; i < 3; i ++)
    {
        sum = sum + a[i][i];
    }
    sum = sum + a[0][2]+a[2][0];
    
    printf("3*3对角线的值为：%d",sum);
}

void insertOfTheArray()
{
    int A[10] = {1,4,6,9,13,16,19,28};
    printf("未插入前数组中的元素：\n");
    for (int i = 0; i < 10; i++)
        printf("a[%d]= %d\n",i,A[i]);
        
    int a,temp = 0,sign = 0; //sign标记从第几个元素为空着
    printf("Pleasr input inserted element:\n ");
    scanf("%d",&a);
    
    
    for (int i= 0; i < 9; i ++)
        if (a > A[i] && a < A[i +1])
            temp = i+1 ;
    
//    找出数组中第几个元素为空着
    for (int i = 9; i > temp; i --)
        if (A[i] != 0)
        {
            sign = i+1;
            break;
        }
    
//    移动元素
    for (int i = sign; i >= temp ; i--)
        A[i] = A[i-1];
    
    A[temp] = a; //插入元素；
    printf("插入后数组中的元素：\n");
    for (int i = 0; i < 10; i++)
        printf("a[%d]= %d\n",i,A[i]);
            
}

void arrayOfSaddlePoints()
{
    int a[4][5],max=0,column = 0;
    printf("请输入一个4*5列的数组。\n");
    for (int i = 0; i < 4; i++)
    {
        printf("请输入第%d行数据",i);
        for (int j =0; j <5; j++)
            scanf("%d",&a[i][j]);
    }
    
    for (int i = 0; i <4; i++)
    {
        printf("\n");
        for (int j = 0; j <5; j++)
            printf("%d",a[i][j]);
    }
    
    for (int i = 0; i< 4; i++)
    {
        max = a[i][0];
        for (int j = 1; j < 5; j++)
        {
            if (max < a[i][j])
            {
                max = max > a[i][j] ?max:a[i][j];
                column = j;
            }
        }
        
        for (int c = 0; c < 4; c ++)
        {
            if (max > a[c][column])
            {
                printf("第%d行的鞍点是%d",i,a[i][column]);
            }
        }

    }
    
}


void binarySearch()
{
    int intermediateValueCalculation(int start,int middle,int end);
//    数据68,   58,   57,   56,   45,   44,   34,   23,   12,    8,    6,    5,    4,    3,    1
//    int a[15];
    int search,start=0,end=14,middle=0,flag = 1,local = 0,sign;
    /*
    printf("请输入第一个数：\n");
    scanf("%d",&a[14]);
    int i = 13;
    
    while (i >=0)
    {
        printf("请输入元素：");
        scanf("%d",&a[i]);
        
        if (a[i] > a[i +1])
            i --;
        else
            printf("请重新输入!\n");
//        printf("\n");
        
    }
    */
   int a[]= {68,58,57,56,45,44,34,23,12,8,6,5,4,3,1};
    printf("输入的元素是：\n");
    int j = 0;
    while (j < N)
    {
        printf("%3d,",a[j]);
        j ++;
    }
    printf("\n");

    
    
    while (flag)
    {
        printf("请输入要查找的数：");
        scanf("%d",&search);
        
        if (search < a[N-1] && search >a[0])
            local = -1;//查找的数不在正常范围内
        sign = 0 ;//sign为0表示尚未找到
        
        if (((start+N) %2) != 0)
            middle = (0 +N)/2 +1;
        //    else
        //        middle = (0 +N)/2;

        while ((!sign) && (start <= end))
        {
            if (search > a[middle])
            {
                //        if ((middle+start)%2 !=0)
                //        {
                //            end = middle-1;
                //            middle = (start +end)/2 +1;
                //        }
                //        else
                //        {
                //            end = middle-1;
                //            middle = (start +end)/2;
                //
                //        }
                end = middle -1;
                middle = intermediateValueCalculation(start, middle, end);
            }else if(search < a[middle])
            {
                //        if ((middle+end)%2 !=0)
                //        {
                //            start = middle-1;
                //            middle = (start +end)/2 +1;
                //        }
                //        else
                //        {
                //            start = middle-1;
                //            middle = (start +end)/2;
                //            
                //        }
                start = middle -1;
                middle = intermediateValueCalculation(start, middle, end);
                
            }else
            {
                printf("数组第%d个元素",middle+1);
                sign = 1;
            }

        }
        
        if ((!sign || local == -1))//sign 为0或local等于-1，意味着找不到
            printf("找不到%d\n",search);
        printf("是否继续查找？“是”请输入“Y”，“不是”请输入“N”：\n");
        char c;
        scanf("%c",&c);
        
        if (c == 'N'  || c == 'n')
        {
            flag = 0;
        }
        
        
        
    }
}

//中间值计算
int intermediateValueCalculation(int start,int middle,int end)
{
    if ((middle+end)%2 !=0)
    {
//        start = middle-1;
        middle = (start +end)/2 +1;
    }
    else
    {
//        start = middle-1;
        middle = (start +end)/2;
        
    }

    return  middle;
}


void statisticsArticleCharacter()
{
//    验证数据
//    I am a student.
//    123456
//    ASDEFG

    int capitalLetters=0,lowercaseLetters=0,digital=0,blankSpace=0,other=0;
    char a[3][80];
    printf("请输入三行文字\n");
    
    for (int i = 0; i <3; i++)
    {
        printf("请输入第%d行:\n",i+1);
//        for (int j = 0; j < 80; j++)
//        {
////            printf("请输入数据\n");
//            scanf("%c",&a[i][j]);
//        }
        gets(a[i]);
    }
    
    for (int i =0 ; i < 3; i ++)
    {
        for (int j= 0; j<80 && a[i][j] !='\0'; j++)
        {
            if ('a'<=a[i][j] && a[i][j]<='z')
            {
                lowercaseLetters ++;
            }else if('A'<=a[i][j] && a[i][j]<='Z')
                capitalLetters ++;
            else if ('0'<=a[i][j] && a[i][j]<='9')
                digital ++;
            else if(a[i][j] == ' ')
                blankSpace ++;
            else
                other ++;
        }
    }
    
    printf("大写字母%d个，\n小写字母%d个，\n数字%d个，\n空格%d个，\n其他%d个。",capitalLetters,lowercaseLetters,digital,blankSpace,other);
}

void decoding()
{
//    验证数据：R dro erhrg Xsrmz mvcq dvvp.
    char x[80],y[80];
    printf("密码解密，请输入密文：\n");
    gets(x);
    printf("原有的密文是：%s\n",x);
    int i = 0;
    while (x[i] != '\0')
    {
        if ('a' < x[i] && x[i] < 'z')
        {
            y[i] = 219- x[i];
        }else if(( 'A'< x[i] && x[i] < 'Z'))
            y[i] = 155-x[i];
        else
            y[i] = x[i];
        
        i ++;
    }
    
//    for (int i = 0; i < 80 ; i++)
//    {
//        x[i] = -x[i]+27;
//        continue;
//    }
    printf("明文为：%s",y);
}



void connectionString()
{
//验证数据：x1：country，x2：side
    char x1[30],x2[10];
    printf("请输入x1数组中的元素，输入15个。\n");
    scanf("%s",x1);
    printf("请输入x2数组中的元素，输入少于10个。\n");
    scanf("%s",x2);
    
    for (int i = 0; i < 30 ; i ++)
    {
        if (x1[i] == '\0')
        {
            for (int j = 0; j< 10; j++,i++)
            {
                if (x2[j] != '\0')
                {
                    x1[i] = x2[j];
                }else
                    break;
            }
            break;
            
        }
    }
    
    /*
     或者这样也行
    int i = 0;
    while (x1[i] != '\0')
        i ++;
    int j = 0;
    while (x2[j] != '\0')
        x1[i++] = x2[j ++];
    x1[i]='\0';
    */
    printf("合并后的元素是：%s",x1);

}

