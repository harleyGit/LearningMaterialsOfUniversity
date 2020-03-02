//
//  main.m
//  05.InitMethod
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Person *p1 = [[Person alloc] initWithName:@"张三"];
    
    //[p initWithName:@"xx"];  //错误，初始化方法不能多次调用
    
    //setName方法是可以多次调用的
    [p1 setName:@"张飞"];
    [p1 setName:@"张四"];
    
    Person *p2 = [[Person alloc] initWithName:@"王五" withAge:22];
    [p2 showInfo];
    
    return 0;
}

