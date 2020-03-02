//
//  main.c
//  指针
//
//  Created by 黄刚 on 2017/2/3.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

void needleExchangeNumerical();
void contactAddressAndPointer();
int pointerFunc(int x, int b);
void pointerAsTheArgument();
void fromSmallToTargeInteger();
void positionChange();
void exitTheRoundTable();
void pointerReferenceString();
void pointerToAPointer();




int main(int argc, const char * argv[])
{
    
//    指针和地址的联系
//    contactAddressAndPointer();

//    指针交换比较大小，验证数据：7  9
//    needleExchangeNumerical();
    
//    指针变量作为函数参数
//    pointerAsTheArgument();
    
//    整数由小到大的顺序
//    fromSmallToTargeInteger();
    
//    位置改变
    positionChange();
    
//    圆桌排序，序号为3的退出
//    exitTheRoundTable();
    
//    指针引用字符串
//    pointerReferenceString();
//    pointerToAPointer();
    
    
    /*
     //取址
    int num = 97;
    float scrore = 10.00F;
    int arr[3] = {1, 2, 3};
    int (*ptr)(int, int);
    
    int *p_num = &num;
    float *p_scrore = &scrore;
    int (*p_arr)[3] = &arr; //指向含有3个int元素的数组的指针
    ptr = *pointerFunc;
    const char *msg = "Hello Pointer";
    
    printf(" p_num: %p, *p_num: %d, &num:%p\n", p_num, *p_num, &num);
    printf(" p_scrore: %p,  *p_scrore: %f, &scrore:%p\n", p_scrore, *p_scrore, &scrore);
    printf(" p_arr: %p, *p_arr:%p, &arr:%p\n", p_arr, *p_arr, &arr);
    printf(" pointerFunc 地址：%p, &pointerFunc: %p, *pointerFunc:%p\n", pointerFunc, &pointerFunc, *pointerFunc);
    printf(" msg: %p,  *msg:%c,&msg:%p\n", msg, *msg, &msg);
    int n = (*ptr)(10, 5);
    printf(" n = %d", n);
     */
    
    
    /*
     //解址
    int age = 19;
    int*p_age = &age;
    *p_age  = 20;  //通过指针修改指向的内存数据
    
    printf("age = %d\n",*p_age);   //通过指针读取指向的内存数据
    printf("age = %d\n",age);
     */
    
    /*
     //野指针解决方法
    char *p1 = NULL;
    printf("p1:%p, &p1:%p\n",p1,&p1);
    
    p1 = (char*)malloc(100);    //为p1在堆区分配空间
    if(p1 == NULL)                //若为空直接return出程序
    {
        return 0;
    }
    printf("p1:%p, &p1:%p\n",p1,&p1);
    
    if(p1 != NULL)                //目的：释放p1
    {
        free(p1);                 //只释放了p1指向的堆区空间  并没有将指针p1置为空
        p1 = NULL;
    }
    printf("p1:%p, &p1:%p\n",p1,&p1);
    
    */
    putchar('\n');
    return 0;
}





int pointerFunc(int x, int b){
    return x + b;
}

void contactAddressAndPointer()
{
    int i = 0;
    int *pointer;
    pointer = &i;
    printf("地址：\np:%p,  &p:%p,  &i:%p\n\n",pointer, &pointer, &i);
    printf("值：\n指针变量*pointer：%d,  i的值：%d\n",*pointer,i);
}


void needleExchangeNumerical()
{
    int *p1,*p2,*p3,a,b;
    printf("请输入a，的值：");
    scanf("%d%d",&a,&b);
    p1= &a;
    p2= &b;
    if (*p1 < *p2)
    {
        p3 = p1;
        p1= p2;
        p2 = p3;
    }
    printf("a,b的值没变：\na=%d,b=%d,\na,b的地址是：\n&a=%p,\n&b=%p\n\n",a,b,&a,&b);
    printf("指针所指向的值变了：\n*p1=%d,*p2=%d,\n地址p1,p2：\np1=%p,\np2=%p\n",*p1,*p2,p1,p2);
}

void pointerAsTheArgument()
{
    void swap(int *p1,int *p2);
    
    int a=45,b=87;
    printf("Ever---> a = %d,b = %d\n",a,b);

    int *pointer_1,*pointer_2;
    pointer_1 = &a;//pointer_1(指针变量)存储的是a的地址，pinter_1是存储单元地址
    pointer_2 = &b;//pointer_1存储的是a的地址，pinter_1是存储单元地址
    
    if (a < b)
        swap(pointer_1,pointer_2 );//相当于pointer_1=p1=&a,pointer_2=p2=&b;
    printf("Now ---> a = %d,b = %d\n",a,b);
}

void swap(int *p1,int *p2)
{
    /*
     int i = 0;
     int *pointer;
     pointer = &i;
     *pointer = 100;
    */
    
    int temp;
    temp = *p1;//*p1存储的值是45、a存储的值是45，及*p1=45,a=45;
    *p1 = *p2;//*p2存储的值是87、b存储的值是87，及*p2=87,b=87;
    *p2 = temp;
    
    /*
    与
    temp = a;
    a = b;
    b = temp;
    有一曲同功之妙,但a,b存储的值改变了，但是地址没变，即:
     pointer_1 = p1 = &a,
     pointer_2 = p2 = &b,
     a = 87;
     b = 45;
     */
}


void fromSmallToTargeInteger()
{
    void sortInteger(int x[],int n);
    int a[3];
    printf("Please input 3 array element！\n");
    for (int i = 0; i < 3; i ++)
    {
        printf("please enter %d element:",i);
        scanf("%d",a+i);
        printf("\n");
    }
    
    sortInteger(a, 3);
    
    for (int i = 0 ; i < 3; i ++)
    {
        printf("%5d",*(a+i));
    }
}


void sortInteger(int x[],int n)//起泡法排序
{
    int p = 0;
    for (int i = 0; i < n-1; i ++)
    {
        for (int j = 0 ; j < n-i-1; j++)
        {
            if (*(x+j) > *(x+j+1))
            {
                p = *(x+j);
                *(x+j) = *(x+j+1);
                *(x+j +1) = p;
            }

        }
    }
}


void positionChange()
{
    
    void positionChangeOfInteger(int *a,int number,int position);
    
    int number;
    printf("How many the number of input?,please input  number:\n");
    scanf("%d",&number);
    
    int x[number];
    for (int i = 0; i < number; i++)
        scanf("%d",x+i);
    printf("\n");
    
    for (int i = 0; i < number ; i++)
    {
        printf("%5d",*(x+i));
    }
    printf("\n");
    
    int position = 0;
    printf("How many places do you want to move?pleae input an integer:");
    scanf("%d",&position);
    
    positionChangeOfInteger(x, number,position);
    
    for (int i = 0; i < number; i ++)
    {
        printf("Now ,there are order is:%5d",*(x+i));
    }

    

}

void positionChangeOfInteger(int *a,int number,int position)
{

    int p = 0;
    for (int i = 0; i < number; i ++)
    {
        p = *(a +i);
        
        
    }
}


void exitTheRoundTable()
{
    void deleteElement(int *array,int n);
    
    int n = 0;
    printf("Input number of person: n=");
    scanf("%d",&n);
    
    int a[n];
    for (int i = 0; i < n ; i ++)
        a[i] = i+1;
    
    for (int i = 0; i < n; i++)
    {
        printf("-------%5d",*(a+i));
    }
    
    deleteElement(a,n);
}

void deleteElement(int *array,int n)
{
    int m = 0,i = 0,k =0;
    
    while (m < n-1)
    {
        if (*(array +i) != 0)
        {
            k ++;
        }
        if (k == 3)
        {
            *(array +i) = 0;//退出的人编号为0
            m ++;
            k = 0;
        }
        
        if(i == n-1)
            i = 0;
    }
    
    while (*array == 0)//取出元素中值不为0的数
        array ++;
    
    printf("The last one is No.%d",*array);
}

void pointerReferenceString()
{
    char *string = "I love China";//对字符指针变量string初始化，实际上是把字符串第一个字符的地址(即存放字符串的字符数组的首元素地址,这里指I地址)赋给string。
    printf("%s\n",string);
}

void pointerToAPointer()
{
    char *name[]= {"Fllow me","Great Wall","FORTRAN","Computer Design"};
    
    char **p;//定义p为指向指向指针变量的指针变量
    int i;
    for (i = 0; i < 5; i++)
    {
        p = name +i;//改变p的值即可指向不同的字符串
        printf("%s\n",*p);
    }
    
}




