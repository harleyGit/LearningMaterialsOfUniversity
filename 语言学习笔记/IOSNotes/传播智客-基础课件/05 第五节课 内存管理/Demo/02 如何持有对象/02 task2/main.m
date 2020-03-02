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
    
    Person *p = [[Person alloc] init];
    p.name = @"张三";
    [p setDog:dog1];  //dog计数：2
    

    
    Dog *dog2 = [[Dog alloc] init]; //引用计数为1
    dog2.name = @"dahuang";
    
    [p setDog:dog2];

    
    
    
    return 0;
}

