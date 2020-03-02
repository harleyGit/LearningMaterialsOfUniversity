//
//  Arithmetic.c
//  DataStructure
//
//  Created by 黄刚 on 2019/4/17.
//  Copyright © 2019 HuangGang'sMac. All rights reserved.
//

#include "Arithmetic.h"
#include <string.h>

//前缀表达式字符数组
char PrefixCharacter[100];

//操作符栈初始化
int initWithOperationStack(OperationStack *operataionStack){
    operataionStack->top = (OperationNode *)malloc(sizeof(OperationNode));
    if (!operataionStack->top) {
        return FALSE;
    }
    operataionStack->top = NULL;
    operataionStack->count = 0;
    
    return TRUE;
}

//后缀表达式栈初始化
int initWithPostfixStack(PostfixStack *postfixStack){
    postfixStack->top = (CharacterNode *)malloc(sizeof(CharacterNode));
    if (!postfixStack->top) {
        return FALSE;
    }
    
    postfixStack->top = NULL;
    postfixStack->count = 0;
    
    return TRUE;
}

//操作数进栈
int pushOperand(PostfixStack *postfixStack, char character){
    CharacterNode *insertNode = (CharacterNode *)malloc(sizeof(CharacterNode));
    if (!insertNode) {
        return FALSE;
    }
    insertNode->number = character;
    insertNode->next = postfixStack->top;
    
    postfixStack->top = insertNode;
    postfixStack->count ++;
    
    
    return TRUE;
}

//操作数出栈
int popOperand(PostfixStack *postfixStack, char *character){

    CharacterNode *deleteNode = postfixStack->top;
    *character = deleteNode->number;
    postfixStack->top = deleteNode->next;
    postfixStack->count--;
    
    free(deleteNode);
    
    return TRUE;
}

//操作符进栈
int pushOperator(OperationStack *operationStack, char character){
    if (!character) {
        return FALSE;
    }
    
    OperationNode *insertNode = (OperationNode *)malloc(sizeof(OperationNode));
    insertNode->next = operationStack->top;
    insertNode->operation = character;
    
    operationStack->top = insertNode;
    operationStack->count ++;
    
    return TRUE;
}


//操作符出栈
int popOperator(OperationStack *operationStack, char *character){
    OperationNode *deleteNode = operationStack->top;
    if (deleteNode == NULL) {
        return FALSE;
    }
    *character = deleteNode->operation;
    operationStack->top = deleteNode->next;
    operationStack->count --;

    free(deleteNode);
    
    return TRUE;
}

//对字符和数字进行存储
void judgeNumberOrCharacter(char character){
    
    //判断为数字
//    if (character >= '0' && character <= '9') {
//        pushOperand(<#PostfixStack *postfixStack#>, <#char character#>)
//    }
}

void traversePostfixStack(PostfixStack postfixStack){
    printf("后缀表达式是：");
    while (postfixStack.top != NULL) {
        CharacterNode *node = postfixStack.top;
        printf("%c  ", node->number);
        postfixStack.top = node->next;
    }
    printf("\n\n");
}

void traverseOperationStack(OperationStack operationStack){
    printf("符号栈是：");
    while (operationStack.top != NULL) {
        OperationNode *node = operationStack.top;
        printf("%c  ", node->operation);
        operationStack.top = node->next;
    }
    printf("\n\n");
}

//后缀表达式计算
int postfixExpressionCalculate(PostfixStack postfixStack){
    CharacterNode *node = postfixStack.top;
    if (node == NULL) {
        return FALSE;
    }
    
    PostfixStack inverseOrder;
    PostfixStack resultStack;
    
    int statusDatus = initWithPostfixStack(&resultStack);
    int statusCode = initWithPostfixStack(&inverseOrder);
    printf("后缀表达式逆序%d(1 成功  0 失败)\n\n", statusCode);
    
    while (postfixStack.top != NULL) {
        char character = '\0';
        popOperand(&postfixStack, &character);
        pushOperand(&inverseOrder, character);
    }
    
    traversePostfixStack(inverseOrder);
    
    //计算后缀表达式
    while (inverseOrder.top != NULL) {
        char character = '\0';
        char leftNumber = '\0';
        char rightNumber = '\0';
        int result = 0;
        
        popOperand(&inverseOrder, &character);
        
        if (character >= '0' && character <= '9') {
            pushOperand(&resultStack, character);
        }else {
            switch (character) {
                case '+':{
                    popOperand(&resultStack, &rightNumber);
                    popOperand(&resultStack, &leftNumber);
                    
                    leftNumber -= 48;
                    rightNumber -= 48;
                    result = rightNumber + leftNumber;
                }
                    break;
                    
                case '-':{
                    popOperand(&resultStack, &rightNumber);
                    popOperand(&resultStack, &leftNumber);
                    
                    leftNumber -= 48;
                    rightNumber -= 48;
                    result = leftNumber - rightNumber;
                }
                    break;
                    
                case '*':{
                    popOperand(&resultStack, &rightNumber);
                    popOperand(&resultStack, &leftNumber);
                    
                    leftNumber -= 48;
                    rightNumber -= 48;
                    result = leftNumber * rightNumber;
                }
                    break;
                    
                case '/':{
                    popOperand(&resultStack, &rightNumber);
                    popOperand(&resultStack, &leftNumber);
                    
                    leftNumber -= 48;
                    rightNumber -= 48;
                    result = leftNumber / rightNumber;
                }
                    break;
                    
                default:
                    break;
            }
            //将计算的结果进行入栈,字符与数值相差48
            pushOperand(&resultStack, (result +48));
            printf("%d %c %d = %d \n", leftNumber, character, rightNumber, result);

        }
    }
    
    char result = '\0';
    popOperand(&resultStack, &result);
    printf("结果值是：%d", (result -48));

    return TRUE;
    
}


void arithmeticCalculateTest(void){
    
    //状态码
    int statusCode = 0;
    //字符栈
    OperationStack operationStack;
    PostfixStack postfixStack;
    
    statusCode = initWithOperationStack(&operationStack);
    printf("操作符栈初始化成功%d(1是 0否)\n\n", statusCode);
    
    statusCode = initWithPostfixStack(&postfixStack);
    printf("后缀表达式栈初始化成功%d(1是 0否)\n\n", statusCode);
    
    //字符串数组，C语言没有字符串，字符串使用字符组成的数组
    char prefixCharacter[] = "9+(3-1)*3+8/2=";
    printf("中缀表达式是：%s\n\n", prefixCharacter);

    for (int i = 0; i< strlen(prefixCharacter); i++) {
        
        traversePostfixStack(postfixStack);
        traverseOperationStack(operationStack);
        
        //判断为数字
        if (prefixCharacter[i] >= '0' && prefixCharacter[i] <= '9') {
            pushOperand(&postfixStack, prefixCharacter[i]);
        }else {
            printf("-->> %c\n", prefixCharacter[i]);

            switch (prefixCharacter[i]) {            //如果当前中缀元素为'+'或'-'，则依次pop出栈顶操作符、“输出”到后缀表达式尾端，直至栈底（栈空）或pop得到了一个'('，若pop得到一个'('，将'('重新push入栈。达到这两个条件之一后，将此操作符（'+'或'-'）入栈；
                case '+':{
                    char character = '\0';
                    while (character != '(') {
                        popOperator(&operationStack, &character);
                        if (character != '(' && character != '\0') {
                            pushOperand(&postfixStack, character);
                            if (operationStack.top == NULL) {//出栈到栈顶，跳出循环将现在的'+'入栈
                                pushOperator(&operationStack, '+');
                                break;
                            }
                        }else {
                            pushOperator(&operationStack, character);
                            pushOperator(&operationStack, '+');
                            break;
                        }
                    }
                }
                    break;
                    
                case '-':{
                    char character = '\0';
                    while (character != '(') {
                        popOperator(&operationStack, &character);
                        if (character != '('  && character != '\0') {
                            pushOperand(&postfixStack, character);
                            if (operationStack.top == NULL) {//出栈到栈顶，跳出循环将现在的'+'入栈
                                pushOperator(&operationStack, '-');
                                break;
                            }
                        }else {//遇到'('跳出循环
                            pushOperator(&operationStack, character);
                            pushOperator(&operationStack, '-');
                            break;
                        }
                    }
                }
                    break;
                    
                case '*':{
                    pushOperator(&operationStack, '*');
                }
                    break;
                    
                case '/':{
                    pushOperator(&operationStack, '/');
                }
                    break;
                    
                case '(':{
                    pushOperator(&operationStack, '(');
                }
                    break;
                    
                case ')':{  //如果当前中缀元素为')'，则依次pop出栈顶操作符，“输出”到后缀表达式尾端，直至pop得到的是一个'('才停止，并丢弃该'('
                    char character = '\0';
                    while (character != '(') {
                        popOperator(&operationStack, &character);
                        if (character != '(') {
                            pushOperand(&postfixStack, character);
                        }else{
                            break;
                        }
                    }
                }
                    break;
                    
                case '=':{
                    char character = '\0';
                    while (operationStack.top != NULL) {
                        popOperator(&operationStack, &character);
                        pushOperand(&postfixStack, character);
                    }
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
    }
    
    traversePostfixStack(postfixStack);
    
    postfixExpressionCalculate(postfixStack);
    
}

