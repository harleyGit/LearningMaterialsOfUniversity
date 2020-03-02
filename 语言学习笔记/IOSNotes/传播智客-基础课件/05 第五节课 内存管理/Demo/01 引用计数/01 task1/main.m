//
//  main.m
//  01 task1
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p = [[Person alloc] init];  //引用计数为1
    
    NSLog(@"1.引用计数：%ld",[p retainCount]); //p.retainCount
    
    [p retain];  //使引用计数+1
    NSLog(@"2.引用计数：%ld",[p retainCount]);
    
    [p retain];  //使引用计数+1
    NSLog(@"3.引用计数：%ld",[p retainCount]);
    
    [p release]; //使引用计数-1
    NSLog(@"4.引用计数：%ld",[p retainCount]);
   
    [p release];
    [p release];  //引用计数为0,对象会自动销毁掉，销毁之前会调用dealloc方法
    
    
    return 0;
}

