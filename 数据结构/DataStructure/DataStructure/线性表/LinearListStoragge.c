//
//  LinearListStoragge.c
//  DataStructure
//
//  Created by 黄刚 on 2019/3/17.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#include "LinearListStoragge.h"



int initList(SqList *list){
    list -> length = 0;
    
    return OK;
}


//线性表顺序插入
int listInsert(SqList *list, int i, int e){
    //顺序线性表已经满
    if (list->length == MAXSIZE ) {
        return ERROR;
    }
    
    //当i比第一位置小或者比最后一位置后一位置还要大时(如：数组长度为9，但是i为10)
    if (i < 1 || i > list->length +1) {
        return ERROR;
    }
    
    //若插入数据位置不在表尾
    if (i <= list->length) {
        for (int k = list->length-1; k >= i-1; k --) {
            list->data[k+1] = list->data[k];
        }
    }
    
    //将新元素插入
    list->data[i -1] = e;
    list->length++;
    
    return TRUE;
}

//初始条件：顺序线性表L已存在
//操作结果：依次对L的每个数据元素输出
int listTraverse(SqList list){
    int i;
    for (i = 0; i < list.length; i ++) {
        int k = visitElement(list.data[i]);
        printf("\n");
    }
    return OK;
}


//线性表顺序删除
int listDelete(SqList *list, int i, ElemType *e){
    
    //线性表为空
    if (list->length == 0) {
        return ERROR;
    }
    
    //删除位置不正确
    if (i < 1 || i > list->length) {
        return ERROR;
    }
    
    //取数组地址赋值给指针变量e
    *e = list->data[i-1];
    
    if (i < list->length) {
        for (int k = i-1; k < list->length; k ++) {
            list->data[k] = list->data[k +1];
        }
    }
    
    list->length -=1;
    
    return OK;
}

int visitElement(ElemType c){
    printf("%d", c);
    
    return OK;
}

void orderListMethodCalling(void){
    SqList  L;
    
    ElemType e = NULL;
    Status  i;
    int j;
    
    i = initList(&L);
    printf("初始化L后：L.length=%d\n",L.length);
    
    for (j = 1; j <= 5; j ++) {
        i = listInsert(&L, j, 1);
    }
    printf("在L的表头依次插入1～5后：L.data=\n");
    listTraverse(L);
    
    j = 5;
    listDelete(&L, j, &e);
    printf("删除第%d个的元素值为：%d\n",j,e);
    
    SqList list = {{1,1,1,1,1}, 5};
    
    int k = 5;
    listDelete(&list, k, &e);
    printf("删除第%d个的元素值为：%d\n",k,e);
    
}
