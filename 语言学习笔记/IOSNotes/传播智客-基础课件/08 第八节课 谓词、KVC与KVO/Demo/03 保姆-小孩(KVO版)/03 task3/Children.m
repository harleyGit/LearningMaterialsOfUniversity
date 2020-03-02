//
//  Children.m
//  03 task3
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Children.h"

@implementation Children

- (id)init {
    self = [super init];
    if (self != nil) {
        
        //启动定时器，1秒钟启动一次
        
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self selector:@selector(timerAction:)
                                       userInfo:nil repeats:YES];
        
        _hapyValue = 100;
        _hungryValue = 100;
        
    }
    return self;
}

- (void)timerAction:(NSTimer *)timer {
    
    //1.使用set方法修改属性值，才能触发KVO
//    self.hapyValue = _hapyValue--;
    
    NSInteger value = _hapyValue;//用来存放旧的值
//    [self setHapyValue:--value];
    
    //2.使用KVC修改属性值，也能触发KVO
    NSNumber *valueNumber = [NSNumber numberWithInteger:--value];
    [self setValue:valueNumber forKey:@"hapyValue"];
    
    
    NSInteger value2 = _hungryValue;
    self.hungryValue = --value2;
}

@end
