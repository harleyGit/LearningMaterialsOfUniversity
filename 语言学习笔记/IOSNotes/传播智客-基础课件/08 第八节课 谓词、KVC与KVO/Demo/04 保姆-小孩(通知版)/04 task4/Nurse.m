//
//  Nurse.m
//  03 task3
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Nurse.h"
#import "Children.h"

@implementation Nurse

- (id)init {
    self = [super init];
    if (self != nil) {
        
        //监听一个通知，通知名为@"hapyValueNotification"， 当收到通知时，调用notificationAction：方法
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationAction:)
                                                     name:@"hapyValueNotification"
                                                   object:nil];
        
    }
    
    return self;
}

- (void)notificationAction:(NSNotification *)notification {
    Children *chil = notification.object;
    [self play:chil];
}

- (void)play:(Children *)chile {
    NSLog(@"保姆逗小孩玩了");
    chile.hapyValue = 100;
}


- (void)dealloc {
    
    //移除指定的通知，通知名：@"hapyValueNotification"
    //[[NSNotificationCenter defaultCenter]
     //removeObserver:self name:@"hapyValueNotification" object:nil];
    
    //移除当前对象上所有的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}

@end
