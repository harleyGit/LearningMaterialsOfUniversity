//
//  Person.m
//  07.Dog
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initName:(NSString *)name {
    self = [super init];
    if (self != nil) {
        _name = name;
    }
    
    return self;
}

- (void)setDog:(Dog *)dog {
    _dog = dog;
}

/*
 遛狗
 参数：时间值
 */
- (void)playDog:(int)time {
    if(time == 9) {
        //9点让狗跑动
        [_dog run];
    } else if(time == 10) {
        //10点和狗玩捡球的游戏
        [_dog playBall];
    } else if(time == 11) {
        //11点逗狗叫
        [_dog call];
    }
}


@end
