//
//  main.m
//  06 task6
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    //使用类方法创建的对象，都已经加入到自动释放池了
    @autoreleasepool {
//       Person *person = [Person personWithName:@"jack"];
        
        NSString *string1 = [NSString stringWithFormat:@"ss"];
//        [string1 release];  //错误， stirng1已经加入到自动释放池了
        
        //加入到自动释放池了
        NSArray *array = [NSArray array];
//        [array autorelease]; //错误，array已经加入自动释放池了
        
        
        //使用新语法创建的对象，已经加入到自动释放池了
        NSArray *arry2 = @[@"xx"];
        NSNumber *number  = @100;
        NSString *s = @"xxx";
    }

    return 0;
}

