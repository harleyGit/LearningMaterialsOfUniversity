//
//  main.m
//  09.Car_Engine
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Engine.h"
#import "Lamp.h"

int main(int argc, const char * argv[])
{

    Engine *engine = [[Engine alloc] initWithModel:@"VS1001" WithCapacity:2.0];
    Lamp *lamp = [[Lamp alloc] initWithWattage:60];
    
    Car *car = [[Car alloc] initWithEngine:engine WithLamp:lamp];
    car.name = @"大奔";  //给车设置名字
    [car setLicence:@"P10001"]; //给车上牌号
    
    int cmd;
    NSLog(@"请输入指令:");
    scanf("%d",&cmd);
    if (cmd == 1) {
        [car run];
    }
    if (cmd == 2) {
        [car stop];
    }
    
    
    return 0;
}

