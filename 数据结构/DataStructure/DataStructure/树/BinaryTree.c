//
//  BinaryTree.c
//  DataStructure
//
//  Created by 黄刚 on 2019/5/2.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#include "BinaryTree.h"
char characters[24] = "ABDH#K###E##CFI###G#J##";//BDH#K###E##CFI###G#J##
int number = 0;

void createBinaryTree(BinaryTree *binaryTree){
    char data = characters[number++];
    
    if (data == '#' || data == '\0') {
        *binaryTree = NULL;
    }else {
        *binaryTree = (BinaryTree)malloc(sizeof(BinaryTreeNode));
        if (!*binaryTree) {
            exit(OVERFLOW);
        }
        
        (*binaryTree)->data = data;
        createBinaryTree(&(*binaryTree)->leftChild);
        createBinaryTree(&(*binaryTree)->rightChild);
    }
    
}

//判断二叉树是否为空
int isEmptyBinaryTree(BinaryTree *binaryTree){
    if (binaryTree != NULL) {
        return TRUE;
    }
    return FALSE;
}

//计算二叉树的深度
int caculateBinaryTreeDepth(BinaryTree *binaryTree){
    int i, j;
    if (*binaryTree == NULL) {
        return 0;
    }
    
    if ((*binaryTree)->leftChild) {
        i = caculateBinaryTreeDepth(&(*binaryTree)->leftChild);
    }else {
        i = 0;
    }
    
    if ((*binaryTree)->rightChild) {
        j = caculateBinaryTreeDepth(&(*binaryTree)->rightChild);
    }else {
        j = 0;
    }
    
    
    return i>j ? i+1 : j+1;
}


//中序遍历
void infixOrderTraverse(BinaryTree *binaryTree){
    if (*binaryTree == NULL) {
        return;
    }
    
    infixOrderTraverse(&(*binaryTree)->leftChild);
    printf("%c",(*binaryTree)->data);
    infixOrderTraverse(&(*binaryTree)->rightChild);
    
    return;
}


//后序遍历
void epilogueOrderTraverse(BinaryTree *binaryTree){
    if (*binaryTree == NULL) {
        return;
    }
    
    epilogueOrderTraverse(&(*binaryTree)->leftChild);
    epilogueOrderTraverse(&(*binaryTree)->rightChild);
    printf("%c",(*binaryTree)->data);
    
    return;
}

//前序遍历
void preorderTraverse(BinaryTree *binaryTree){
    if (*binaryTree == NULL) {
        return;
    }
    
    printf("%c",(*binaryTree)->data);
    preorderTraverse(&(*binaryTree)->leftChild);
    preorderTraverse(&(*binaryTree)->rightChild);
}

int initBinaryTree(BinaryTree *binaryTree){
    *binaryTree = NULL;
    
    return TRUE;
}


//方法调用
void binaryTreeTest(void){
    BinaryTree binaryTree; //等价于：BinaryTreeNode* binaryTree;
    
    int statusCode = 0;
    
    statusCode = initBinaryTree(&binaryTree);
    
    //创建二叉树
    createBinaryTree(&binaryTree);
    
    statusCode = isEmptyBinaryTree(&binaryTree);
    printf("\n\n空树：%d(1否 0是)", statusCode);
    
    statusCode = caculateBinaryTreeDepth(&binaryTree);
    printf("\n\n二叉树的深度为：%d", statusCode);
    
    printf("\n\n前序遍历：");
    preorderTraverse(&binaryTree);
    
    printf("\n\n中序遍历：");
    infixOrderTraverse(&binaryTree);
    
    
    printf("\n\n后序遍历：");
    epilogueOrderTraverse(&binaryTree);
    
    
    
}
