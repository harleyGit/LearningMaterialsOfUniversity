//
//  Arithmetic.h
//  DataStructure
//
//  Created by 黄刚 on 2019/4/17.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#ifndef Arithmetic_h
#define Arithmetic_h

#include <stdio.h>
#include <stdlib.h>

#include "LinearListStoragge.h"

typedef struct OperationNode{
    char operation;
    struct OperationNode *next;
} OperationNode;


typedef struct {
    struct OperationNode *top;
    int count;
} OperationStack;



typedef struct CharacterNode{
    char number;
    struct CharacterNode *next;
} CharacterNode;

//后缀表达式栈
typedef struct {
    struct CharacterNode *top;
    int count;
} PostfixStack;

void arithmeticCalculateTest(void);

#endif /* Arithmetic_h */
