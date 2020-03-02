//
//  main.m
//  03.Car
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"

/*
 1.定义一个汽车类Car，它有两个属性，名称(name)和速度(speed)。还有一个启动的方法，
 该方法实现就打印“xx汽车启动了，时速为xxx”。
 */

int main(int argc, const char * argv[])
{

    Car *car = [[Car alloc] init];
    
    //调用设置车名的方法
    [car setName:@"保时捷"];
    
    //调用设置速度的方法
    [car setSpeed:120];
    
    [car setSpeed:220];
    
    //调用车的启动方法
    [car run];
    
    return 0;
}

