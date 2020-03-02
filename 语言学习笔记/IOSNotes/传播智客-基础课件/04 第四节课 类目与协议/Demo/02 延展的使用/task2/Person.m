//
//  Person.m
//  task2
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

//延展：用于声明私有的方法
@interface Person (private)
- (void)_showInfo;
@end

@implementation Person {
    NSString *_age;//私有属性
}

- (void)work {
    
    [self _showInfo];
    
    NSLog(@"开始工作了");
}

//私有的方法
- (void)_showInfo {
    NSLog(@"我的信息是：");
}


@end
