//
//  ChainStack.h
//  DataStructure
//
//  Created by 黄刚 on 2019/4/7.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#ifndef ChainStack_h
#define ChainStack_h

#include <stdio.h>
#include <stdlib.h>

#include "LinearListStoragge.h"

typedef struct StackNode{
    int data;
    struct StackNode *next;
}StackNode, *LinkStackPtr;

typedef struct{
    LinkStackPtr top;
    int count;
} LinkStack;


void linkStackTestMethod(void);

#endif /* ChainStack_h */
