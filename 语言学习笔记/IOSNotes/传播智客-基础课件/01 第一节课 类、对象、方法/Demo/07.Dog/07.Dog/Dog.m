//
//  Dog.m
//  07.Dog
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Dog.h"

@implementation Dog

//自定义初始化方法
- (id)initWithName:(NSString *)name withColor:(NSString *)color {
    self = [super init];
    if (self != nil) {
        _name = name;
        _color = color;
    }
    return self;
}

//跑
- (void)run {
    NSLog(@"颜色为%@的%@在跑",_color,_name);
}

//捡球
- (void)playBall {
    NSLog(@"颜色为%@的%@在捡球",_color,_name);
}

//叫
- (void)call {
    NSLog(@"颜色为%@的%@在汪汪叫",_color,_name);
}

@end
