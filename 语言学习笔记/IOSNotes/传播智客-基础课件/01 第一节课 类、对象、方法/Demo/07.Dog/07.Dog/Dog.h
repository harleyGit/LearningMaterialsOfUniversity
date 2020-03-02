//
//  Dog.h
//  07.Dog
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject {
    
    NSString *_name;  //狗的名字
    NSString *_color;   //狗的颜色
    
}

//自定义初始化方法
- (id)initWithName:(NSString *)name withColor:(NSString *)color;

//跑
- (void)run;

//捡球
- (void)playBall;

//叫
- (void)call;

@end
