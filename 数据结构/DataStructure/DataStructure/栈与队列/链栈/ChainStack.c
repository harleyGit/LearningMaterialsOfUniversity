//
//  ChainStack.c
//  DataStructure
//
//  Created by 黄刚 on 2019/4/7.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#include "ChainStack.h"

#pragma mark -- 递归
int Fbi(int data){
    if (data < 2) {
        return data == 0 ? 0 : 1;
    }
    
    return Fbi(data -1) + Fbi(data -2);
}

#pragma mark -- 链栈
//链栈的初始化
int initWithStack(LinkStack *linkStack){
    linkStack->top = (LinkStackPtr)malloc(sizeof(StackNode));
    if (!linkStack->top) {
        return FALSE;
    }
    
    linkStack->top = NULL;
    linkStack->count = 0;
    return TRUE;
}

//判断栈是否为空
int isLinkStackEmpty(LinkStack *linkStack){
    if (linkStack->count > 0) {
        return TRUE;
    }else {
        return FALSE;
    }
}


//栈的push
int pushInStack(LinkStack *linkStack, int data){
    
    StackNode *insertNode = (StackNode *)malloc(sizeof(StackNode));
    insertNode->data = data;
    //把当前的栈顶元素赋值给新结点的直接后继，见图中①
    insertNode->next = linkStack->top;
    
    //将新的结点s赋值给栈顶指针，见图中②
    linkStack->top = insertNode;
    linkStack->count ++;
    
    return TRUE;
}


//栈的pop
int pushOutStack(LinkStack *linkStack,int *data){
    //将栈顶结点赋值给p，见图中③
    StackNode *outNode = linkStack->top;
    *data = outNode->data;  //不能是data = &(outNode->data),这是把它的地址值赋给data

    //使得栈顶指针下移一位，指向后一结点，见图中④
    linkStack->top = outNode->next;
    //释放结点p
    free(outNode);
    linkStack->count--;
    
    return TRUE;
}

//清空栈
int clearLinkStack(LinkStack *linkStack){
    if (linkStack->count == 0) {
        return FALSE;
    }
    
    StackNode *deleteNode = linkStack->top;
    while (deleteNode) {
        linkStack->top = deleteNode->next;
        free(deleteNode);
        deleteNode = linkStack->top;
    }
    linkStack->count = 0;
    return TRUE;
}

//栈元素遍历
int linkStackTraverse(LinkStack linkStack){
    if (linkStack.count > 0) {
        StackNode *node = linkStack.top;
        while (node) {
            printf(" %d,", node->data);
            node = node->next;
        }
    }else {
        return FALSE;
    }
    
    printf("\n\n");

    return TRUE;
}






void linkStackTestMethod(void){
    
    for (int i = 0; i < 17 ; i ++) {
        printf(" %d,",Fbi(i));
    }
    printf("\n\n");
    
    
    LinkStack linkStack;
    
    int statusCode = initWithStack(&linkStack);
    if (statusCode) {
        for (int i = 0; i <11; i ++) {
            pushInStack(&linkStack, i);
        }
    }
    linkStackTraverse(linkStack);
    
    int popE;
    pushOutStack(&linkStack, &popE);
    printf("出栈的元素popE是：%d\n\n",popE);
    linkStackTraverse(linkStack);
    
    
    statusCode = clearLinkStack(&linkStack);
    linkStackTraverse(linkStack);
    printf("清空栈后，栈空否：%d(1:空 0:否)", statusCode);
    
    printf("\n\n");
}


