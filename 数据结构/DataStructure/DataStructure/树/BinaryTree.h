//
//  BinaryTree.h
//  DataStructure
//
//  Created by 黄刚 on 2019/5/2.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#ifndef BinaryTree_h
#define BinaryTree_h

#include <stdio.h>
#include <stdlib.h>
#include "math.h"
#include "string.h"

#include "LinearListStoragge.h"

typedef struct BinaryTreeNode {
    char data;
    struct BinaryTreeNode *leftChild;
    struct BinaryTreeNode *rightChild;
} BinaryTreeNode, *BinaryTree;


void binaryTreeTest(void);


#endif /* BinaryTree_h */
