//
//  链栈.c
//  LinkedList
//
//  Created by 黄刚 on 2017/6/4.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <mm_malloc.h>

#define  OK     1
#define ERROR   0

typedef int SElemType;
typedef int  Status;


typedef struct StackNode
{
    SElemType data;
    struct StackNode *next;
}StackNode, *LinkStackPtr;

typedef struct LinkStack
{
    LinkStackPtr top;
    int     count;
}LinkStack;


//初始化栈
Status initStack(LinkStack *S)
{
    LinkStackPtr p;
    p = (LinkStackPtr)malloc(sizeof(StackNode));
    p -> next = NULL;
    S -> top = p;
    S -> count = 0;
    
    return OK;
}


//判断栈是否为空
Status StackEmpty(LinkStack S)
{
    if (S.count == 0)
    {
        return  OK;         //为null
    }else
    {
        return  ERROR;
    }
    
}

//入栈 插入元素e
Status push(LinkStack *S, SElemType e)
{
    LinkStackPtr s = (LinkStackPtr)malloc(sizeof(StackNode));       //生成一个节点
    s -> data = e;
    s -> next = S -> top;       //把当前的栈顶元素值赋给新节点的直接后继
    S -> top = s;       //将新的节点s赋值给栈顶指针
    S -> count ++;
    
    return OK;

}


//出栈,删除栈顶元素 用e返回出栈的值
Status pop(LinkStack *S, SElemType *e)
{
    if (StackEmpty( *S))
    {
        return ERROR;
    }
    
    *e = S -> top -> data;      //保存要出栈的元素
    LinkStackPtr p ;        //将栈顶结点赋值给p
    p = S -> top;
    S -> top = S -> top -> next;        //栈顶指向下一节点
    free(p);
    
    S -> count --;
    return OK;
}


//遍历栈
void stackTraverse(LinkStack S)
{
    if (S.count == 0)
    {
        printf("栈为空\n");
    }else
    {
        LinkStackPtr p;
        p = S.top;
        while (p -> next)
        {
            printf("%d ", p -> data);
            p = p -> next;
        }
        
        printf("\n");
    
    }


}


int main(void){
    LinkStack S;
    SElemType e;
    initStack(&S);
    printf("\n 1.初始化栈 \n 2.遍历栈 \n 3.入栈 \n 4.出栈 \n 0.退出\n");
    int option = 1, value;
    while(option){
        scanf("%d",&option);
        switch(option){
            case 1:
                initStack(&S);
                break;
            case 2:
                stackTraverse(S);
                break;
            case 3:
                printf("请输入要入栈的数据\n");
                scanf("%d",&e);
                push(&S, e);
                stackTraverse(S);
                break;
            case 4:
                value = pop(&S, &e);
                if(value == 0){
                    printf("没有可用的元素可以出栈\n");
                }else{
                    printf("出栈的元素是:%d\n",e);
                }
                break;
            case 0:
                return OK;
        }
    }
    return OK;
}
