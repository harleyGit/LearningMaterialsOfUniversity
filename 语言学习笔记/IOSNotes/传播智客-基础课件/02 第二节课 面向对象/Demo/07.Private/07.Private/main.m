//
//  main.m
//  07.Private
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[])
{
    Car *car = [[Car alloc] init];
    car->_color = @"红色";
    
    [car run];
    
    //_color 是public公开的属性，类的外部也可以直接访问
 // 
//    [car demo1];

    return 0;
}

