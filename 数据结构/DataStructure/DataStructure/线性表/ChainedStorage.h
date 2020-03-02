//
//  ChainedStorage.h
//  DataStructure
//
//  Created by 黄刚 on 2019/3/22.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#ifndef ChainedStorage_h
#define ChainedStorage_h

#include <stdio.h>
#include <stdlib.h>
#include "LinearListStoragge.h"



typedef struct Node {
    int data;
    struct Node *next;
}Node;

void chainedListTest(void);


#endif /* ChainedStorage_h */


