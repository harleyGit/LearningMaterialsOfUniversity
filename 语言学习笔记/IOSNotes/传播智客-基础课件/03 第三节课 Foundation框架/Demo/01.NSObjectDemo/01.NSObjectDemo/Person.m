//
//  Person.m
//  01.NSObjectDemo
//
//  Created by wei.chen on 13-7-27.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)invoke {
    //[self demo1];
    
//    SEL sele = @selector(demo1);
//    [self performSelector:sele];
    
    //等价于
    //调用不带参数的方法demo1
    [self performSelector:@selector(demo1)];
    
    //调用带参数的方法demo2:, 将@“zhangsan”传给demo2的参数str
    [self performSelector:@selector(demo2:) withObject:@"zhangsan"];
    
    //调用带2个参数的方法demo3
    [self performSelector:@selector(demo3:withName:)
               withObject:@"zhangsan"
               withObject:@"lisi"];
    
    //延迟调用某一个方法
    //[self performSelector:<#(SEL)#> withObject:<#(id)#> afterDelay:<#(NSTimeInterval)#>];
    
}

- (void)demo1 {
    NSLog(@"demo1");
}

- (void)demo2:(NSString *)str {
    NSLog(@"%@",str);
}

- (void)demo3:(NSString *)str withName:(NSString *)name {
    NSLog(@"str=%@,name=%@",str,name);
}

@end
