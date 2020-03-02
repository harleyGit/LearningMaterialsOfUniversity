//
//  Car.m
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Car.h"

@implementation Car

//自定义初始化方法
- (id)initWithEngine:(Engine *)engine
            WithLamp:(Lamp *)lamp {
    self = [super init];
    if (self != nil) {
        _engine = engine;
        _lamp = lamp;
    }
    return self;
}

//修改车名方法
- (void)setName:(NSString *)name {
    _name = name;
}

//修改车牌号方法
- (void)setLicence:(NSString *)licence {
    _licence = licence;
}

//启动汽车
- (void)run {
    
    NSLog(@"牌号为%@的%@汽车开始启动了",_licence,_name);
    
    //调用引擎转动
    [_engine turn];
    
    //调用车灯亮起
    [_lamp light];
    
}
//停止汽车
- (void)stop {
    NSLog(@"牌号为%@的%@汽车停止了",_licence,_name);
    
    //调用引擎转动
    [_engine stopTrun];
    
    //调用车灯亮起
    [_lamp dark];
}

@end
