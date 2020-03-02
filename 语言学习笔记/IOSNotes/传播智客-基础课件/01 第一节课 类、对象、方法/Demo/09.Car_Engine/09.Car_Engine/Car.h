//
//  Car.h
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Engine.h"
#import "Lamp.h"


@interface Car : NSObject {
    NSString *_name;    //车名
    NSString *_licence; //车牌号
    
    Engine *_engine;    //引擎
    Lamp *_lamp;        //车灯
}

//自定义初始化方法
- (id)initWithEngine:(Engine *)engine
            WithLamp:(Lamp *)lamp;

//修改车名方法
- (void)setName:(NSString *)name;
//修改车牌号方法
- (void)setLicence:(NSString *)licence;

//启动汽车
- (void)run;
//停止汽车
- (void)stop;


@end
