//
//  main.c
//  LinkedList
//
//  Created by 黄刚 on 2017/5/30.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//



//注解：Command + alt + /

#include <stdio.h>
#include <mm_malloc.h>
#include <time.h>

#define MAXSIZE 20      //存储空间初始分配量
#define OK 1
#define ERROR 0
#define TRUE 1
#define FALSE 0

//typedef :指定新的类型名来代替已有的类型名
typedef int  ElemType;      //ElemType类型根据实际情况而定，这里假设为int
typedef int Status;


typedef struct Node
{
    ElemType data;
    struct Node *next;
}Node;

typedef struct Node *LinkList;           //struct Node * 定义成了新类型 LinkList。这个类型是一个结构体的指针。LinkList *L相当于struct Node **L，是二级指针
/*
 一级指针与二级指针区别:
 
 二级指针是指向一级指针的指针。
 比如:
 int i;
 int *ip = &i;
 int **ipp = &ip ; //二级指针，其指向一级指针pi的地址空间
 */


//初始化操作，建立一个空的线性表L
LinkList InitList()
{
    LinkList  L;
    L = (Node *)malloc(sizeof(Node));           //初始化节点空间
    if (L == NULL)        //判断是否有足够的内存空间
    {
        printf("申请内存空间失败\n");
    }
    
    L -> next = NULL;           //将next设置为null，初始长度为0的单链表
    return L;
}


//头插法，建立链表,相当于向链表中插入某个元素
LinkList LinkListCreateHeader()
{
    Node *L;
    L = (Node *)malloc(sizeof(Node));
    L -> next = NULL;
    
    ElemType x =1;     //x为链表数据域中的数据
    while (x !=-1)
    {
        Node *p;
        p = (Node *)malloc(sizeof(Node));
        p -> data = x;
        p -> next = L -> next;          //将节点插入到表头L-->|2|-->|1|-->NULL
        L -> next = p;
        scanf("%d",&x);
    }
    
    return L;
}


//尾插法，建立链表，向最后一个插入元素
LinkList LinkListCreateTaill(LinkList L)
{
    Node *r;
    r = L;          //r始终指向终端节点，开始时指向头结点
    ElemType x;     //x为链表数据域中的数据
    
    while (scanf("%d", &x) != ERROR)
    {
        Node *p;
        p = (Node *)malloc(sizeof(Node));       //申请新的节点
        p -> data = x;
        r -> next = p;          //将节点插入到表头L-->|1|-->|2|-->NULL

        r = p ;
    }
    
    return L;
    
}

//      单链表的删除，在链表中删除值为x的元素
LinkList LinkListDelete(LinkList L, ElemType x)
{
    Node *p, *pre = NULL;
    p = L -> next;
    while (p -> data != x)
    {
        pre = p;
        p = p ->next;
        
    }
    
    pre -> next = p ->next;         ////删除操作，将其前驱next指向其后继,pre指向的是p的第一个节点
    free(p);
    
    return L;

}

//      单链表的插入，在链表的第i个位置插入x的元素
LinkList LinkListInsert(LinkList L, int i, ElemType x)
{
    Node *pre;          //pre为前驱节点
    pre = L;
    int tempi = 0;
    for (tempi =1; tempi < i; tempi ++)
    {
        pre = pre ->next;           //查找第i个节点
    }
    
    Node *p;
    p = (LinkList)malloc(sizeof(Node));
    p -> data = x;
    p -> next = pre ->next;
    pre -> next = p;
    
    return L;
    
}




int main(int argc, const char * argv[])
{
    LinkList list, start;
    printf("请输入单链表的数据：");
    list = LinkListCreateHeader();
    for (start = list -> next; start != NULL
         ; start = start -> next)
    {
        printf("%d  ", start -> data);
    }
    printf("\n");
    
    int i;
    ElemType x;
    printf("请输入插入数据的位置：");
    scanf("%d",&i);
    printf("请输入插入数据的值：");
    scanf("%d",&x);
    LinkListInsert(list, i, x);
    for (start = list -> next; start != NULL
         ; start = start -> next)
    {
        printf("%d  ", start -> data);
    }
    printf("\n");
    
    printf("请输入要删除的元素的值：");
    scanf("%d",&x);
    LinkListDelete(list, x);
    for (start = list -> next; start != NULL
         ; start = start -> next)
    {
        printf("%d  ", start -> data);
    }
    printf("\n");


    
    
    printf("Hello, World!\n");
    
    int a = 100;
    int *p1 = &a;
    int **p2 = &p1;
    printf("%d, %d, %d\n",a, *p1, **p2);
    printf("&p1=%#X, p2=%#x\n",&p1,p2);
    printf("&a= %#X, p1= %#X, *p2= %#X\n",&a,p1,*p2);
    
    /*printf("--------------------二级指针---------------------\n");
    int a = 100;
    int *p1 = &a;
    int **p2 = &p1;
    int ***p3 = &p2;
    
    printf("%d, %d, %d, %d\n",a, *p1, **p2, ***p3);
    printf("&p2=%#X, p3=%#x\n",&p2,p3);     //取得是p2的地址
    printf("&p1= %#X, p2= %#X, *p3= %#X\n",&p1,p2,*p3);//*p3则代表指针变量p3指向变量是p2，p2的值是&p1，见：http://c.biancheng.net/cpp/html/85.html
    printf(" &a = %#X, p1 = %#X, *p2 = %#X, **p3 = %#X\n", &a, p1, *p2, **p3);
*/
    return 0;
}
