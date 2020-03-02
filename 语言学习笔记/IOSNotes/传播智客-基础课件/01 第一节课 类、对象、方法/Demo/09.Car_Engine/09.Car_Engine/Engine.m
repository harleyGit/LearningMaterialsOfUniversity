//
//  Engine.m
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Engine.h"

@implementation Engine

//自定义初始化方法
- (id)initWithModel:(NSString *)model WithCapacity:(float)capacity {
    self = [super init];
    if (self != nil) {
        _model = model;
        _capacity = capacity;
    }
    return self;
}


//转动
- (void)turn {
    NSLog(@"型号为：%@,排量：%0.2f的引擎开始转动了",_model,_capacity);
}

//停止转动
- (void)stopTrun {
    NSLog(@"型号为：%@,排量：%0.2f的引擎停止转动了",_model,_capacity);
}


@end
