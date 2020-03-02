//
//  Person.m
//  05 task5
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)starTimer {
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil
                                    repeats:YES];
    
    
}

//定时器每隔1秒钟调用的方法
- (void)timerAction:(NSTimer *)timer {
    index++;
    
    NSLog(@"index = %ld",index);
    
    if (index == 5) {
        //终止定时器
        [timer invalidate];
    }
    
}

@end
