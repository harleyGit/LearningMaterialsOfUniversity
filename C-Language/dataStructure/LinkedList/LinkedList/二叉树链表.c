//
//  二叉树链表.c
//  LinkedList
//
//  Created by 黄刚 on 2017/6/8.
//  Copyright © 2017年 HuangGang'sMac. All rights reserved.
//

#include <stdio.h>
#include <mm_malloc.h>

typedef char TELemType;

//定义结二叉树的构体
typedef struct BTree
{
    TELemType data;
    struct BTree *lChild;
    struct  BTree *rChild;

}BinTree;


//二叉树的创建
BinTree* CreateTree(BinTree *T)
{
    char temp;
    scanf("%c", &temp);
    
    if (temp =="0")
    {
        return  0;
    }
    
    T = (BinTree *)malloc(sizeof(BinTree));
    T -> data = temp;
    T -> lChild = CreateTree(T -> lChild);       //递归创建左子树
    T -> rChild = CreateTree(T -> rChild);       //递归创建右子树
    
    return  T;
}

//计算叶子结点的数量
int sumLeft(BinTree *T)
{
    int sum = 0, leftNum, rightNum;
    
    if (T)
    {
        if ((!T -> lChild) && (!T -> rChild))
        {
            sum ++;
        }
        
        leftNum = sumLeft(T -> lChild);
        sum += leftNum;
        rightNum = sumLeft(T -> lChild);
        sum += rightNum;
    }
    
    return sum;
}

//先序遍历二叉树
void PreOrderTraver(BinTree *T)
{
    if (T)
    {
        printf("%c", T -> data);
    }
    
    PreOrderTraver(T -> lChild);
    
    PreOrderTraver(T -> rChild);
}

//中序遍历二叉树
void InOrderTraverse(BinTree *T)
{
    if (T)
    {
        InOrderTraverse(T -> lChild);
        printf("%c", T -> data);
        InOrderTraverse(T -> rChild);
    }
}

//后序遍历二叉树
void PostOrderTraverse(BinTree *T)
{
    if (T)
    {
        PostOrderTraverse(T -> lChild);
        PostOrderTraverse(T -> rChild);
        printf("%c", T -> data);
    }

}

//统计树的深度
int getDepth(BinTree *T)
{
    int dep = 0, depleft , depright;
    
    if (!T)
    {
        dep = 0;
    }else
    {
        depleft = getDepth(T -> lChild);
        depright = getDepth(T -> rChild);
        dep = 1 + max(depleft, depright);
    }
    
    return  dep;
}

int main()
{
    BinTree *Tree;
    Tree = CreateTree(Tree);
    printf("=========分隔符============\n\n");
    printf("二叉树的先序遍历：\n");
    PreOrderTraverse(Tree);
    printf("\n");
    printf("二叉树的中序遍历：\n");
    InOrderTraverse(Tree);
    printf("\n");
    printf("二叉树的后序遍历：\n");
    PostOrderTraverse(Tree);
    printf("\n");
    printf("\n=========================\n");
    printf("叶子结点数为: %d\n", sumleft(Tree));
    printf("二叉树的深度为:%d\n", getDepth(Tree));
    return 0;
}










