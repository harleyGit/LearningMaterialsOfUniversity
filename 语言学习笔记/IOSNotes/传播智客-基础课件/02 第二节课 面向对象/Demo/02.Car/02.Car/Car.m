//
//  Car.m
//  02.Car
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)setBrand:(NSString *)brand {
    _brand = brand;
}
- (void)setColor:(NSString *)color {
    _color = color;
}


//刹车
- (void)brake {
    NSLog(@"汽车刹车了");
}

//加速
- (void)quicken {
    NSLog(@"汽车加速了");
}


@end
