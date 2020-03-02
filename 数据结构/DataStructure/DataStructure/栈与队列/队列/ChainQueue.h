//
//  ChainQueue.h
//  DataStructure
//
//  Created by 黄刚 on 2019/4/14.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#ifndef ChainQueue_h
#define ChainQueue_h

#include <stdio.h>
#include <stdlib.h>
#include "math.h"

#include "LinearListStoragge.h"

typedef struct QueueNode{
    int data;
    struct QueueNode *next;
}QueueNode, *QueuePtr;

typedef struct {
    QueueNode *front, *rear;
} LinkQueue;

void linkQueueTest(void);


#endif /* ChainQueue_h */
