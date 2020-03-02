//
//  ChainQueue.c
//  DataStructure
//
//  Created by 黄刚 on 2019/4/14.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#include "ChainQueue.h"

//遍历队列元素
int printQueueElement(LinkQueue linkQueue){
    if (linkQueue.front == NULL) {
        return FALSE;
    }
    
    QueueNode *node = linkQueue.front->next;
    while (node) {
        printf("    %d", node->data);
        node = node->next;
    }
    printf("\n\n");
    
    return TRUE;
}

//队列是否为空
int isQueueEmpty(LinkQueue linkQueue){
    if (linkQueue.front == linkQueue.rear) {
        return TRUE;
    }
    
    return FALSE;
}

//队列的长度
int queueLength(LinkQueue linkQueue){
    int length = 0;
    QueueNode *node = linkQueue.front;
    while (linkQueue.rear != node) {
        length ++;
        node = node->next;
    }
    return length;
}


//销毁队列
int destoryQueue(LinkQueue *linkQueue){
/*
    //错误代码
    QueueNode *deleteNode = linkQueue->front->next;
    while (deleteNode) {
        linkQueue->front = deleteNode->next;
        free(deleteNode);
        deleteNode = linkQueue->front;
    }
    linkQueue->rear = linkQueue->front;
 */
    
    //销毁，连着队列的头结点和队列的节点一块销毁掉了
    while (linkQueue->front) {
        linkQueue->rear = linkQueue->front->next;
        free(linkQueue->front);
        linkQueue->front = linkQueue->rear;
    }
    
    return TRUE;
}


//初始化队列
int initWithQueue(LinkQueue *linkQueue){
    //申请一个头结点的空间，使front和rear都指向它
    linkQueue->front = linkQueue->rear = (QueueNode *)malloc(sizeof(QueueNode));

    if (!linkQueue->front) {
        exit(OVERFLOW);
        return FALSE;
    }
    linkQueue->front->next = NULL;
    
    return TRUE;
    
}


//队列进入
int enterQueue(LinkQueue *linkQueue, int data){
    QueueNode *insertNode = (QueuePtr)malloc(sizeof(QueueNode));
    if (!insertNode) {  //存储空间分配失败
        exit(OVERFLOW);
        return FALSE;
    }
    
    insertNode->data = data;
    insertNode->next = NULL;
    //把拥有元素e的新结点s赋值给原队尾结点的后继，见图中①
    linkQueue->rear->next = insertNode;
    //把当前的s设置为队尾结点，rear指向s，见图中②
    linkQueue->rear = insertNode;
    
    return TRUE;
};


//出队列
int outQueue(LinkQueue *queue, int *data){
    if (queue->front == queue->rear) {
        return FALSE;
    }
    
    //将欲删除的队头结点暂存给deleteNode，见图中①
    QueueNode *deleteNode = queue->front->next;
    //将欲删除的队头结点的值赋值给data
    *data = deleteNode->data;
    //将原队头结点的后继deleteNode->next赋值给头结点后继，见图中②
    queue->front->next = deleteNode->next;
    
    if (queue->rear == deleteNode) {
        queue->rear = queue->front;
    }
    free(deleteNode);
    
    return TRUE;
};


void linkQueueTest(void){
    LinkQueue linkQueue;
    int statusCode;
    int element;
    
    statusCode = initWithQueue(&linkQueue);
    printf("初始化成功%d(1是 0否)\n\n", statusCode);
    
    for (int i = 0; i <= 10; i ++) {
        enterQueue(&linkQueue, i);
    }
    printQueueElement(linkQueue);
    
    statusCode = outQueue(&linkQueue, &element);
    printf("出队列成功%d(1是 0否),元素是：%d\n\n", statusCode, element);
    printQueueElement(linkQueue);
    
}
