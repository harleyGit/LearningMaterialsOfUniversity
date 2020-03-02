//
//  Person.m
//  01 task1
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

//对象销毁之前，调用的方法
- (void)dealloc {
    
    NSLog(@"Person销毁了");
    
    [super dealloc];
}

@end
