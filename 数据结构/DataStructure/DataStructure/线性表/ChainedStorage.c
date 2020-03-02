//
//  ChainedStorage.c
//  DataStructure
//
//  Created by 黄刚 on 2019/3/22.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//  malloc 函数用法：https://www.cnblogs.com/shiweihappy/p/4246372.html

#include "ChainedStorage.h"
#include "time.h"


typedef  struct Node* LinkList; //Node* 等价于 LinkList

//链表的初始化
 Status initChainedList(LinkList *list){
     //产生头结点,并使L指向此头结点
    *list = (LinkList)malloc(sizeof(Node));
     
     //存储分配失败
    if (!(list)) {
        return TRUE;
    }
     //指针域为空
    (*list)->next = NULL;

    return FALSE;
}

//初始条件：顺序线性表L已存在。操作结果：若L为空表，则返回TRUE，否则返回FALSE
Status emptyList(LinkList *list){
    if (!(*list)->next) {
        return FALSE;
    }
    return TRUE;
}

//单链表的长度
int chainedListLength(LinkList list){
    int i = 0;
    //指向第一个节点
    LinkList nextElemype = list->next;
    
    while (nextElemype) {
        nextElemype = nextElemype->next;
        i ++;
    }
    return i;
}


//初始条件：顺序线性表L已存在,1≤i≤ListLength(L)
//操作结果：在L中第i个位置之前插入新的数据元素e，L的长度加1，若是i=1，相当于头插法
Status chainedListInsert(LinkList *list, int i, int e){
    int j = 1;
    LinkList insertNode = (LinkList)malloc(sizeof(LinkList));
    LinkList tagNode = *list;
    
    if (!(*list) || j > i) {
        return FALSE;
    }
    
    //寻找第i个结点
    while (tagNode && j < i) {
        tagNode = tagNode->next;
        ++ j;
        
    }
    
    if (tagNode != NULL || i > 1) {
        insertNode->next = tagNode->next;
        tagNode->next = insertNode;
        insertNode->data = e;
       
        return TRUE;
    }
    

    return TRUE;
}

//单链表值的遍历
int chainedListTraverse(LinkList *list){
    if ((*list)->next == NULL) {
        return FALSE;
    }
    
    printf("链表的值是：");
    
    LinkList traverse = (*list)->next;
    while (traverse) {
        printf("%d,  ", traverse->data);
        traverse = traverse->next;
    }
    return TRUE;
}

//链表的删除
//LinkList *list申明的变量中，*list是一个变量，而且是一个指针变量。相当于 int a，这个a相当于 *list
int deleteChainedList(LinkList *list){
    
    LinkList p = (*list)->next;
    LinkList q = NULL;
    
    while (p) {
        //先判断p是否存在，再对q赋值，否则容易造成崩溃
        q = p->next;
        free(p);
        p = q;
    }
    
    //头结点指针域为空
    (*list)->next = NULL;
    
    return TRUE;
}


//单链表删除第i个元素，用e返回其值
int deleteChainedListElement(LinkList *list, int i, int *e){
    int length = chainedListLength((*list));
    if (i > length) {
        return FALSE;
    }
    if (i < 1) {
        return FALSE;
    }
    
    if ((*list)->next == NULL) {
        return FALSE;
    }
    
    LinkList tagNode = *list;
    
    for (int j  = 1; j < i; j ++) {
        tagNode = tagNode->next;
    }
    
    LinkList deleteNode = tagNode->next;
    *e = deleteNode->data;
    LinkList nextNode = deleteNode->next;
    
    tagNode->next = nextNode;
    free(deleteNode);
    
    
    return TRUE;
}

//头插法创建链表
int createListOfHeadInsert(LinkList *list, int length){
    if (length < 0) {
        return  FALSE;
    }
    
    //初始化随机数种子
    srand(time(0));
    //先建立一个带头结点的单链表
    (*list) = (LinkList)malloc(sizeof(Node));
    (*list)->next = NULL;
    
    while (length > 0) {
        LinkList insertNote = (LinkList)malloc(sizeof(Node));//注意：sizeof里的是类型名字，不能是LinkList，它是Node *
        insertNote->data = length;  //insertNote->data = rand()%100+1;
        insertNote->next = (*list)->next;
        //插入到表头
        (*list)->next = insertNote;
        
        length --;
    }
    
    return TRUE;
}


//尾插法创建链表
int createListOfTailInsert(LinkList *list, int length){
    if (length < 0) {
        return FALSE;
    }
    
    *list = (LinkList)malloc(sizeof(Node));
    //是指针的一种浅拷贝，相当于整型之间的赋值一样
    LinkList tagNode = *list;
    
    while (length > 0) {
        LinkList insertNode = (LinkList)malloc(sizeof(Node));
        insertNode->data = length;
        //将表尾终端结点的指针指向新结点
        tagNode->next = insertNode;
        //将当前的新结点定义为表尾终端结点
        tagNode = insertNode;
        
        length --;
    }
    
    //表示当前链表结束
    tagNode->next = NULL;
    
    return TRUE;
    
}


void pritStruct(LinkList *list){
    if ((*list) -> next != NULL) {
        pritStruct(&(*list) -> next);
    }else {
        printf("\n %d", (*list)->data);
        return;
    }
    printf("\n %d", (*list)->data);
}

#pragma mark -- 链表方法调用
void chainedListTest(void){
    LinkList list;
    int i, j, k, e;
    
    //初始化
    i = initChainedList(&list);
    printf("初始化list的长度：ListLength(list)= %d\n",chainedListLength(list));
    
    //插入数据
    for (j = 1; j < 6; j ++) {
        i = chainedListInsert(&list, 1, j);
    }
    pritStruct(&list);
    return;
    printf("\n\n在list的表头依次插入1～5后：list.data=");
    chainedListTraverse(&list);
    
    //删除链表
    i = deleteChainedList(&list);
    printf("\n\n链表删除后的布尔值：%d(1:是 0:否)", i);
    
    
    //删除某一个元素
    for (j = 1; j <= 10; j ++) {
        chainedListInsert(&list, j, j);
    }
    printf("\n\n在list的表尾依次插入1～10后：list.data=");
    chainedListTraverse(&list);
    j=5;
    i = deleteChainedListElement(&list,j,&e); /* 删除第5个数据 */
    printf("\n\n删除元素后的布尔值：%d(1:是 0:否),删除第%d个的元素值为：%d\n",i,j,e);
    printf("\n\n在list的表尾依次插入1～9后：list.data=");
    chainedListTraverse(&list);
    i = deleteChainedList(&list);
    printf("\n\n链表删除后的布尔值：%d(1:是 0:否)", i);
    
    
    //头插法创建链表
    createListOfHeadInsert( &list, 20);
    chainedListTraverse(&list);
    i = deleteChainedList(&list);
    printf("\n\n头插法链表删除后的布尔值：%d(1:是 0:否)\n\n", i);
    
    
    //尾插法创建链表
    createListOfTailInsert(&list, 20);
    chainedListTraverse(&list);
    i = deleteChainedList(&list);
    printf("\n\n尾插法链表删除后的布尔值：%d(1:是 0:否)", i);
    
    
    printf("\n\n");
    
}


