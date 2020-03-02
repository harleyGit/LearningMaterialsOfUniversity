//
//  Children.m
//  06 task6
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Children.h"

@implementation Children

- (id)init {
    self = [super init];
    if (self != nil) {
        
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self selector:@selector(timerAction:)
                                       userInfo:nil repeats:YES];
        
    }
    
    return self;
}

//- (void)setNure:(Nure *)nure {
//    _nure = nure;
//}

//- (void)setNanny:(Nanny *)nanny {
//    _nanny = nanny;
//}

- (void)setDelegate:(id<ChildrenDelegate>)delegate {
    _delegate = delegate;
}

- (void)timerAction:(NSTimer *)timer {
    timeValue++;
    
    if (timeValue == 5) {
        //小孩不清洁了
        
        //调用保姆给小孩洗澡
        //[_nure wash:self];
        
        //[_nanny washBoy:self];
        
        [_delegate wash:self];
    }
    if (timeValue == 10) {
        //小孩哭了
        
        //调用保姆给小孩玩耍
        //[_nure play:self];
        
        //[_nanny palyBoy:self];
        
        [_delegate play:self];
    }
}
@end
