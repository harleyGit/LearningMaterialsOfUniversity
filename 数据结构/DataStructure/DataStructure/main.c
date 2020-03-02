//
//  main.c
//  DataStructure
//
//  Created by 黄刚 on 2019/3/17.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
//线性表顺序存储
#include "LinearListStoragge.h"
//线性表链式存储
#include "ChainedStorage.h"
//链栈操作
#include "ChainStack.h"
//队列操作
#include "ChainQueue.h"
//四则运算表达式
#include "Arithmetic.h"
//二叉树
#include "BinaryTree.h"

#pragma mark -- CustomClass

int main(int argc, const char * argv[]) {
    //线性表顺序存储 方法
    //orderListMethodCalling();
    
    
    //单链表测试
    chainedListTest();
    
    
    //链栈测试
    //linkStackTestMethod();
    
    
    //队列测试
    //linkQueueTest();
    
    
    //栈的四则运算表达式
    //arithmeticCalculateTest();
    
    
    //二叉树遍历
//    binaryTreeTest();
    
    
    
    printf("\n\n");
    
    return 0;
}

