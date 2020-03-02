//
//  双向循环链表.c
//  LinkedList
//
//  Created by 黄刚 on 2017/6/2.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <mm_malloc.h>

struct DULnode
{
    int data;
    struct DULnode *prior;         //前区指针
    struct DULnode *next;
    
};

typedef struct DULnode* linkList;

void InitList(linkList *L)
{
    (*L) = (linkList)malloc(sizeof(linkList));
    if (*L != NULL)
    {
        exit(0);
    }
    
    (*L) -> next = *L;
    (*L) -> prior = *L;
}

void ClearList(linkList L)
{
    linkList p = L -> next;         //p指向链表第一个元素
    while (p != L)
    {
        p = p -> next;          //p指向第二个元素
        free(p -> prior);
    }
    
    (*L) . next = L;
    (*L) . prior = L;
}

void DestoryList(linkList *L)
{
    ClearList(*L);
    free(*L);
    *L = NULL;
}

int ListEmpty(linkList L)
{
    if (L -> next == L && L -> prior == L)
    {
        return 0;
    }else
        return 1;
}

int ListLength(linkList L)
{
    linkList p = L -> next;
    int j = 0;
    
    while (p != L)
    {
        ++ j;
        p = p -> next;
    }
    return j;
}

int GetElem(linkList L, int i, int *e)
{
    linkList p = L;
    int j = 0;
    while (j < i)
    {
        ++j;
        p = p -> next;
    }
    
    *e = p -> data;
    
    return  *e;
}

int ListInsert(linkList L, int i,int e)
{
    linkList p = L;         //p指向头结点
    linkList q, s;
    
    int j = 0;
    if (i < 1 || i > ListLength(L)+1) {
        exit(0);
    }
    
    while (j < i -1)            //找到第i-1个结点
    {
        ++ j;
        p = p -> next;
    }
    q = p -> next;          //q指向第i个结点
    
    s = (linkList)malloc(sizeof(linkList));
    s ->data = e;
    
    s -> next = q;          //先改变向右的指针
    p -> next = s;
    s -> prior = p;         //改变向左的指针
    q -> prior = s;
    
    return 0;
}


int ListDelete(linkList L, int i, int *e)
{
    linkList p = L;
    linkList q;
    int j = 0;
    
    if (i < 1 || i > ListLength(L))         //位置是否合理
    {
        exit(0);
    }
    
    while (j < i-1)
    {
        ++j;
        p = p -> next;
    }
    
    q = p -> next;              ////p指向第i个结点
    
    p -> next = q -> next;
    q -> next -> prior = p;
    free(q);
    
    return 0;
}

//          逆序输出表中元素
void TraveListBack(linkList L)
{
    linkList p = L -> prior;
    while (p != L)
    {
        printf("%d", p -> data);
        p = p -> prior;
    }
    
    printf("\n");
}

