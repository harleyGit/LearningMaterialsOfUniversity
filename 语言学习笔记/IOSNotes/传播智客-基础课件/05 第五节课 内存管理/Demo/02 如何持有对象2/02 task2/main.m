//
//  main.m
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    Dog *dog1 = [[Dog alloc] init]; //引用计数为1
    dog1.name = @"小黑";

/*
    Person *p = [[Person alloc] init];  //引用计数为1
    
    p.name = @"张三";
    [p setDog:dog1];  //dog计数：2
    
    [dog1 release];  //dog计数：1
    
    [p release];    //person：0    
*/

    
    Person *p = [[Person alloc] initWithDog:dog1]; //dog计数：1
    [p setName:@"lisi"];
    
    [p playDog];
    
    [dog1 release];  //dog计数：0 狗销毁了
    
    [p release];
    
    
    return 0;
}

