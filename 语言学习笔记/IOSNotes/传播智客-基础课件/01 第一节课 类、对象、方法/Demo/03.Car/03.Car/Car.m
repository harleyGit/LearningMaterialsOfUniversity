//
//  Car.m
//  03.Car
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)run {
    
    NSLog(@"%@汽车启动了，时速为%0.2f",_name,_speed);
}

- (void)setName:(NSString *)name  //等价于C语言的函数 void setName(NSString *name);
{
    _name = name;
}

- (void)setSpeed:(float)speed {
    _speed = speed;
}


@end
