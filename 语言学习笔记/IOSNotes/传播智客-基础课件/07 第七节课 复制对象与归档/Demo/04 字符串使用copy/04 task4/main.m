//
//  main.m
//  04 task4
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*
 字符串为什么使用copy
 */

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        NSMutableString *name = [NSMutableString stringWithString:@"jack"];
        p.name = name;
        
        //如果Person的name是retain,则此处的name与person对象的name指向的是同一个字符串对象
        //此处的name修改之后，会导致person的name也被修改，破外了person对象的封装性
        [name setString:@"tom"];
        
        //面向对象的封装性，只能通过set方法去修改属性
        //[p setName:@""];
        
        NSLog(@"p.name=%@",p.name);
        
        
        /*
         Foundation框架中可复制的对象，当我们copy的是一个不可变对象时，
         它的作用相当于retain(系统做的内存优化)
         */
        
        //[不可变对象 copy];  等价于 [不可变对象 retain]
        //不可变对象的copy相当于retain，不是真正的拷贝
        NSArray *array1 = [NSArray array];
        NSLog(@"array2的计数：%ld",[array1 retainCount]);
        NSArray *array2 = [array1 copy];
        if (array1 == array2) {
            NSLog(@"array1 == array2");
            NSLog(@"array2的计数：%ld",[array2 retainCount]);
        }
        
        
        //mutableCopy拷贝方法，不管什么对象都是真实拷贝
        
    }
    return 0;
}

