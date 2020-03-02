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
        
        //启动定时器
        
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self selector:@selector(timerAction:)
                                       userInfo:nil repeats:YES];
        
        _hapyValue = 100;
        _hungryValue = 100;
        
    }
    return self;
}

- (void)timerAction:(NSTimer *)timer {
    _hapyValue--;
    
    NSLog(@"hapyValue:%ld",_hapyValue);
    
    if (_hapyValue < 80) {
        
        //发送一个通知，通知名为：@"hapyValueNotification"
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hapyValueNotification"
                                                            object:self];
        
    }
    
}

@end
