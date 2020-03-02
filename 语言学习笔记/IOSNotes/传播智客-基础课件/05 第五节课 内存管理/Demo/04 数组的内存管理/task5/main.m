//
//  main.m
//  task5
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[])
{
    
    Dog *dog1 = [[Dog alloc] init];
    Dog *dog2 = [[Dog alloc] init];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    //数组会对每一个元素retain
    [array addObject:dog1];  //dog1计数：2
    [array addObject:dog2];  //dog1计数：2
    
    NSLog(@"dog1 计数：%ld",dog1.retainCount);
    NSLog(@"dog2 计数：%ld",dog2.retainCount);
    
    [dog1 release];
    [dog2 release];
    
    //1.数组销毁的时候，会将数组中每一个元素release
    //[array release];
    
    //2.将所有元素移除时，会将数组中每一个元素release
    //[array removeAllObjects];
    
    //3.移除指定的对象，那么此对象会release
    [array removeObjectAtIndex:0];

    
    return 0;
}

