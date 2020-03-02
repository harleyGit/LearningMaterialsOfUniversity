//
//  Car.h
//  03.Car
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    NSString *_name;  //车名
    float _speed;       //速度
}

- (void)run;

- (void)setName:(NSString *)name;  //等价于C语言的函数 void setName(NSString *name);
- (void)setSpeed:(float)speed;


@end
