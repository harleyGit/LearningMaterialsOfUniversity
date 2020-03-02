//
//  两栈共享.c
//  LinkedList
//
//  Created by 黄刚 on 2017/6/4.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>

#define MAXSIZE 20
#define  OK     1
#define ERROR   0
#define TRUE    1
#define FALSE   0

typedef  int ElemType;
typedef int  Status;

typedef struct
{
    ElemType data[MAXSIZE];
    int top1;       //栈1的指针
    int top2;       //栈2的指针
    
}Stack, *pStack;


Status InitStack(pStack S)
{
    S -> top1 = -1;         //栈1为空
    S -> top2 = MAXSIZE;    //栈2为空
    
    return OK;

}


Status Push_Stack(pStack S, ElemType e, int stackNumber)
{
    if (S -> top1+1 == S -> top2)
    {
        return ERROR;
    }
    
    switch (stackNumber) {      //stackNumber判断是栈1还是栈2
        case 1:
            S -> data[++ S -> top1] = e;
            break;
            
        case 2:
            S -> data[--S -> top2] = e;
            break;
        default:
            break;
    }
    
    return  OK;

}

Status Pop_Stack(pStack S, ElemType *e, int stackNumber)
{
    if (1 == stackNumber)
    {
        if (-1 == S -> top1 )
        {
            return ERROR;
        }
        
        *e = S -> data[S -> top1--];
    }else if (2 == stackNumber)
    {
        if (MAXSIZE == S -> top2)
        {
            return  ERROR;
        }
        
        *e = S -> data[S -> top2 ++];
    }
    
    return  OK;
}


//输出栈中所有元素

Status DispStack(pStack S, int stackNumber)
{
    int i;
    if (1 == stackNumber )
    {
        if (-1 == S -> top1)
        {
            return ERROR;
        }
        
        printf("栈1中的元素为：");
        for (i = 0; i <= S ->top1; ++i)
        {
            printf("%d ",S -> data[i]);
        }
    }else if (2 == stackNumber)
    {
        if (MAXSIZE == S -> top2)
        {
            return  ERROR;
        }
        printf("栈2中的元素为：");
        
        for (i = MAXSIZE-1; i>= S->top2; --i)
        {
            printf("%d ", S -> data[i]);
        }
    }
    
    return OK;
}

int main(void)
{
    Stack S;
    ElemType e;
    InitStack(&S);
    Push_Stack(&S, 1, 1);
    Push_Stack(&S, 2, 1);
    Push_Stack(&S, 3, 1);
    Push_Stack(&S, 4, 1);
    Push_Stack(&S, 5, 1);
    Push_Stack(&S, 6, 1);
    Pop_Stack(&S, &e, 1);
    //------------------------------
    Push_Stack(&S, 10, 2);
    Push_Stack(&S, 9, 2);
    Push_Stack(&S, 8, 2);
    Push_Stack(&S, 7, 2);
    DispStack(&S, 1);
    return 0;
}

















