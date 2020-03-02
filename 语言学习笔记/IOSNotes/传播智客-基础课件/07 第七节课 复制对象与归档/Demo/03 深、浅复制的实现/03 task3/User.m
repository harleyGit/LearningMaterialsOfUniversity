//
//  User.m
//  03 task3
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "User.h"

@implementation User

- (id)copyWithZone:(NSZone *)zone {
    
/*____________________________浅复制的实现____________________________________*/
    
    
    //创建副本对象
    User *copyUser = [[self class] allocWithZone:zone];
    copyUser.age = _age;
    //将源对象持有的对象retain之后给副本对象
    copyUser.apples = _apples;
    
    
/*____________________________深复制的实现____________________________________*/
   
    
    //创建副本对象
//    User *copyUser = [[self class] allocWithZone:zone];
//    copyUser.age = _age;
//
//    NSMutableArray *copyApples = [_apples mutableCopy];  //1
//    copyUser.apples = copyApples; 
//    [copyApples release];
    
    return copyUser;
}

- (void)dealloc {
    [_apples release];
    [super dealloc];
}

@end
