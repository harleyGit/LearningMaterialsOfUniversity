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
}OperationNode;

typedef struct NumberNode{
    int number;
    struct NumberNode *next;
}NumberNode;

typedef struct {
    struct OperationNode *front, *rear;
}OperationHeadNode;

typedef struct {
    struct NumberNode *front, *rear;
}NumberHeadNode;

#endif /* Arithmetic_h */
