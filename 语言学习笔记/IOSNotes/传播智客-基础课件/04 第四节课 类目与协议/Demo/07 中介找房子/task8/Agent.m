//
//  Agent.m
//  task8
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Agent.h"
#include <stdlib.h>

@implementation Agent

//找房子的协议方法
- (long)lookforApartme:(Person *)person {
    
    long price = random()%10 * 1000;
    
    NSLog(@"正在努力的找房子，找到一个价格为%ld的房子",price);
    
    return price;
    
}

- (NSString *)name {
    return _name;
}


@end
