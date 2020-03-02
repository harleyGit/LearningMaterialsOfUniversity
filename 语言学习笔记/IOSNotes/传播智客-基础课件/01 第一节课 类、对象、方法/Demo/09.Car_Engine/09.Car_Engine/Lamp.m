//
//  Lamp.m
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Lamp.h"

@implementation Lamp

- (id)initWithWattage:(float)wattage {
    self = [super init];
    if (self != nil) {
        _wattage = wattage;
    }
    return self;
}


- (void)light  //亮灯
{
    NSLog(@"瓦数为%0.2f等亮了",_wattage);
}

- (void)dark   //熄灯
{
    NSLog(@"瓦数为%0.2f灯熄灭了",_wattage);
}


@end
