//
//  Person.m
//  task8
//
//  Created by wei.chen on 12-12-13.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"
#import "Shape.h"

@implementation Person

- (void)paint:(Shape *)shape {
    [shape draw];
}


+ (void)test {
    NSLog(@"类方法测试");
}

@end
