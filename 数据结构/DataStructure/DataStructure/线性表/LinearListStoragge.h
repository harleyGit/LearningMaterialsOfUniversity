//
//  LinearListStoragge.h
//  DataStructure
//
//  Created by 黄刚 on 2019/3/17.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//  C 语言文件导入 https://www.cnblogs.com/Bonker/p/3548276.html

#ifndef LinearListStoragge_h
#define LinearListStoragge_h

#include <stdio.h>



#define     OK          1
#define     ERROR       0
#define     TRUE        1
#define     FALSE       0

//存储空间初始分配量
#define     MAXSIZE     20

//Status是函数的类型,其值是函数结果状态代码，如OK等
typedef int Status;
//ElemType类型根据实际情况而定，这里假设为int
typedef int ElemType;

typedef struct
{
    //数组，存储数据元素
    ElemType data[MAXSIZE];
    //线性表当前长度
    int length;
}SqList;


//初始化顺序线性表
int initList(SqList *list);


//初始条件：顺序线性表L已存在,1≤i≤ListLength(L)
//操作结果：在L中第i个位置之前插入新的数据元素e，L的长度加1
int listInsert(SqList *list, int i, int e);

//先行顺序列表方法调用
void orderListMethodCalling(void);

#endif /* LinearListStoragge_h */


